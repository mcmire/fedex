module Fedex

  # The following constants were created by running wsdl2ruby.rb on the Rate WSDL and
  # pulling out the appropriate data. These are provided primarily for convenience.

  # {http://fedex.com/ws/rate/v5}PickupRequestType
  module PickupRequestTypes
    FUTURE_DAY = "FUTURE_DAY"
    SAME_DAY = "SAME_DAY"
  end

  # {http://fedex.com/ws/rate/v5}PickupRequestSourceType
  module PickupRequestSourceTypess
    AUTOMATION = "AUTOMATION"
    CUSTOMER_SERVICE = "CUSTOMER_SERVICE"
  end

  # {http://fedex.com/ws/rate/v5}RequestedPackageDetailType
  module RequestedPackageDetailTypes
    INDIVIDUAL_PACKAGES = "INDIVIDUAL_PACKAGES"
    PACKAGE_SUMMARY = "PACKAGE_SUMMARY"
  end

  # {http://fedex.com/ws/rate/v5}ClearanceBrokerageType
  module ClearanceBrokerageTypes
    BROKER_INCLUSIVE = "BROKER_INCLUSIVE"
    BROKER_INCLUSIVE_NON_RESIDENT_IMPORTER = "BROKER_INCLUSIVE_NON_RESIDENT_IMPORTER"
    BROKER_SELECT = "BROKER_SELECT"
    BROKER_SELECT_NON_RESIDENT_IMPORTER = "BROKER_SELECT_NON_RESIDENT_IMPORTER"
    BROKER_UNASSIGNED = "BROKER_UNASSIGNED"
  end

  # {http://fedex.com/ws/rate/v5}RegulatoryControlType
  module RegulatoryControlTypes
    EU_CIRCULATION = "EU_CIRCULATION"
    FOOD_OR_PERISHABLE = "FOOD_OR_PERISHABLE"
    NAFTA = "NAFTA"
  end

  # {http://fedex.com/ws/rate/v5}RecipientCustomsIdType
  module RecipientCustomsIdTypes
    COMPANY = "COMPANY"
    INDIVIDUAL = "INDIVIDUAL"
    PASSPORT = "PASSPORT"
  end

  # {http://fedex.com/ws/rate/v5}AdmissibilityPackageType
  module AdmissibilityPackageTypes
    BAG = "BAG"
    BBL = "BBL"
    BDL = "BDL"
    BOX = "BOX"
    BSK = "BSK"
    BXT = "BXT"
    CAG = "CAG"
    CAS = "CAS"
    CHS = "CHS"
    CNT = "CNT"
    CRT = "CRT"
    CTN = "CTN"
    CYL = "CYL"
    DRM = "DRM"
    ENV = "ENV"
    PAL = "PAL"
    PCL = "PCL"
    PCS = "PCS"
    PKG = "PKG"
    PLT = "PLT"
    REL = "REL"
    ROL = "ROL"
    SAK = "SAK"
    SHW = "SHW"
    SKD = "SKD"
    TBE = "TBE"
    TBN = "TBN"
    TNK = "TNK"
    UNT = "UNT"
  end

  # {http://fedex.com/ws/rate/v5}DestinationControlStatementType
  module DestinationControlStatementTypes
    DEPARTMENT_OF_COMMERCE = "DEPARTMENT_OF_COMMERCE"
    DEPARTMENT_OF_STATE = "DEPARTMENT_OF_STATE"
  end

  # {http://fedex.com/ws/rate/v5}B13AFilingOptionType
  module B13AFilingOptionTypes
    FILED_ELECTRONICALLY = "FILED_ELECTRONICALLY"
    MANUALLY_ATTACHED = "MANUALLY_ATTACHED"
    NOT_REQUIRED = "NOT_REQUIRED"
    SUMMARY_REPORTING = "SUMMARY_REPORTING"
  end

  # {http://fedex.com/ws/rate/v5}TermsOfSaleType
  module TermsOfSaleTypes
    CFR_OR_CPT = "CFR_OR_CPT"
    CIF_OR_CIP = "CIF_OR_CIP"
    DDP = "DDP"
    DDU = "DDU"
    EXW = "EXW"
    FOB_OR_FCA = "FOB_OR_FCA"
  end

  # {http://fedex.com/ws/rate/v5}PurposeOfShipmentType
  module PurposeOfShipmentTypes
    GIFT = "GIFT"
    NOT_SOLD = "NOT_SOLD"
    PERSONAL_EFFECTS = "PERSONAL_EFFECTS"
    REPAIR_AND_RETURN = "REPAIR_AND_RETURN"
    SAMPLE = "SAMPLE"
    SOLD = "SOLD"
  end

  # {http://fedex.com/ws/rate/v5}InternationalDocumentContentType
  module InternationalDocumentContentTypes
    DOCUMENTS_ONLY = "DOCUMENTS_ONLY"
    NON_DOCUMENTS = "NON_DOCUMENTS"
  end

  # {http://fedex.com/ws/rate/v5}NaftaImportSpecificationType
  module NaftaImportSpecificationTypes
    IMPORTER_OF_RECORD = "IMPORTER_OF_RECORD"
    RECIPIENT = "RECIPIENT"
    UNKNOWN = "UNKNOWN"
    VARIOUS = "VARIOUS"
  end

  # {http://fedex.com/ws/rate/v5}NaftaNetCostMethodCode
  module NaftaNetCostMethodCode
    NC = "NC"
    NO = "NO"
  end

  # {http://fedex.com/ws/rate/v5}NaftaPreferenceCriterionCode
  module NaftaPreferenceCriterionCode
    A = "A"
    B = "B"
    C = "C"
    D = "D"
    E = "E"
    F = "F"
  end

  # {http://fedex.com/ws/rate/v5}NaftaProducerDeterminationCode
  module NaftaProducerDeterminationCode
    NO_1 = "NO_1"
    NO_2 = "NO_2"
    NO_3 = "NO_3"
    YES = "YES"
  end

  # {http://fedex.com/ws/rate/v5}NaftaProducerSpecificationType
  module NaftaProducerSpecificationTypes
    AVAILABLE_UPON_REQUEST = "AVAILABLE_UPON_REQUEST"
    MULTIPLE_SPECIFIED = "MULTIPLE_SPECIFIED"
    SAME = "SAME"
    SINGLE_SPECIFIED = "SINGLE_SPECIFIED"
    UNKNOWN = "UNKNOWN"
  end

  # {http://fedex.com/ws/rate/v5}DropoffType
  module DropoffTypes
    BUSINESS_SERVICE_CENTER = "BUSINESS_SERVICE_CENTER"
    DROP_BOX = "DROP_BOX"
    REGULAR_PICKUP = "REGULAR_PICKUP"
    REQUEST_COURIER = "REQUEST_COURIER"
    STATION = "STATION"
  end

  # {http://fedex.com/ws/rate/v5}ServiceType
  module ServiceTypes
    EUROPE_FIRST_INTERNATIONAL_PRIORITY = "EUROPE_FIRST_INTERNATIONAL_PRIORITY"
    FEDEX_1_DAY_FREIGHT = "FEDEX_1_DAY_FREIGHT"
    FEDEX_2_DAY = "FEDEX_2_DAY"
    FEDEX_2_DAY_FREIGHT = "FEDEX_2_DAY_FREIGHT"
    FEDEX_3_DAY_FREIGHT = "FEDEX_3_DAY_FREIGHT"
    FEDEX_EXPRESS_SAVER = "FEDEX_EXPRESS_SAVER"
    FEDEX_GROUND = "FEDEX_GROUND"
    FIRST_OVERNIGHT = "FIRST_OVERNIGHT"
    GROUND_HOME_DELIVERY = "GROUND_HOME_DELIVERY"
    INTERNATIONAL_ECONOMY = "INTERNATIONAL_ECONOMY"
    INTERNATIONAL_ECONOMY_FREIGHT = "INTERNATIONAL_ECONOMY_FREIGHT"
    INTERNATIONAL_FIRST = "INTERNATIONAL_FIRST"
    INTERNATIONAL_PRIORITY = "INTERNATIONAL_PRIORITY"
    INTERNATIONAL_PRIORITY_FREIGHT = "INTERNATIONAL_PRIORITY_FREIGHT"
    PRIORITY_OVERNIGHT = "PRIORITY_OVERNIGHT"
    STANDARD_OVERNIGHT = "STANDARD_OVERNIGHT"
  end

  # {http://fedex.com/ws/rate/v5}PackagingType
  module PackagingTypes
    FEDEX_10KG_BOX = "FEDEX_10KG_BOX"
    FEDEX_25KG_BOX = "FEDEX_25KG_BOX"
    FEDEX_BOX = "FEDEX_BOX"
    FEDEX_ENVELOPE = "FEDEX_ENVELOPE"
    FEDEX_PAK = "FEDEX_PAK"
    FEDEX_TUBE = "FEDEX_TUBE"
    YOUR_PACKAGING = "YOUR_PACKAGING"
  end

  # {http://fedex.com/ws/rate/v5}RateRequestType
  module RateRequestTypes
    ACCOUNT = "ACCOUNT"
    LIST = "LIST"
    MULTIWEIGHT = "MULTIWEIGHT"
  end

  # {http://fedex.com/ws/rate/v5}CarrierCodeType
  module CarrierCodeTypes
    FDXE = "FDXE"
    FDXG = "FDXG"
  end

  # {http://fedex.com/ws/rate/v5}ShipmentSpecialServiceType
  module ShipmentSpecialServiceTypes
    BROKER_SELECT_OPTION = "BROKER_SELECT_OPTION"
    COD = "COD"
    DRY_ICE = "DRY_ICE"
    EAST_COAST_SPECIAL = "EAST_COAST_SPECIAL"
    EMAIL_NOTIFICATION = "EMAIL_NOTIFICATION"
    FUTURE_DAY_SHIPMENT = "FUTURE_DAY_SHIPMENT"
    HOLD_AT_LOCATION = "HOLD_AT_LOCATION"
    HOLD_SATURDAY = "HOLD_SATURDAY"
    HOME_DELIVERY_PREMIUM = "HOME_DELIVERY_PREMIUM"
    INSIDE_DELIVERY = "INSIDE_DELIVERY"
    INSIDE_PICKUP = "INSIDE_PICKUP"
    PENDING_COMPLETE = "PENDING_COMPLETE"
    PENDING_SHIPMENT = "PENDING_SHIPMENT"
    RETURN_SHIPMENT = "RETURN_SHIPMENT"
    SATURDAY_DELIVERY = "SATURDAY_DELIVERY"
    SATURDAY_PICKUP = "SATURDAY_PICKUP"
    THIRD_PARTY_CONSIGNEE = "THIRD_PARTY_CONSIGNEE"
    WEEKDAY_DELIVERY = "WEEKDAY_DELIVERY"
  end

  # {http://fedex.com/ws/rate/v5}PaymentType
  module PaymentTypes
    SENDER = "SENDER"
  end

  # {http://fedex.com/ws/rate/v5}OversizeClassType
  module OversizeClassTypes
    OVERSIZE_1 = "OVERSIZE_1"
    OVERSIZE_2 = "OVERSIZE_2"
    OVERSIZE_3 = "OVERSIZE_3"
  end

  # {http://fedex.com/ws/rate/v5}WeightUnits
  module WeightUnits
    KG = "KG"
    LB = "LB"
  end

  # {http://fedex.com/ws/rate/v5}LinearUnits
  module LinearUnits
    CM = "CM"
    IN = "IN"
  end
  
  # honestly I don't know where this went to?
  module CurrencyTypes
    USD = "USD"
  end

  # {http://fedex.com/ws/rate/v5}SignatureOptionType
  module SignatureOptionTypes
    ADULT = "ADULT"
    DIRECT = "DIRECT"
    INDIRECT = "INDIRECT"
    NO_SIGNATURE_REQUIRED = "NO_SIGNATURE_REQUIRED"
    SERVICE_DEFAULT = "SERVICE_DEFAULT"
  end

  # {http://fedex.com/ws/rate/v5}PackageSpecialServiceType
  module PackageSpecialServiceTypes
    APPOINTMENT_DELIVERY = "APPOINTMENT_DELIVERY"
    DANGEROUS_GOODS = "DANGEROUS_GOODS"
    DRY_ICE = "DRY_ICE"
    NON_STANDARD_CONTAINER = "NON_STANDARD_CONTAINER"
    PRIORITY_ALERT = "PRIORITY_ALERT"
    SIGNATURE_OPTION = "SIGNATURE_OPTION"
  end

  # {http://fedex.com/ws/rate/v5}CodAddTransportationChargesType
  module CodAddTransportationChargesTypes
    ADD_ACCOUNT_COD_SURCHARGE = "ADD_ACCOUNT_COD_SURCHARGE"
    ADD_ACCOUNT_NET_CHARGE = "ADD_ACCOUNT_NET_CHARGE"
    ADD_ACCOUNT_NET_FREIGHT = "ADD_ACCOUNT_NET_FREIGHT"
    ADD_ACCOUNT_TOTAL_CUSTOMER_CHARGE = "ADD_ACCOUNT_TOTAL_CUSTOMER_CHARGE"
    ADD_LIST_COD_SURCHARGE = "ADD_LIST_COD_SURCHARGE"
    ADD_LIST_NET_CHARGE = "ADD_LIST_NET_CHARGE"
    ADD_LIST_NET_FREIGHT = "ADD_LIST_NET_FREIGHT"
    ADD_LIST_TOTAL_CUSTOMER_CHARGE = "ADD_LIST_TOTAL_CUSTOMER_CHARGE"
    ADD_SHIPMENT_MULTIWEIGHT_NET_CHARGE = "ADD_SHIPMENT_MULTIWEIGHT_NET_CHARGE"
    ADD_SHIPMENT_MULTIWEIGHT_NET_FREIGHT = "ADD_SHIPMENT_MULTIWEIGHT_NET_FREIGHT"
    ADD_SUM_OF_ACCOUNT_NET_CHARGES = "ADD_SUM_OF_ACCOUNT_NET_CHARGES"
    ADD_SUM_OF_ACCOUNT_NET_FREIGHT = "ADD_SUM_OF_ACCOUNT_NET_FREIGHT"
    ADD_SUM_OF_LIST_NET_CHARGES = "ADD_SUM_OF_LIST_NET_CHARGES"
    ADD_SUM_OF_LIST_NET_FREIGHT = "ADD_SUM_OF_LIST_NET_FREIGHT"
  end

  # {http://fedex.com/ws/rate/v5}CodCollectionType
  module CodCollectionTypes
    ANY = "ANY"
    CASH = "CASH"
    GUARANTEED_FUNDS = "GUARANTEED_FUNDS"
  end

  # {http://fedex.com/ws/rate/v5}CodReturnReferenceIndicatorType
  module CodReturnReferenceIndicatorTypes
    INVOICE = "INVOICE"
    PO = "PO"
    REFERENCE = "REFERENCE"
    TRACKING = "TRACKING"
  end

  # {http://fedex.com/ws/rate/v5}TinType
  module TinTypes
    EIN = "EIN"
    SSN = "SSN"
  end

  # {http://fedex.com/ws/rate/v5}DangerousGoodsAccessibilityType
  module DangerousGoodsAccessibilityTypes
    ACCESSIBLE = "ACCESSIBLE"
    INACCESSIBLE = "INACCESSIBLE"
  end

  # {http://fedex.com/ws/rate/v5}EMailNotificationRecipientType
  module EMailNotificationRecipientTypes
    BROKER = "BROKER"
    OTHER = "OTHER"
    RECIPIENT = "RECIPIENT"
    SHIPPER = "SHIPPER"
  end

  # {http://fedex.com/ws/rate/v5}EMailNotificationFormatType
  module EMailNotificationFormatTypes
    HTML = "HTML"
    TEXT = "TEXT"
    WIRELESS = "WIRELESS"
  end

  # {http://fedex.com/ws/rate/v5}ReturnType
  module ReturnTypes
    FEDEX_TAG = "FEDEX_TAG"
    PENDING = "PENDING"
    PRINT_RETURN_LABEL = "PRINT_RETURN_LABEL"
  end

  # {http://fedex.com/ws/rate/v5}ReturnEMailAllowedSpecialServiceType
  module ReturnEMailAllowedSpecialServiceTypes
    SATURDAY_DELIVERY = "SATURDAY_DELIVERY"
    SATURDAY_PICKUP = "SATURDAY_PICKUP"
  end

  # {http://fedex.com/ws/rate/v5}HomeDeliveryPremiumType
  module HomeDeliveryPremiumTypes
    APPOINTMENT = "APPOINTMENT"
    DATE_CERTAIN = "DATE_CERTAIN"
    EVENING = "EVENING"
  end

  # {http://fedex.com/ws/rate/v5}CustomerReferenceType
  module CustomerReferenceTypes
    BILL_OF_LADING = "BILL_OF_LADING"
    CUSTOMER_REFERENCE = "CUSTOMER_REFERENCE"
    DEPARTMENT_NUMBER = "DEPARTMENT_NUMBER"
    ELECTRONIC_PRODUCT_CODE = "ELECTRONIC_PRODUCT_CODE"
    INVOICE_NUMBER = "INVOICE_NUMBER"
    P_O_NUMBER = "P_O_NUMBER"
    SHIPMENT_INTEGRITY = "SHIPMENT_INTEGRITY"
    STORE_NUMBER = "STORE_NUMBER"
  end

  # {http://fedex.com/ws/rate/v5}VariableHandlingChargeType
  module VariableHandlingChargeTypes
    FIXED_AMOUNT = "FIXED_AMOUNT"
    PERCENTAGE_OF_NET_CHARGE = "PERCENTAGE_OF_NET_CHARGE"
    PERCENTAGE_OF_NET_CHARGE_EXCLUDING_TAXES = "PERCENTAGE_OF_NET_CHARGE_EXCLUDING_TAXES"
    PERCENTAGE_OF_NET_FREIGHT = "PERCENTAGE_OF_NET_FREIGHT"
  end

  # {http://fedex.com/ws/rate/v5}DayOfWeekType
  module DayOfWeekTypes
    FRI = "FRI"
    MON = "MON"
    SAT = "SAT"
    SUN = "SUN"
    THU = "THU"
    TUE = "TUE"
    WED = "WED"
  end

  # {http://fedex.com/ws/rate/v5}DelayLevelType
  module DelayLevelTypes
    CITY = "CITY"
    COUNTRY = "COUNTRY"
    LOCATION = "LOCATION"
    POSTAL_CODE = "POSTAL_CODE"
    SERVICE_AREA = "SERVICE_AREA"
    SERVICE_AREA_SPECIAL_SERVICE = "SERVICE_AREA_SPECIAL_SERVICE"
    SPECIAL_SERVICE = "SPECIAL_SERVICE"
  end

  # {http://fedex.com/ws/rate/v5}DelayPointType
  module DelayPointTypes
    BROKER = "BROKER"
    DESTINATION = "DESTINATION"
    ORIGIN = "ORIGIN"
    ORIGIN_DESTINATION_PAIR = "ORIGIN_DESTINATION_PAIR"
    PROOF_OF_DELIVERY_POINT = "PROOF_OF_DELIVERY_POINT"
  end

  # {http://fedex.com/ws/rate/v5}CommitmentDelayType
  module CommitmentDelayTypes
    HOLIDAY = "HOLIDAY"
    NON_WORKDAY = "NON_WORKDAY"
    NO_CITY_DELIVERY = "NO_CITY_DELIVERY"
    NO_HOLD_AT_LOCATION = "NO_HOLD_AT_LOCATION"
    NO_LOCATION_DELIVERY = "NO_LOCATION_DELIVERY"
    NO_SERVICE_AREA_DELIVERY = "NO_SERVICE_AREA_DELIVERY"
    NO_SERVICE_AREA_SPECIAL_SERVICE_DELIVERY = "NO_SERVICE_AREA_SPECIAL_SERVICE_DELIVERY"
    NO_SPECIAL_SERVICE_DELIVERY = "NO_SPECIAL_SERVICE_DELIVERY"
    NO_ZIP_DELIVERY = "NO_ZIP_DELIVERY"
    WEEKEND = "WEEKEND"
    WEEKEND_SPECIAL = "WEEKEND_SPECIAL"
  end

  # {http://fedex.com/ws/rate/v5}RequiredShippingDocumentType
  module RequiredShippingDocumentTypes
    CANADIAN_B13A = "CANADIAN_B13A"
    CERTIFICATE_OF_ORIGIN = "CERTIFICATE_OF_ORIGIN"
    COMMERCIAL_INVOICE = "COMMERCIAL_INVOICE"
    INTERNATIONAL_AIRWAY_BILL = "INTERNATIONAL_AIRWAY_BILL"
    MAIL_SERVICE_AIRWAY_BILL = "MAIL_SERVICE_AIRWAY_BILL"
    SHIPPERS_EXPORT_DECLARATION = "SHIPPERS_EXPORT_DECLARATION"
  end

  # {http://fedex.com/ws/rate/v5}TransitTimeType
  module TransitTimeTypes
    EIGHTEEN_DAYS = "EIGHTEEN_DAYS"
    EIGHT_DAYS = "EIGHT_DAYS"
    ELEVEN_DAYS = "ELEVEN_DAYS"
    FIFTEEN_DAYS = "FIFTEEN_DAYS"
    FIVE_DAYS = "FIVE_DAYS"
    FOURTEEN_DAYS = "FOURTEEN_DAYS"
    FOUR_DAYS = "FOUR_DAYS"
    NINETEEN_DAYS = "NINETEEN_DAYS"
    NINE_DAYS = "NINE_DAYS"
    ONE_DAY = "ONE_DAY"
    SEVENTEEN_DAYS = "SEVENTEEN_DAYS"
    SEVEN_DAYS = "SEVEN_DAYS"
    SIXTEEN_DAYS = "SIXTEEN_DAYS"
    SIX_DAYS = "SIX_DAYS"
    TEN_DAYS = "TEN_DAYS"
    THIRTEEN_DAYS = "THIRTEEN_DAYS"
    THREE_DAYS = "THREE_DAYS"
    TWELVE_DAYS = "TWELVE_DAYS"
    TWENTY_DAYS = "TWENTY_DAYS"
    TWO_DAYS = "TWO_DAYS"
    UNKNOWN = "UNKNOWN"
  end

  # {http://fedex.com/ws/rate/v5}NotificationSeverityType
  module NotificationSeverityTypes
    ERROR = "ERROR"
    FAILURE = "FAILURE"
    NOTE = "NOTE"
    SUCCESS = "SUCCESS"
    WARNING = "WARNING"
  end

  # {http://fedex.com/ws/rate/v5}ServiceOptionType
  module ServiceOptionTypes
    SATURDAY_DELIVERY = "SATURDAY_DELIVERY"
  end

  # {http://fedex.com/ws/rate/v5}ReturnedRateType
  module ReturnedRateTypes
    PAYOR_ACCOUNT = "PAYOR_ACCOUNT"
    PAYOR_LIST = "PAYOR_LIST"
    PAYOR_MULTIWEIGHT = "PAYOR_MULTIWEIGHT"
    RATED_ACCOUNT = "RATED_ACCOUNT"
    RATED_LIST = "RATED_LIST"
  end

  # {http://fedex.com/ws/rate/v5}PricingCodeType
  module PricingCodeTypes
    ACTUAL = "ACTUAL"
    ALTERNATE = "ALTERNATE"
    BASE = "BASE"
    HUNDREDWEIGHT = "HUNDREDWEIGHT"
    HUNDREDWEIGHT_ALTERNATE = "HUNDREDWEIGHT_ALTERNATE"
    INTERNATIONAL_DISTRIBUTION = "INTERNATIONAL_DISTRIBUTION"
    INTERNATIONAL_ECONOMY_SERVICE = "INTERNATIONAL_ECONOMY_SERVICE"
    LTL_FREIGHT = "LTL_FREIGHT"
    PACKAGE = "PACKAGE"
    SHIPMENT = "SHIPMENT"
    SHIPMENT_FIVE_POUND_OPTIONAL = "SHIPMENT_FIVE_POUND_OPTIONAL"
    SHIPMENT_OPTIONAL = "SHIPMENT_OPTIONAL"
    SPECIAL = "SPECIAL"
  end

  # {http://fedex.com/ws/rate/v5}SpecialRatingAppliedType
  module SpecialRatingAppliedTypes
    FIXED_FUEL_SURCHARGE = "FIXED_FUEL_SURCHARGE"
    IMPORT_PRICING = "IMPORT_PRICING"
  end

  # {http://fedex.com/ws/rate/v5}SurchargeType
  module SurchargeTypes
    ADDITIONAL_HANDLING = "ADDITIONAL_HANDLING"
    APPOINTMENT_DELIVERY = "APPOINTMENT_DELIVERY"
    BROKER_SELECT_OPTION = "BROKER_SELECT_OPTION"
    CANADIAN_DESTINATION = "CANADIAN_DESTINATION"
    CLEARANCE_ENTRY_FEE = "CLEARANCE_ENTRY_FEE"
    COD = "COD"
    DANGEROUS_GOODS = "DANGEROUS_GOODS"
    DELIVERY_AREA = "DELIVERY_AREA"
    DELIVERY_SIGNATURE_OPTIONS = "DELIVERY_SIGNATURE_OPTIONS"
    EMAIL_LABEL = "EMAIL_LABEL"
    EUROPE_FIRST = "EUROPE_FIRST"
    EXPORT = "EXPORT"
    FEDEX_TAG = "FEDEX_TAG"
    FUEL = "FUEL"
    HOME_DELIVERY_APPOINTMENT = "HOME_DELIVERY_APPOINTMENT"
    HOME_DELIVERY_DATE_CERTAIN = "HOME_DELIVERY_DATE_CERTAIN"
    HOME_DELIVERY_EVENING = "HOME_DELIVERY_EVENING"
    INSIDE_DELIVERY = "INSIDE_DELIVERY"
    INSIDE_PICKUP = "INSIDE_PICKUP"
    INSURED_VALUE = "INSURED_VALUE"
    INTERHAWAII = "INTERHAWAII"
    NON_STANDARD_CONTAINER = "NON_STANDARD_CONTAINER"
    OFFSHORE = "OFFSHORE"
    ON_CALL_PICKUP = "ON_CALL_PICKUP"
    OTHER = "OTHER"
    OUT_OF_DELIVERY_AREA = "OUT_OF_DELIVERY_AREA"
    OUT_OF_PICKUP_AREA = "OUT_OF_PICKUP_AREA"
    OVERSIZE = "OVERSIZE"
    PRIORITY_ALERT = "PRIORITY_ALERT"
    RESIDENTIAL_DELIVERY = "RESIDENTIAL_DELIVERY"
    RESIDENTIAL_PICKUP = "RESIDENTIAL_PICKUP"
    RETURN_LABEL = "RETURN_LABEL"
    SATURDAY_DELIVERY = "SATURDAY_DELIVERY"
    SATURDAY_PICKUP = "SATURDAY_PICKUP"
    SIGNATURE_OPTION = "SIGNATURE_OPTION"
    THIRD_PARTY_CONSIGNEE = "THIRD_PARTY_CONSIGNEE"
    TRANSMART_SERVICE_FEE = "TRANSMART_SERVICE_FEE"
  end

  # {http://fedex.com/ws/rate/v5}SurchargeLevelType
  module SurchargeLevelTypes
    PACKAGE = "PACKAGE"
    SHIPMENT = "SHIPMENT"
  end

  # {http://fedex.com/ws/rate/v5}TaxType
  module TaxTypes
    EXPORT = "EXPORT"
    GST = "GST"
    HST = "HST"
    OTHER = "OTHER"
    PST = "PST"
    VAT = "VAT"
  end

  # {http://fedex.com/ws/rate/v5}RateDiscountType
  module RateDiscountTypes
    BONUS = "BONUS"
    EARNED = "EARNED"
    OTHER = "OTHER"
    VOLUME = "VOLUME"
  end

  # {http://fedex.com/ws/rate/v5}RebateType
  module RebateTypes
    BASE = "BASE"
    EARNED = "EARNED"
    GRACE = "GRACE"
    MATRIX = "MATRIX"
    OTHER = "OTHER"
  end

  # {http://fedex.com/ws/rate/v5}RatedWeightMethod
  module RatedWeightMethod
    ACTUAL = "ACTUAL"
    DIM = "DIM"
    FREIGHT_MINIMUM = "FREIGHT_MINIMUM"
    OVERSIZE_1 = "OVERSIZE_1"
    OVERSIZE_2 = "OVERSIZE_2"
    OVERSIZE_3 = "OVERSIZE_3"
  end

  # {http://fedex.com/ws/rate/v5}MinimumChargeType
  module MinimumChargeTypes
    CUSTOMER = "CUSTOMER"
    CUSTOMER_FREIGHT_WEIGHT = "CUSTOMER_FREIGHT_WEIGHT"
    EARNED_DISCOUNT = "EARNED_DISCOUNT"
    RATE_SCALE = "RATE_SCALE"
  end

  # {http://fedex.com/ws/rate/v5}PendingShipmentType
  module PendingShipmentTypes
    EMAIL = "EMAIL"
  end
  
end