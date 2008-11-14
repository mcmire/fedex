module Fedex
  
  # The following constants were created by running wsdl2ruby.rb on the Ship WSDL and
  # pulling out the appropriate data. These are provided primarily for convenience.
  
  # {http://fedex.com/ws/ship/v5}AdditionalLabelsType
  module AdditionalLabelsTypes
    BROKER = "BROKER"
    CONSIGNEE = "CONSIGNEE"
    CUSTOMS = "CUSTOMS"
    DESTINATION = "DESTINATION"
    MANIFEST = "MANIFEST"
    ORIGIN = "ORIGIN"
    RECIPIENT = "RECIPIENT"
    SHIPPER = "SHIPPER"
  end

  # {http://fedex.com/ws/ship/v5}AdmissibilityPackageType
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

  # {http://fedex.com/ws/ship/v5}BarcodeSymbologyType
  module BarcodeSymbologyTypes
    CODE128B = "CODE128B"
    CODE128C = "CODE128C"
    CODE39 = "CODE39"
  end

  # {http://fedex.com/ws/ship/v5}B13AFilingOptionType
  module B13AFilingOptionTypes
    FILED_ELECTRONICALLY = "FILED_ELECTRONICALLY"
    MANUALLY_ATTACHED = "MANUALLY_ATTACHED"
    NOT_REQUIRED = "NOT_REQUIRED"
    SUMMARY_REPORTING = "SUMMARY_REPORTING"
  end

  # {http://fedex.com/ws/ship/v5}CarrierCodeType
  module CarrierCodeTypes
    FDXC = "FDXC"
    FDXE = "FDXE"
    FDXG = "FDXG"
    FXCC = "FXCC"
    FXFR = "FXFR"
  end

  # {http://fedex.com/ws/ship/v5}CloseReportType
  module CloseReportTypes
    COD = "COD"
    HAZMAT = "HAZMAT"
    MANIFEST = "MANIFEST"
  end

  # {http://fedex.com/ws/ship/v5}CodAddTransportationChargesType
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

  # {http://fedex.com/ws/ship/v5}CodCollectionType
  module CodCollectionTypes
    ANY = "ANY"
    CASH = "CASH"
    GUARANTEED_FUNDS = "GUARANTEED_FUNDS"
  end

  # {http://fedex.com/ws/ship/v5}CodReturnReferenceIndicatorType
  module CodReturnReferenceIndicatorTypes
    INVOICE = "INVOICE"
    PO = "PO"
    REFERENCE = "REFERENCE"
    TRACKING = "TRACKING"
  end

  # {http://fedex.com/ws/ship/v5}CustomerReferenceType
  module CustomerReferenceTypes
    BILL_OF_LADING = "BILL_OF_LADING"
    CUSTOMER_REFERENCE = "CUSTOMER_REFERENCE"
    DEPARTMENT_NUMBER = "DEPARTMENT_NUMBER"
    INVOICE_NUMBER = "INVOICE_NUMBER"
    P_O_NUMBER = "P_O_NUMBER"
    SHIPMENT_INTEGRITY = "SHIPMENT_INTEGRITY"
    STORE_NUMBER = "STORE_NUMBER"
  end

  # {http://fedex.com/ws/ship/v5}CustomLabelCoordinateUnits
  module CustomLabelCoordinateUnits
    MILS = "MILS"
    PIXELS = "PIXELS"
  end

  # {http://fedex.com/ws/ship/v5}DangerousGoodsAccessibilityType
  module DangerousGoodsAccessibilityTypes
    ACCESSIBLE = "ACCESSIBLE"
    INACCESSIBLE = "INACCESSIBLE"
  end

  # {http://fedex.com/ws/ship/v5}DayOfWeekType
  module DayOfWeekTypes
    FRI = "FRI"
    MON = "MON"
    SAT = "SAT"
    SUN = "SUN"
    THU = "THU"
    TUE = "TUE"
    WED = "WED"
  end

  # {http://fedex.com/ws/ship/v5}DeletionControlType
  module DeletionControlTypes
    DELETE_ALL_PACKAGES = "DELETE_ALL_PACKAGES"
    DELETE_ONE_PACKAGE = "DELETE_ONE_PACKAGE"
    LEGACY = "LEGACY"
  end

  # {http://fedex.com/ws/ship/v5}DestinationControlStatementType
  module DestinationControlStatementTypes
    DEPARTMENT_OF_COMMERCE = "DEPARTMENT_OF_COMMERCE"
    DEPARTMENT_OF_STATE = "DEPARTMENT_OF_STATE"
  end

  # {http://fedex.com/ws/ship/v5}DocTabContentType
  module DocTabContentTypes
    BARCODED = "BARCODED"
    MINIMUM = "MINIMUM"
    STANDARD = "STANDARD"
    ZONE001 = "ZONE001"
  end

  # {http://fedex.com/ws/ship/v5}DocTabZoneJustificationType
  module DocTabZoneJustificationTypes
    LEFT = "LEFT"
    RIGHT = "RIGHT"
  end

  # {http://fedex.com/ws/ship/v5}DropoffType
  module DropoffTypes
    BUSINESS_SERVICE_CENTER = "BUSINESS_SERVICE_CENTER"
    DROP_BOX = "DROP_BOX"
    REGULAR_PICKUP = "REGULAR_PICKUP"
    REQUEST_COURIER = "REQUEST_COURIER"
    STATION = "STATION"
  end

  # {http://fedex.com/ws/ship/v5}ReturnEMailAllowedSpecialServiceType
  module ReturnEMailAllowedSpecialServiceTypes
    SATURDAY_DELIVERY = "SATURDAY_DELIVERY"
    SATURDAY_PICKUP = "SATURDAY_PICKUP"
  end

  # {http://fedex.com/ws/ship/v5}EMailNotificationFormatType
  module EMailNotificationFormatTypes
    HTML = "HTML"
    TEXT = "TEXT"
    WIRELESS = "WIRELESS"
  end

  # {http://fedex.com/ws/ship/v5}EMailNotificationRecipientType
  module EMailNotificationRecipientTypes
    BROKER = "BROKER"
    OTHER = "OTHER"
    RECIPIENT = "RECIPIENT"
    SHIPPER = "SHIPPER"
  end

  # {http://fedex.com/ws/ship/v5}HomeDeliveryPremiumType
  module HomeDeliveryPremiumTypes
    APPOINTMENT = "APPOINTMENT"
    DATE_CERTAIN = "DATE_CERTAIN"
    EVENING = "EVENING"
  end

  # {http://fedex.com/ws/ship/v5}InternationalDocumentContentType
  module InternationalDocumentContentTypes
    DOCUMENTS_ONLY = "DOCUMENTS_ONLY"
    NON_DOCUMENTS = "NON_DOCUMENTS"
  end

  # {http://fedex.com/ws/ship/v5}LabelFormatType
  module LabelFormatTypes
    COMMON2D = "COMMON2D"
    LABEL_DATA_ONLY = "LABEL_DATA_ONLY"
  end

  # {http://fedex.com/ws/ship/v5}LabelMaskableDataType
  module LabelMaskableDataTypes
    CUSTOMS_VALUE = "CUSTOMS_VALUE"
    DUTIES_AND_TAXES_PAYOR_ACCOUNT_NUMBER = "DUTIES_AND_TAXES_PAYOR_ACCOUNT_NUMBER"
    SHIPPER_ACCOUNT_NUMBER = "SHIPPER_ACCOUNT_NUMBER"
    TERMS_AND_CONDITIONS = "TERMS_AND_CONDITIONS"
    TRANSPORTATION_CHARGES_PAYOR_ACCOUNT_NUMBER = "TRANSPORTATION_CHARGES_PAYOR_ACCOUNT_NUMBER"
  end

  # {http://fedex.com/ws/ship/v5}LabelPrintingOrientationType
  module LabelPrintingOrientationTypes
    BOTTOM_EDGE_OF_TEXT_FIRST = "BOTTOM_EDGE_OF_TEXT_FIRST"
    TOP_EDGE_OF_TEXT_FIRST = "TOP_EDGE_OF_TEXT_FIRST"
  end

  # {http://fedex.com/ws/ship/v5}LabelSpecificationImageType
  module LabelSpecificationImageTypes
    DPL = "DPL"
    EPL2 = "EPL2"
    PDF = "PDF"
    PNG = "PNG"
    ZPLII = "ZPLII"
  end

  # {http://fedex.com/ws/ship/v5}LabelStockType
  module LabelStockTypes
    PAPER_4X6 = "PAPER_4X6"
    PAPER_4X8 = "PAPER_4X8"
    PAPER_4X9 = "PAPER_4X9"
    PAPER_7X475 = "PAPER_7X4.75"
    PAPER_85X11_BOTTOM_HALF_LABEL = "PAPER_8.5X11_BOTTOM_HALF_LABEL"
    PAPER_85X11_TOP_HALF_LABEL = "PAPER_8.5X11_TOP_HALF_LABEL"
    STOCK_4X6 = "STOCK_4X6"
    STOCK_4X675_LEADING_DOC_TAB = "STOCK_4X6.75_LEADING_DOC_TAB"
    STOCK_4X675_TRAILING_DOC_TAB = "STOCK_4X6.75_TRAILING_DOC_TAB"
    STOCK_4X8 = "STOCK_4X8"
    STOCK_4X9_LEADING_DOC_TAB = "STOCK_4X9_LEADING_DOC_TAB"
    STOCK_4X9_TRAILING_DOC_TAB = "STOCK_4X9_TRAILING_DOC_TAB"
  end

  # {http://fedex.com/ws/ship/v5}LinearUnits
  module LinearUnits
    CM = "CM"
    IN = "IN"
  end
  
  # honestly I don't know where this went to?
  module CurrencyTypes
    USD = "USD"
  end

  # {http://fedex.com/ws/ship/v5}MinimumChargeType
  module MinimumChargeTypes
    CUSTOMER = "CUSTOMER"
    CUSTOMER_FREIGHT_WEIGHT = "CUSTOMER_FREIGHT_WEIGHT"
    EARNED_DISCOUNT = "EARNED_DISCOUNT"
    RATE_SCALE = "RATE_SCALE"
  end

  # {http://fedex.com/ws/ship/v5}NaftaImportSpecificationType
  module NaftaImportSpecificationTypes
    IMPORTER_OF_RECORD = "IMPORTER_OF_RECORD"
    RECIPIENT = "RECIPIENT"
    UNKNOWN = "UNKNOWN"
    VARIOUS = "VARIOUS"
  end

  # {http://fedex.com/ws/ship/v5}NaftaNetCostMethodCode
  module NaftaNetCostMethodCode
    NC = "NC"
    NO = "NO"
  end

  # {http://fedex.com/ws/ship/v5}NaftaPreferenceCriterionCode
  module NaftaPreferenceCriterionCode
    A = "A"
    B = "B"
    C = "C"
    D = "D"
    E = "E"
    F = "F"
  end

  # {http://fedex.com/ws/ship/v5}NaftaProducerDeterminationCode
  module NaftaProducerDeterminationCode
    NO_1 = "NO_1"
    NO_2 = "NO_2"
    NO_3 = "NO_3"
    YES = "YES"
  end

  # {http://fedex.com/ws/ship/v5}NaftaProducerSpecificationType
  module NaftaProducerSpecificationTypes
    AVAILABLE_UPON_REQUEST = "AVAILABLE_UPON_REQUEST"
    MULTIPLE_SPECIFIED = "MULTIPLE_SPECIFIED"
    SAME = "SAME"
    SINGLE_SPECIFIED = "SINGLE_SPECIFIED"
    UNKNOWN = "UNKNOWN"
  end

  # {http://fedex.com/ws/ship/v5}NotificationSeverityType
  module NotificationSeverityTypes
    ERROR = "ERROR"
    FAILURE = "FAILURE"
    NOTE = "NOTE"
    SUCCESS = "SUCCESS"
    WARNING = "WARNING"
  end

  # {http://fedex.com/ws/ship/v5}OversizeClassType
  module OversizeClassTypes
    OVERSIZE_1 = "OVERSIZE_1"
    OVERSIZE_2 = "OVERSIZE_2"
    OVERSIZE_3 = "OVERSIZE_3"
  end

  # {http://fedex.com/ws/ship/v5}PackageSpecialServiceType
  module PackageSpecialServiceTypes
    APPOINTMENT_DELIVERY = "APPOINTMENT_DELIVERY"
    DANGEROUS_GOODS = "DANGEROUS_GOODS"
    DRY_ICE = "DRY_ICE"
    NON_STANDARD_CONTAINER = "NON_STANDARD_CONTAINER"
    PRIORITY_ALERT = "PRIORITY_ALERT"
    SIGNATURE_OPTION = "SIGNATURE_OPTION"
  end

  # {http://fedex.com/ws/ship/v5}PackagingType
  module PackagingTypes
    FEDEX_10KG_BOX = "FEDEX_10KG_BOX"
    FEDEX_25KG_BOX = "FEDEX_25KG_BOX"
    FEDEX_BOX = "FEDEX_BOX"
    FEDEX_ENVELOPE = "FEDEX_ENVELOPE"
    FEDEX_PAK = "FEDEX_PAK"
    FEDEX_TUBE = "FEDEX_TUBE"
    YOUR_PACKAGING = "YOUR_PACKAGING"
  end

  # {http://fedex.com/ws/ship/v5}PaymentType
  module PaymentTypes
    COLLECT = "COLLECT"
    RECIPIENT = "RECIPIENT"
    SENDER = "SENDER"
    THIRD_PARTY = "THIRD_PARTY"
  end

  # {http://fedex.com/ws/ship/v5}PendingShipmentType
  module PendingShipmentTypes
    EMAIL = "EMAIL"
  end

  # {http://fedex.com/ws/ship/v5}PickupRequestSourceType
  module PickupRequestSourceTypes
    AUTOMATION = "AUTOMATION"
    CUSTOMER_SERVICE = "CUSTOMER_SERVICE"
  end

  # {http://fedex.com/ws/ship/v5}PickupRequestType
  module PickupRequestTypes
    FUTURE_DAY = "FUTURE_DAY"
    SAME_DAY = "SAME_DAY"
  end

  # {http://fedex.com/ws/ship/v5}PricingCodeType
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

  # {http://fedex.com/ws/ship/v5}PurposeOfShipmentType
  module PurposeOfShipmentTypes
    GIFT = "GIFT"
    NOT_SOLD = "NOT_SOLD"
    PERSONAL_EFFECTS = "PERSONAL_EFFECTS"
    REPAIR_AND_RETURN = "REPAIR_AND_RETURN"
    SAMPLE = "SAMPLE"
    SOLD = "SOLD"
  end

  # {http://fedex.com/ws/ship/v5}RateDiscountType
  module RateDiscountTypes
    BONUS = "BONUS"
    EARNED = "EARNED"
    OTHER = "OTHER"
    VOLUME = "VOLUME"
  end

  # {http://fedex.com/ws/ship/v5}RatedWeightMethod
  module RatedWeightMethod
    ACTUAL = "ACTUAL"
    DIM = "DIM"
    FREIGHT_MINIMUM = "FREIGHT_MINIMUM"
    OVERSIZE_1 = "OVERSIZE_1"
    OVERSIZE_2 = "OVERSIZE_2"
    OVERSIZE_3 = "OVERSIZE_3"
  end

  # {http://fedex.com/ws/ship/v5}RateRequestType
  module RateRequestTypes
    ACCOUNT = "ACCOUNT"
    LIST = "LIST"
  end

  # {http://fedex.com/ws/ship/v5}RecipientCustomsIdType
  module RecipientCustomsIdTypes
    COMPANY = "COMPANY"
    INDIVIDUAL = "INDIVIDUAL"
    PASSPORT = "PASSPORT"
  end

  # {http://fedex.com/ws/ship/v5}RegulatoryControlType
  module RegulatoryControlTypes
    EU_CIRCULATION = "EU_CIRCULATION"
    FOOD_OR_PERISHABLE = "FOOD_OR_PERISHABLE"
    NAFTA = "NAFTA"
  end

  # {http://fedex.com/ws/ship/v5}RequestedShippingDocumentType
  module RequestedShippingDocumentTypes
    GENERAL_AGENCY_AGREEMENT = "GENERAL_AGENCY_AGREEMENT"
    LABEL = "LABEL"
  end

  # {http://fedex.com/ws/ship/v5}ReturnedRateType
  module ReturnedRateTypes
    PAYOR_ACCOUNT = "PAYOR_ACCOUNT"
    PAYOR_COUNTER = "PAYOR_COUNTER"
    PAYOR_LIST = "PAYOR_LIST"
    PAYOR_MULTIWEIGHT = "PAYOR_MULTIWEIGHT"
    RATED_ACCOUNT = "RATED_ACCOUNT"
    RATED_COUNTER = "RATED_COUNTER"
    RATED_LIST = "RATED_LIST"
  end

  # {http://fedex.com/ws/ship/v5}ReturnType
  module ReturnTypes
    FEDEX_TAG = "FEDEX_TAG"
    PENDING = "PENDING"
    PRINT_RETURN_LABEL = "PRINT_RETURN_LABEL"
  end

  # {http://fedex.com/ws/ship/v5}ReturnedShippingDocumentType
  module ReturnedShippingDocumentTypes
    AUXILIARY_LABEL = "AUXILIARY_LABEL"
    COD_RETURN_LABEL = "COD_RETURN_LABEL"
    COMMERCIAL_INVOICE = "COMMERCIAL_INVOICE"
    GENERAL_AGENCY_AGREEMENT_FORM = "GENERAL_AGENCY_AGREEMENT_FORM"
    GENERAL_AGENCY_AGREEMENT_INSTRUCTIONS = "GENERAL_AGENCY_AGREEMENT_INSTRUCTIONS"
    NAFTA_CERTIFICATE_OF_ORIGIN_FORM = "NAFTA_CERTIFICATE_OF_ORIGIN_FORM"
    NAFTA_CERTIFICATE_OF_ORIGIN_INSTRUCTIONS = "NAFTA_CERTIFICATE_OF_ORIGIN_INSTRUCTIONS"
    OUTBOUND_LABEL = "OUTBOUND_LABEL"
    TERMS_AND_CONDITIONS = "TERMS_AND_CONDITIONS"
  end

  # {http://fedex.com/ws/ship/v5}ServiceType
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

  # {http://fedex.com/ws/ship/v5}ShippingDocumentImageType
  module ShippingDocumentImageTypes
    PDF = "PDF"
    PNG = "PNG"
  end

  # {http://fedex.com/ws/ship/v5}ShippingDocumentStockType
  module ShippingDocumentStockTypes
    PAPER_LETTER = "PAPER_LETTER"
  end

  # {http://fedex.com/ws/ship/v5}RebateType
  module RebateTypes
    BONUS = "BONUS"
    EARNED = "EARNED"
    OTHER = "OTHER"
  end

  # {http://fedex.com/ws/ship/v5}ShipmentSpecialServiceType
  module ShipmentSpecialServiceTypes
    BROKER_SELECT_OPTION = "BROKER_SELECT_OPTION"
    COD = "COD"
    DRY_ICE = "DRY_ICE"
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

  # {http://fedex.com/ws/ship/v5}SignatureOptionType
  module SignatureOptionTypes
    ADULT = "ADULT"
    DIRECT = "DIRECT"
    INDIRECT = "INDIRECT"
    NO_SIGNATURE_REQUIRED = "NO_SIGNATURE_REQUIRED"
    SERVICE_DEFAULT = "SERVICE_DEFAULT"
  end

  # {http://fedex.com/ws/ship/v5}SpecialRatingAppliedType
  module SpecialRatingAppliedTypes
    FIXED_FUEL_SURCHARGE = "FIXED_FUEL_SURCHARGE"
    IMPORT_PRICING = "IMPORT_PRICING"
  end

  # {http://fedex.com/ws/ship/v5}SurchargeType
  module SurchargeTypes
    ADDITIONAL_HANDLING = "ADDITIONAL_HANDLING"
    APPOINTMENT_DELIVERY = "APPOINTMENT_DELIVERY"
    BROKER_SELECT_OPTION = "BROKER_SELECT_OPTION"
    CANADIAN_DESTINATION = "CANADIAN_DESTINATION"
    CLEARANCE_ENTRY_FEE = "CLEARANCE_ENTRY_FEE"
    COD = "COD"
    CUT_FLOWERS = "CUT_FLOWERS"
    DANGEROUS_GOODS = "DANGEROUS_GOODS"
    DELIVERY_AREA = "DELIVERY_AREA"
    DELIVERY_SIGNATURE_OPTIONS = "DELIVERY_SIGNATURE_OPTIONS"
    EMAIL_LABEL = "EMAIL_LABEL"
    EUROPE_FIRST = "EUROPE_FIRST"
    EXPORT = "EXPORT"
    FEDEX_TAG = "FEDEX_TAG"
    FICE = "FICE"
    FUEL = "FUEL"
    HOME_DELIVERY_APPOINTMENT = "HOME_DELIVERY_APPOINTMENT"
    HOME_DELIVERY_DATE_CERTAIN = "HOME_DELIVERY_DATE_CERTAIN"
    HOME_DELIVERY_EVENING = "HOME_DELIVERY_EVENING"
    INSIDE_DELIVERY = "INSIDE_DELIVERY"
    INSIDE_PICKUP = "INSIDE_PICKUP"
    INSURED_VALUE = "INSURED_VALUE"
    INTERHAWAII = "INTERHAWAII"
    OFFSHORE = "OFFSHORE"
    ON_CALL_PICKUP = "ON_CALL_PICKUP"
    OTHER = "OTHER"
    OUT_OF_DELIVERY_AREA = "OUT_OF_DELIVERY_AREA"
    OUT_OF_PICKUP_AREA = "OUT_OF_PICKUP_AREA"
    OVERSIZE = "OVERSIZE"
    PIECE_COUNT_VERIFICATION = "PIECE_COUNT_VERIFICATION"
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

  # {http://fedex.com/ws/ship/v5}SurchargeLevelType
  module SurchargeLevelTypes
    PACKAGE = "PACKAGE"
    SHIPMENT = "SHIPMENT"
  end

  # {http://fedex.com/ws/ship/v5}TaxType
  module TaxTypes
    EXPORT = "EXPORT"
    GST = "GST"
    HST = "HST"
    OTHER = "OTHER"
    PST = "PST"
    VAT = "VAT"
  end

  # {http://fedex.com/ws/ship/v5}TermsOfSaleType
  module TermsOfSaleTypes
    CFR_OR_CPT = "CFR_OR_CPT"
    CIF_OR_CIP = "CIF_OR_CIP"
    DDP = "DDP"
    DDU = "DDU"
    EXW = "EXW"
    FOB_OR_FCA = "FOB_OR_FCA"
  end

  # {http://fedex.com/ws/ship/v5}TinType
  module TinTypes
    EIN = "EIN"
    SSN = "SSN"
  end

  # {http://fedex.com/ws/ship/v5}TransitTimeType
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

  # {http://fedex.com/ws/ship/v5}VariableHandlingChargeType
  module VariableHandlingChargeTypes
    FIXED_AMOUNT = "FIXED_AMOUNT"
    PERCENTAGE_OF_NET_CHARGE = "PERCENTAGE_OF_NET_CHARGE"
    PERCENTAGE_OF_NET_CHARGE_EXCLUDING_TAXES = "PERCENTAGE_OF_NET_CHARGE_EXCLUDING_TAXES"
    PERCENTAGE_OF_NET_FREIGHT = "PERCENTAGE_OF_NET_FREIGHT"
  end

  # {http://fedex.com/ws/ship/v5}WeightUnits
  module WeightUnits
    KG = "KG"
    LB = "LB"
  end
  
  
end