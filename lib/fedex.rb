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
      :price       => [ :shipper, :recipient, :weight ],
      :label       => [ :shipper, :recipient, :weight, :service_type ],
      :contact     => [ :name, :phone_number ],
      :address     => [ :country, :street, :city, :state, :zip ],
      :ship_cancel => [ :tracking_number ]
    }
    
    # Defines the relative path to the WSDL files.  Defaults assume lib/wsdl under plugin directory.
    WSDL_PATHS = {
      :rate => 'wsdl/RateService_v7.wsdl',
      :ship => 'wsdl/ShipService_v7.wsdl',
    }
    
    # Defines the Web Services version implemented.
    WS_VERSION = { :Major => 7, :Intermediate => 0, :Minor => 0, :ServiceId => 'crs' }
    
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
      @rate_request_type  = options[:rate_request_type] || RateRequestTypes::LIST
      @payment_type       = options[:payment]           || PaymentTypes::SENDER
      @units              = options[:units]             || WeightUnits::LB
      @currency           = options[:currency]          || CurrencyTypes::USD
      @debug              = options[:debug]             || false
    end
    
    # Gets a rate quote from Fedex.
    #
    #   fedex = Fedex::Base.new(options)
    #   
    #   single_price = fedex.price(
    #     :shipper => { ... },
    #     :recipient => { ... },
    #     :weight => 1,
    #     :service_type => 'STANDARD_OVERNIGHT'
    #   }
    #   single_price #=> 1315
    #
    #   multiple_prices = fedex.price(
    #     :shipper => { ... },
    #     :recipient => { ... },
    #     :weight => 1
    #   )
    #   multiple_prices #=> { 'STANDARD_OVERNIGHT' => 1315, 'PRIORITY_OVERNIGHT' => 2342, ... }
    #
    # === Required options for price
    #   :shipper              - A hash containing contact information and an address for the shipper.  (See below.)
    #   :recipient            - A hash containing contact information and an address for the recipient.  (See below.)
    #   :weight               - The total weight of the shipped package.
    #
    # === Optional options
    #   :count                - How many packages are in the shipment. Defaults to 1.
    #   :service_type         - One of Fedex::ServiceTypes. If not specified, Fedex gives you rates for all
    #                           of the available service types (and you will receive a hash of prices instead of a
    #                           single price).
    #
    # === Address format
    # The 'shipper' and 'recipient' address values should be hashes. Like this:
    #
    #  address = {
    #    :country => 'US',
    #    :street => '1600 Pennsylvania Avenue NW'
    #    :city => 'Washington',
    #    :state => 'DC',
    #    :zip => '20500'
    #  }
    def price(options = {})
      # Check overall options
      check_required_options(:price, options)
      
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
      count               = options[:count] || 1
      weight              = options[:weight]
                          
      residential         = !!recipient_address[:residential]
                          
      service_type        = resolve_service_type(service_type, residential) if service_type
      
      # Create the driver
      driver = create_driver(:rate)
      
      result = driver.getRates(common_options.merge(
        :RequestedShipment => {
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
          :ShippingChargesPayment => {
            :PaymentType => @payment_type,
            :Payor => {
              :AccountNumber => @account_number,
              :CountryCode => shipper_address[:country]
            }
          },
          :RateRequestTypes => @rate_request_type,
          :PackageCount => count,
          :DropoffType => @dropoff_type,
          :ServiceType => service_type,
          :PackagingType => @packaging_type,
          :PackageDetail => RequestedPackageDetailTypes::INDIVIDUAL_PACKAGES,
          :TotalWeight => { :Units => @units, :Value => weight },
          :RequestedPackageLineItems => [
            :SequenceNumber => 1,
            :Weight => { :Units => @units, :Value => weight }
          ]
        }
      ))
      
      extract_price = proc do |reply_detail|
        shipment_details = reply_detail.ratedShipmentDetails
        price = nil
        for shipment_detail in shipment_details
          rate_detail = shipment_detail.shipmentRateDetail
          if rate_detail.rateType == "PAYOR_#{@rate_request_type}"
            price = (rate_detail.totalNetCharge.amount.to_f * 100).to_i
            break
          end
        end
        if price
          return price
        else
          raise "Couldn't find Fedex price in response!"
        end
      end
      
      msg = error_msg(result, false)
      if successful?(result) && msg !~ /There are no valid services available/
        reply_details = result.rateReplyDetails
        if reply_details.respond_to?(:ratedShipmentDetails)
          price = extract_price.call(reply_details)
          service_type ? price : { reply_details.serviceType => price }
        else
          reply_details.inject({}) {|h,r| h[r.serviceType] = extract_price.call(r); h }
        end
      else
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
    # === Address format
    # The 'shipper' and 'recipient' address values should be hashes. Like this:
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
      count               = options[:count] || 1
      weight              = options[:weight]
      
      time                = options[:time] || Time.now
      time                = time.to_time.iso8601 if time.is_a?(Time)
      
      residential         = !!recipient_address[:residential]
      
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
            :PaymentType => @payment_type,
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
          :PackageCount => count,
          :RequestedPackages => [ {:SequenceNumber=>1, :Weight => {:Units => @units, :Value => weight} } ]
        }
      ))
      
      successful = successful?(result)
      
      msg = error_msg(result, false)
      if successful && msg !~ /There are no valid services available/
        pre = result.completedShipmentDetail.shipmentRating.shipmentRateDetails
        charge = ((pre.class == Array ? pre[0].totalNetCharge.amount.to_f : pre.totalNetCharge.amount.to_f) * 100).to_i
        label = Base64.decode64(result.completedShipmentDetail.completedPackageDetails.label.parts.image)
        tracking_number = result.completedShipmentDetail.completedPackageDetails.trackingId.trackingNumber
        [charge, label, tracking_number]
      else
        raise FedexError.new("Unable to get label from Fedex: #{msg}")
      end
    end
    
    # Cancel a shipment
    #
    #  fedex = Fedex::Base.new(options)
    #  result = fedex.cancel(options)
    #
    # Returns a boolean indicating whether or not the operation was successful
    #
    # === Required options for cancel
    #   :tracking_number - The Fedex-provided tracking number you wish to cancel
    def cancel(options = {})
      check_required_options(:ship_cancel, options)
      
      tracking_number = options[:tracking_number]
      
      driver = create_driver(:ship)
      
      result = driver.deleteShipment(common_options.merge(
        :TrackingNumber => tracking_number
      ))

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
      # /s+(1000|0|9c9|fcc)\s+/ => ""
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
        SUCCESSFUL_RESPONSES.any? {|r| r == result.cancelPackageReply.highestSeverity }
      else
        SUCCESSFUL_RESPONSES.any? {|r| r == result.highestSeverity }
      end
    end
    
    # Returns the error message contained in the SOAP response, if one exists.
    def error_msg(result, return_nothing_if_successful=true)
      return "" if successful?(result) && return_nothing_if_successful
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
  
end