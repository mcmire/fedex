# Copyright (c) 2007 Joseph Jaramillo
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

module Fedex #:nodoc:
  
  class MissingInformationError < StandardError; end #:nodoc:
  class FedexError < StandardError; end #:nodoc
  
  # Provides access to Fedex Web Services
  class Base
    
    # Defines the required parameters for various methods
    REQUIRED_OPTIONS = {
      :base        => [ :auth_key, :security_code, :account_number, :meter_number ],
      :price       => [ :origin, :destination, :service_type, :count, :weight ],
      :label       => [ :shipper, :recipient, :weight, :service_type ],
      :contact     => [ :name, :phone_number ],
      :address     => [ :country, :street, :city, :state, :zip ],
      :ship_cancel => [ :tracking_number ]
    }
    
    # Defines the relative path to the WSDL files.  Defaults assume lib/wsdl under plugin directory.
    WSDL_PATHS = {
      :price       => 'wsdl/RateService_v3.wsdl',
      :ship        => 'wsdl/ShipService_v3.wsdl',
      :ship_cancel => 'wsdl/CancelPackageService.wsdl'
    }
    
    # Defines the Web Services version implemented.
    WS_VERSION = { :Major => 3, :Intermediate => 0, :Minor => 0, :ServiceId => 'crs' }
    
    SUCCESSFUL_RESPONSES = ['SUCCESS', 'WARNING', 'NOTE'] #:nodoc:
    
    DIR = File.dirname(__FILE__)
    
    attr_accessor :auth_key,
                  :security_code,
                  :account_number,
                  :meter_number,
                  :dropoff_type,
                  :service_type,
                  :units,
                  :packaging_type,
                  :sender,
                  :debug
    
    # Initializes the Fedex::Base class, setting defaults where necessary.
    # 
    #  fedex = Fedex::Base.new(options = {})
    #
    # === Example:
    #   fedex = Fedex::Base.new(:auth_key       => AUTH_KEY,
    #                           :security_code  => SECURITY_CODE
    #                           :account_number => ACCOUNT_NUMBER,
    #                           :meter_number   => METER_NUMBER)
    #
    # === Required options for new
    #   :auth_key       - Your Fedex Authorization Key
    #   :security_code  - Your Fedex Security Code
    #   :account_number - Your Fedex Account Number
    #   :meter_number   - Your Fedex Meter Number
    #
    # === Additional options
    #   :dropoff_type       - One of Fedex::DropoffTypes.  Defaults to DropoffTypes::REGULAR_PICKUP
    #   :packaging_type     - One of Fedex::PackagingTypes.  Defaults to PackagingTypes::YOUR_PACKAGING
    #   :label_type         - One of Fedex::LabelFormatTypes.  Defaults to LabelFormatTypes::COMMON2D.  You'll only need to change this
    #                         if you're generating completely custom labels with a format of your own design.  If printing to Fedex stock
    #                         leave this alone.
    #   :label_image_type   - One of Fedex::LabelSpecificationImageTypes.  Defaults to LabelSpecificationImageTypes::PDF.
    #   :rate_request_type  - One of Fedex::RateRequestTypes.  Defaults to RateRequestTypes::ACCOUNT
    #   :payment            - One of Fedex::PaymentTypes.  Defaults to PaymentTypes::SENDER
    #   :units              - One of Fedex::WeightUnits.  Defaults to WeightUnits::LB
    #   :currency           - One of Fedex::CurrencyTypes.  Defaults to CurrencyTypes::USD
    #   :debug              - Enable or disable debug (wiredump) output.  Defaults to false.
    def initialize(options = {})
      check_required_options(:base, options)
      
      @auth_key           = options[:auth_key]
      @security_code      = options[:security_code]
      @account_number     = options[:account_number]
      @meter_number       = options[:meter_number]
                        
      @dropoff_type       = options[:dropoff_type]      || DropoffTypes::REGULAR_PICKUP
      @packaging_type     = options[:packaging_type]    || PackagingTypes::YOUR_PACKAGING
      @label_type         = options[:label_type]        || LabelFormatTypes::COMMON2D
      @label_image_type   = options[:label_image_type]  || LabelSpecificationImageTypes::PDF
      @rate_request_type  = options[:rate_request_type] || RateRequestTypes::ACCOUNT
      @payment            = options[:payment]           || PaymentTypes::SENDER
      @units              = options[:units]             || WeightUnits::LB
      @currency           = options[:currency]          || CurrencyTypes::USD
      @debug              = options[:debug]             || false
    end
    
    # Gets a rate quote from Fedex.
    #
    #  > fedex = Fedex::Base.new(options)
    #  > price = fedex.price(fields)
    # 
    #  > price
    #  8642
    #
    # === Required options for price
    #   :origin       - Origin address.  (See below.)
    #   :destination  - Destination address. (See below.)
    #   :service_type - One of Fedex::ServiceTypes
    #   :count        - The number of packages in your shipment.
    #   :weight       - The total weight of your shipment.
    #
    # === Addresses
    # Addresses are supplied to the system as a hash as follows
    #
    #  address = {:country => 'US',
    #             :street => '1600 Pennsylvania Avenue NW'
    #             :state => 'DC',
    #             :city => 'Washington',
    #             :zip => '20500'}
    def price(options = {})
      # Check overall options
      check_required_options(:price, options)
      
      # Check Address Options
      check_required_options(:address, options[:origin])
      check_required_options(:address, options[:destination])
            
      # Prepare variables
      origin        = options[:origin]
      destination   = options[:destination]
      service_type  = options[:service_type]
      count         = options[:count]
      weight        = options[:weight]
      
      residential   = destination[:residential] ? destination[:residential] : false
      
      service_type  = resolve_service_type(service_type, residential)
      
      # Create the driver
      driver = create_driver(:price)
      
      result = driver.getRate(common_options.merge(
        :Origin => {
          :CountryCode => origin[:country],
          :StreetLines => origin[:street],
          :City => origin[:city],
          :StateOrProvinceCode => origin[:state],
          :PostalCode => origin[:zip]
        },
        :Destination => {
          :CountryCode => destination[:country],
          :StreetLines => destination[:street],
          :City => destination[:city],
          :StateOrProvinceCode => destination[:state],
          :PostalCode => destination[:zip],
          :Residential => residential
        },
        :DropoffType => @dropoff_type,
        :ServiceType => service_type,
        :PackagingType => @packaging_type,
        :Payment => @payment,
        :RateRequestPackageSummary => {
          :PieceCount => count,
          :TotalWeight => { :Units => @units, :Value => weight }
        }
      ))
      
      successful = successful?(result)
      
      if successful
        details = result.ratedShipmentDetails
        detail = details.respond_to?(:shipmentRateDetail) ? details.shipmentRateDetail : details.first.shipmentRateDetail
        (detail.totalNetCharge.amount.to_f * 100).to_i
      else
        msg = error_msg(result)
        raise FedexError.new("Unable to retrieve price from Fedex: #{msg}")
      end
    end
    
    # Generate a new shipment and return associated data, including price, tracking number, and the label itself.
    #
    #  fedex = Fedex::Base.new(options)
    #  price, label, tracking_number = fedex.label(fields)
    #
    # Returns the actual price for the label, the Base64-decoded label in the format specified in Fedex::Base,
    # and the tracking_number for the shipment.
    #
    # === Required options for label
    #   :shipper      - A hash containing contact information and an address for the shipper.  (See below.)
    #   :recipient    - A hash containing contact information and an address for the recipient.  (See below.)
    #   :weight       - The total weight of the shipped package.
    #   :service_type - One of Fedex::ServiceTypes
    #
    # === :shipper and :recipient
    # Shipper and recipient should be as a hash with two keys as follows:
    #
    #  shipper = {:contact => {:name => 'John Doe',
    #                          :phone_number => '4805551212'},
    #             :address => address} # See "Address" for under price.
    def label(options = {})
      puts options.inspect if $DEBUG
      # Check overall options
      check_required_options(:label, options)
      
      # Check Address Options
      check_required_options(:contact, options[:shipper][:contact])
      check_required_options(:address, options[:shipper][:address])
      
      # Check Contact Options
      check_required_options(:contact, options[:recipient][:contact])
      check_required_options(:address, options[:recipient][:address])
      
      # Prepare variables
      shipper             = options[:shipper]
      recipient           = options[:recipient]
      
      shipper_contact     = shipper[:contact]
      shipper_address     = shipper[:address]
      
      recipient_contact   = recipient[:contact]
      recipient_address   = recipient[:address]
      
      service_type        = options[:service_type]
      weight              = options[:weight]
      
      time                = options[:time] || Time.now
      time                = time.to_time.iso8601 if time.is_a?(Time)
      
      residential         = recipient_address[:residential] ? recipient_address[:residential] : false
      
      service_type        = resolve_service_type(service_type, residential)
      
      # Create the driver
      driver = create_driver(:ship)
      
      result = driver.processShipment(common_options.merge(
        :RequestedShipment => {
          :ShipTimestamp => time,
          :DropoffType => @dropoff_type,
          :ServiceType => service_type,
          :PackagingType => @packaging_type,
          :TotalWeight => { :Units => @units, :Value => weight },
          :PreferredCurrency => @currency,
          :Shipper => {
            :Contact => {
              :PersonName => shipper_contact[:name],
              :PhoneNumber => shipper_contact[:phone_number]
            },
            :Address => {
              :CountryCode => shipper_address[:country],
              :StreetLines => shipper_address[:street],
              :City => shipper_address[:city],
              :StateOrProvinceCode => shipper_address[:state],
              :PostalCode => shipper_address[:zip]
            }
          },
          :Recipient => {
            :Contact => {
              :PersonName => recipient_contact[:name],
              :PhoneNumber => recipient_contact[:phone_number]
            },
            :Address => {
              :CountryCode => recipient_address[:country],
              :StreetLines => recipient_address[:street],
              :City => recipient_address[:city],
              :StateOrProvinceCode => recipient_address[:state],
              :PostalCode => recipient_address[:zip],
              :Residential => residential
            }
          },
          :Origin => {},
          :ShippingChargesPayment => {
            :PaymentType => @payment,
            :Payor => {
              :AccountNumber => @account_number,
              :CountryCode => shipper_address[:country]
            }
          },
          :LabelSpecification => {
            :LabelFormatType => @label_type,
            :ImageType => @label_image_type
          },
          :RateRequestTypes => @rate_request_type,
          :RequestedPackages => [ { :Weight => {:Units => @units, :Value => weight} } ]
        }
      ))
      
      successful = successful?(result)
      
      if successful
        pre = result.completedShipmentDetail.shipmentRating.shipmentRateDetails
        charge = ((pre.class == Array ? pre[0].totalNetCharge.amount.to_f : pre.totalNetCharge.amount.to_f) * 100).to_i
        label = Base64.decode64(result.completedShipmentDetail.completedPackageDetails.label.parts.image)
        tracking_number = result.completedShipmentDetail.completedPackageDetails.trackingId.trackingNumber
        [charge, label, tracking_number]
      else
        msg = error_msg(result)
        raise FedexError.new("Unable to retrieve price from Fedex: #{msg}")
      end
    end
    
    # Cancel a shipment
    #
    #  fedex = Fedex::Base.new(options)
    #  result = fedex.cancel(fields)
    #
    # Returns a boolean indicating whether or not the operation was successful
    #
    # === Required options for cancel
    #   :tracking_number - The Fedex-provided tracking number you wish to cancel
    #
    # === Optional options for cancel
    #   :carrier_code    - The four-letter abbreviation for the Fedex service used for the shipment to be canceled.
    #                      Plugin handles Ground and Express shipments automatically based on tracking number length.
    def cancel(options = {})
      check_required_options(:ship_cancel, options)
      
      tracking_number = options[:tracking_number]
      carrier_code    = options[:carrier_code] || carrier_code_for_tracking_number(tracking_number)
      
      driver = create_driver(:ship_cancel)
      
      result = driver.cancelPackage(
        :CancelPackageRequest => common_options.merge(
          :CarrierCode => carrier_code,
          :TrackingNumber => tracking_number
        )
      )

      return successful?(result)
    end
    
  private
    # Options that go along with each request
    def common_options
      {
        :WebAuthenticationDetail => { :UserCredential => { :Key => @auth_key, :Password => @security_code } },
        :ClientDetail => { :AccountNumber => @account_number, :MeterNumber => @meter_number },
        :Version => WS_VERSION
      }
    end
  
    # Checks the supplied options for a given method or field and throws an exception if anything is missing
    def check_required_options(option_set_name, options = {})
      required_options = REQUIRED_OPTIONS[option_set_name]
      missing = []
      required_options.each{|option| missing << option if options[option].nil?}
      
      unless missing.empty?
        raise MissingInformationError.new("Missing #{missing.collect{|m| ":#{m}"}.join(', ')}")
      end
    end
    
    # Creates and returns a driver for the requested action
    def create_driver(name)
      path = File.expand_path(DIR + '/' + WSDL_PATHS[name])
      wsdl = SOAP::WSDLDriverFactory.new(path)
      driver = wsdl.create_rpc_driver
      driver.wiredump_dev = STDOUT if @debug
      
      driver
    end
    
    # Resolves the ground+residential discrepancy.  If a package is shipped via Fedex Ground to an address marked as residential the service type
    # must be set to ServiceTypes::GROUND_HOME_DELIVERY and not ServiceTypes::FEDEX_GROUND.
    def resolve_service_type(service_type, residential)
      if residential && (service_type == ServiceTypes::FEDEX_GROUND)
        ServiceTypes::GROUND_HOME_DELIVERY
      else
        service_type
      end
    end
    
    # Returns a boolean determining whether a request was successful.
    def successful?(result)
      if defined?(result.cancelPackageReply)
        SUCCESSFUL_RESPONSES.detect{|r| r == result.cancelPackageReply.highestSeverity} ? true : false
      else
        SUCCESSFUL_RESPONSES.detect{|r| r == result.highestSeverity} ? true : false
      end
    end
    
    # Returns the error message contained in the SOAP response, if one exists.
    def error_msg(result)
      return "" if successful?(result)
      notes = result.notifications
      notes.respond_to?(:message) ? notes.message : notes.first.message
    end
    
    # Attempts to determine the carrier code for a tracking number based upon its length.  Currently supports Fedex Ground and Fedex Express
    def carrier_code_for_tracking_number(tracking_number)
      case tracking_number.length
      when 12
        'FDXE'
      when 15
        'FDXG'
      end
    end
  end
  
  # The following modules were created by running wsdl2ruby.rb on the various WSDLs and pulling out the appropriate data.
  # These are provided primarily for convenience.
  module ServiceTypes
    EUROPE_FIRST_INTERNATIONAL_PRIORITY   = "EUROPE_FIRST_INTERNATIONAL_PRIORITY"
    FEDEX_1_DAY_FREIGHT                   = "FEDEX_1_DAY_FREIGHT"
    FEDEX_2_DAY                           = "FEDEX_2_DAY"
    FEDEX_2_DAY_FREIGHT                   = "FEDEX_2_DAY_FREIGHT"
    FEDEX_3_DAY_FREIGHT                   = "FEDEX_3_DAY_FREIGHT"
    FEDEX_EXPRESS_SAVER                   = "FEDEX_EXPRESS_SAVER"
    FEDEX_GROUND                          = "FEDEX_GROUND"
    FIRST_OVERNIGHT                       = "FIRST_OVERNIGHT"
    GROUND_HOME_DELIVERY                  = "GROUND_HOME_DELIVERY"
    INTERNATIONAL_DISTRIBUTION_FREIGHT    = "INTERNATIONAL_DISTRIBUTION_FREIGHT"
    INTERNATIONAL_ECONOMY                 = "INTERNATIONAL_ECONOMY"
    INTERNATIONAL_ECONOMY_DISTRIBUTION    = "INTERNATIONAL_ECONOMY_DISTRIBUTION"
    INTERNATIONAL_ECONOMY_FREIGHT         = "INTERNATIONAL_ECONOMY_FREIGHT"
    INTERNATIONAL_FIRST                   = "INTERNATIONAL_FIRST"
    INTERNATIONAL_PRIORITY                = "INTERNATIONAL_PRIORITY"
    INTERNATIONAL_PRIORITY_DISTRIBUTION   = "INTERNATIONAL_PRIORITY_DISTRIBUTION"
    INTERNATIONAL_PRIORITY_FREIGHT        = "INTERNATIONAL_PRIORITY_FREIGHT"
    PRIORITY_OVERNIGHT                    = "PRIORITY_OVERNIGHT"
    STANDARD_OVERNIGHT                    = "STANDARD_OVERNIGHT"
  end
  
  module PackagingTypes
    FEDEX_10KG_BOX                        = "FEDEX_10KG_BOX"
    FEDEX_25KG_BOX                        = "FEDEX_25KG_BOX"
    FEDEX_BOX                             = "FEDEX_BOX"
    FEDEX_ENVELOPE                        = "FEDEX_ENVELOPE"
    FEDEX_PAK                             = "FEDEX_PAK"
    FEDEX_TUBE                            = "FEDEX_TUBE"
    YOUR_PACKAGING                        = "YOUR_PACKAGING"
  end
    
  module DropoffTypes
    BUSINESS_SERVICE_CENTER               = "BUSINESS_SERVICE_CENTER"
    DROP_BOX                              = "DROP_BOX"
    REGULAR_PICKUP                        = "REGULAR_PICKUP"
    REQUEST_COURIER                       = "REQUEST_COURIER"
    STATION                               = "STATION"
  end
  
  module PaymentTypes
    RECIPIENT                             = "RECIPIENT"
    SENDER                                = "SENDER"
    THIRD_PARTY                           = "THIRD_PARTY"
  end
  
  module RateRequestTypes
    ACCOUNT                               = "ACCOUNT"
    LIST                                  = "LIST"
  end
  
  module WeightUnits
    KG                                    = "KG"
    LB                                    = "LB"
  end
  
  module LinearUnits
    CM                                    = "CM"
    IN                                    = "IN"
  end
  
  module CurrencyTypes
    USD                                   = "USD"
  end
  
  module LabelFormatTypes
    COMMON2D                              = "COMMON2D"
    LABEL_DATA_ONLY                       = "LABEL_DATA_ONLY"
  end
  
  module LabelSpecificationImageTypes
    DPL                                   = "DPL"
    EPL2                                  = "EPL2"
    PDF                                   = "PDF"
    PNG                                   = "PNG"
    ZPLII                                 = "ZPLII"
  end
  
  module LabelStockTypes
    PAPER_4X6                             = "PAPER_4X6"
    PAPER_7X475                           = "PAPER_7X475"
    STOCK_4X6                             = "STOCK_4X6"
    STOCK_4X675_LEADING_DOC_TAB           = "STOCK_4X675_LEADING_DOC_TAB"
    STOCK_4X8                             = "STOCK_4X8"
    STOCK_4X9_LEADING_DOC_TAB             = "STOCK_4X9_LEADING_DOC_TAB"
  end
  
end