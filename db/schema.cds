namespace app.gms;

using {
    managed,
    cuid
} from '@sap/cds/common';

entity employee : cuid, managed {
    key ID    : Integer;
        fname : String;
}

entity ServiceProfileParameters : cuid, managed {
    key ID                     : Integer;
        serviceParameter       : String;
        serviceParameterDesc   : String;
        serviceParameterType   : String;
        serviceParameterlength : Integer;
}

entity ServiceProfile : cuid, managed {
    key ID                 : Integer;
    key serviceProfileName : String;
        serviceProfileDesc : String;
        field1             : String;
        field2             : String;
        field3             : String;
        field4             : String;
        field5             : String;
}

entity serviceProfileParametersItems {
    key ID                     : Integer;
    key ProfileId              : Integer;
    key serviceProfileName     : String;
        serviceProfileDesc     : String;
        serviceParameter       : String;
        serviceParameterDesc   : String;
        serviceParameterType   : String;
        serviceParameterlength : Integer;
        ParentId               : String;
        ContractRelevant       : Boolean;
        Value_Parameter        : Boolean;
        Threshold_Relevance    : Boolean;
        Referrence_Relevant    : Boolean;
        Nomination_Relevant    : Boolean;
        Balancing_Relevant     : Boolean;
        Allocation_Relevant    : Boolean;
        Billing_Relevant       : Boolean;
        Price_Relevant         : Boolean;
}

entity pathAndFuelMapping : cuid, managed {
    key ID               : Integer;
        DeliveryPoint    : String;
        DpTsSystem       : String;
        ReDeliveryPoint  : String;
        RDpTsSystem      : String;
        InterconnectPath : Boolean;
        Interconnect     : String;
        path             : String;
        FuelPercentage   : Integer;
}

// SALES CONTRACT

/* checksum : 9e7e6f29020c12a4c3046a9185d31534 */
@cds.external               : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported: 'true'
@sap.supported.formats      : 'atom json xlsx'
service ZAPI_SALES_CONTRACT_SRV {};

@cds.external        : true
@cds.persistence.skip: true
@sap.content.version : '1'
@sap.label           : 'Sales Contract (API)'
entity ZAPI_SALES_CONTRACT_SRV.A_SalesContract {
        @sap.display.format: 'UpperCase'
        @sap.label         : 'Sales Contract'
    key SalesContract                  : String(10) not null;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Sales Document Type'
        SalesContractType              : String(4);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Sales Organization'
        SalesOrganization              : String(4);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Distribution Channel'
        DistributionChannel            : String(2);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Division'
        OrganizationDivision           : String(2);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Sales group'
        SalesGroup                     : String(3);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Sales office'
        SalesOffice                    : String(4);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Sales District'
        SalesDistrict                  : String(6);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Sold-To Party'
        SoldToParty                    : String(10);

        @sap.display.format: 'Date'
        @sap.label         : 'Created on'
        @sap.quickinfo     : 'Date on which the record was created'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        CreationDate                   : Date;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Created by'
        @sap.quickinfo     : 'Name of Person who Created the Object'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        CreatedByUser                  : String(12);

        @sap.display.format: 'Date'
        @sap.label         : 'Changed On'
        @sap.quickinfo     : 'Date of Last Change'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        LastChangeDate                 : Date;

        @odata.Type        : 'Edm.DateTimeOffset'
        @odata.Precision   : 7
        @sap.label         : 'Time Stamp'
        @sap.quickinfo     : 'UTC Time Stamp in Long Form (YYYYMMDDhhmmssmmmuuun)'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        LastChangeDateTime             : Timestamp;

        @sap.label         : 'Customer Reference'
        PurchaseOrderByCustomer        : String(35);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Purchase Order Type'
        @sap.quickinfo     : 'Customer Purchase Order Type'
        CustomerPurchaseOrderType      : String(4);

        @sap.display.format: 'Date'
        @sap.label         : 'Customer Ref. Date'
        @sap.quickinfo     : 'Customer Reference Date'
        CustomerPurchaseOrderDate      : Date;

        @sap.display.format: 'Date'
        @sap.label         : 'Document Date'
        @sap.quickinfo     : 'Document Date (Date Received/Sent)'
        SalesContractDate              : Date;

        @sap.unit          : 'TransactionCurrency'
        @sap.label         : 'Net Value'
        @sap.quickinfo     : 'Net Value of the Sales Order in Document Currency'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        TotalNetAmount                 : Decimal(16, 3);

        @sap.label         : 'Document Currency'
        @sap.quickinfo     : 'SD document currency'
        @sap.semantics     : 'currency-code'
        TransactionCurrency            : String(5);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Order Reason'
        @sap.quickinfo     : 'Order Reason (Reason for the Business Transaction)'
        SDDocumentReason               : String(3);

        @sap.display.format: 'Date'
        @sap.label         : 'Pricing Date'
        @sap.quickinfo     : 'Date for Pricing and Exchange Rate'
        PricingDate                    : Date;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Incoterms'
        @sap.quickinfo     : 'Incoterms (Part 1)'
        IncotermsClassification        : String(3);

        @sap.label         : 'Incoterms (Part 2)'
        IncotermsTransferLocation      : String(28);

        @sap.label         : 'Incoterms Location 1'
        IncotermsLocation1             : String(70);

        @sap.label         : 'Incoterms Location 2'
        IncotermsLocation2             : String(70);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Incoterms Version'
        IncotermsVersion               : String(4);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Payment terms'
        @sap.quickinfo     : 'Terms of payment key'
        CustomerPaymentTerms           : String(4);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Payment Method'
        PaymentMethod                  : String(1);

        @sap.display.format: 'Date'
        @sap.label         : 'Valid-From Date'
        @sap.quickinfo     : 'Valid-From Date (Outline Agreements, Product Proposals)'
        SalesContractValidityStartDate : Date;

        @sap.display.format: 'Date'
        @sap.label         : 'Valid-To Date'
        @sap.quickinfo     : 'Valid-To Date (Outline Agreements, Product Proposals)'
        SalesContractValidityEndDate   : Date;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Unit Validity Period'
        @sap.quickinfo     : 'Unit of Validity Period of Contract'
        SalesContractValidityPerdUnit  : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Val.Period.Category'
        @sap.quickinfo     : 'Validity Period Category of Contract'
        SalesContractValidityPerdCat   : String(2);

        @sap.display.format: 'Date'
        @sap.label         : 'Contract Signed'
        @sap.quickinfo     : 'Date on Which Contract Is Signed'
        SalesContractSignedDate        : Date;

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Contract Val.Period'
        @sap.quickinfo     : 'Validity Period of Contract'
        NmbrOfSalesContractValdtyPerd  : String(3);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Action'
        @sap.quickinfo     : 'Action at end of contract'
        SalesContractFollowUpAction    : String(4);

        @sap.display.format: 'Date'
        @sap.label         : 'Action Date'
        @sap.quickinfo     : 'Date for Action'
        SlsContractFollowUpActionDate  : Date;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Manual Completion'
        @sap.quickinfo     : 'Manual Completion of Contract'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ContractManualCompletion       : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Reference document'
        @sap.quickinfo     : 'Document number of the reference document'
        ReferenceSDDocument            : String(10);

        @sap.label         : 'Preceding Doc.Categ.'
        @sap.quickinfo     : 'Document Category of Preceding SD Document'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ReferenceSDDocumentCategory    : String(4);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Overall Status'
        @sap.quickinfo     : 'Overall Processing Status (Header/All Items)'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        OverallSDProcessStatus         : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Credit Status'
        @sap.quickinfo     : 'Overall Status of Credit Checks'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        TotalCreditCheckStatus         : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Rejection Status'
        @sap.quickinfo     : 'Rejection Status (All Items)'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        OverallSDDocumentRejectionSts  : String(1);

        @cds.ambiguous     : 'missing on condition?'
        to_Item                        : Association to many ZAPI_SALES_CONTRACT_SRV.A_SalesContractItem {};

        @cds.ambiguous     : 'missing on condition?'
        to_Partner                     : Association to many ZAPI_SALES_CONTRACT_SRV.A_SalesContractPartner {};

        @cds.ambiguous     : 'missing on condition?'
        to_PricingElement              : Association to many ZAPI_SALES_CONTRACT_SRV.A_SalesContractPrcgElmnt {};
};

@cds.external        : true
@cds.persistence.skip: true
@sap.content.version : '1'
@sap.label           : 'Sales Contract Item (API)'
entity ZAPI_SALES_CONTRACT_SRV.A_SalesContractItem {
        @sap.display.format: 'UpperCase'
        @sap.label         : 'Sales Contract'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
    key SalesContract                  : String(10) not null;

        @sap.display.format: 'NonNegative'
        @sap.text          : 'SalesContractItemText'
        @sap.label         : 'Sales Contract Item'
    key SalesContractItem              : String(6) not null;

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Higher-Level Item'
        @sap.quickinfo     : 'Higher-Level item in bill of material structures'
        HigherLevelItem                : String(6);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Item category'
        @sap.quickinfo     : 'Sales document item category'
        SalesContractItemCategory      : String(4);

        @sap.label         : 'Item Description'
        @sap.quickinfo     : 'Short text for sales order item'
        SalesContractItemText          : String(40);

        @sap.label         : 'Customer Reference'
        PurchaseOrderByCustomer        : String(35);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Material'
        @sap.quickinfo     : 'Material Number'
        Material                       : String(40);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Customer Material'
        @sap.quickinfo     : 'Material Number Used by Customer'
        MaterialByCustomer             : String(35);

        @sap.display.format: 'Date'
        @sap.label         : 'Pricing Date'
        @sap.quickinfo     : 'Date for Pricing and Exchange Rate'
        PricingDate                    : Date;

        @sap.unit          : 'RequestedQuantityUnit'
        @sap.label         : 'Requested Quantity'
        RequestedQuantity              : Decimal(15, 3);

        @sap.label         : 'Requested Qty Unit'
        @sap.quickinfo     : 'Requested Quantity Unit'
        @sap.semantics     : 'unit-of-measure'
        RequestedQuantityUnit          : String(3);

        @sap.unit          : 'ItemWeightUnit'
        @sap.label         : 'Gross Weight'
        @sap.quickinfo     : 'Gross Weight of the Item'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ItemGrossWeight                : Decimal(15, 3);

        @sap.unit          : 'ItemWeightUnit'
        @sap.label         : 'Net Weight'
        @sap.quickinfo     : 'Net Weight of the Item'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ItemNetWeight                  : Decimal(15, 3);

        @sap.label         : 'Weight unit'
        @sap.quickinfo     : 'Weight Unit'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        @sap.semantics     : 'unit-of-measure'
        ItemWeightUnit                 : String(3);

        @sap.unit          : 'ItemVolumeUnit'
        @sap.label         : 'Volume'
        @sap.quickinfo     : 'Volume of the item'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ItemVolume                     : Decimal(15, 3);

        @sap.label         : 'Volume unit'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        @sap.semantics     : 'unit-of-measure'
        ItemVolumeUnit                 : String(3);

        @sap.unit          : 'TransactionCurrency'
        @sap.label         : 'OA Target Value'
        @sap.quickinfo     : 'Target Value for Outline Agreement in Document Currency'
        OutlineAgreementTargetAmount   : Decimal(14, 3);

        @sap.label         : 'Document Currency'
        @sap.quickinfo     : 'SD document currency'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        @sap.semantics     : 'currency-code'
        TransactionCurrency            : String(5);

        @sap.unit          : 'TransactionCurrency'
        @sap.label         : 'Net Value'
        @sap.quickinfo     : 'Net Value of the Order Item in Document Currency'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        NetAmount                      : Decimal(16, 3);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Material Group'
        MaterialGroup                  : String(9);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Material Price Grp'
        @sap.quickinfo     : 'Material Price Group'
        MaterialPricingGroup           : String(2);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Batch'
        @sap.quickinfo     : 'Batch Number'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        Batch                          : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Plant'
        @sap.quickinfo     : 'Plant (Own or External)'
        ProductionPlant                : String(4);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Storage location'
        StorageLocation                : String(4);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Shipping Point'
        @sap.quickinfo     : 'Shipping Point / Receiving Point'
        ShippingPoint                  : String(4);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Incoterms'
        @sap.quickinfo     : 'Incoterms (Part 1)'
        IncotermsClassification        : String(3);

        @sap.label         : 'Incoterms (Part 2)'
        IncotermsTransferLocation      : String(28);

        @sap.label         : 'Incoterms Location 1'
        IncotermsLocation1             : String(70);

        @sap.label         : 'Incoterms Location 2'
        IncotermsLocation2             : String(70);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Payment terms'
        @sap.quickinfo     : 'Terms of payment key'
        CustomerPaymentTerms           : String(4);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Reason for Rejection'
        @sap.quickinfo     : 'Reason for Rejection of Sales Documents'
        SalesDocumentRjcnReason        : String(2);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Billing Block'
        @sap.quickinfo     : 'Billing Block for Item'
        ItemBillingBlockReason         : String(2);

        @sap.display.format: 'NonNegative'
        @sap.label         : 'WBS Element'
        @sap.quickinfo     : 'Work Breakdown Structure Element (WBS Element)'
        WBSElement                     : String(24);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Profit Center'
        ProfitCenter                   : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Reference document'
        @sap.quickinfo     : 'Document number of the reference document'
        ReferenceSDDocument            : String(10);

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Reference Item'
        @sap.quickinfo     : 'Item number of the reference item'
        ReferenceSDDocumentItem        : String(6);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Overall Status'
        @sap.quickinfo     : 'Overall Processing Status (Item)'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        SDProcessStatus                : String(1);

        @sap.display.format: 'Date'
        @sap.label         : 'Contract Start Date'
        SalesContractValidityStartDate : Date;

        @sap.display.format: 'Date'
        @sap.label         : 'Contract End Date'
        SalesContractValidityEndDate   : Date;

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Contract Val.Period'
        @sap.quickinfo     : 'Validity Period of Contract'
        NmbrOfSalesContractValdtyPerd  : String(3);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Unit Validity Period'
        @sap.quickinfo     : 'Unit of Validity Period of Contract'
        SalesContractValidityPerdUnit  : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Val.Period.Category'
        @sap.quickinfo     : 'Validity Period Category of Contract'
        SalesContractValidityPerdCat   : String(2);

        @sap.display.format: 'Date'
        @sap.label         : 'Contract Signed'
        @sap.quickinfo     : 'Date on Which Contract Is Signed'
        SalesContractSignedDate        : Date;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Action'
        @sap.quickinfo     : 'Action at end of contract'
        SalesContractFollowUpAction    : String(4);

        @sap.display.format: 'Date'
        @sap.label         : 'Action Date'
        @sap.quickinfo     : 'Date for Action'
        SlsContractFollowUpActionDate  : Date;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Requirement Segment'
        RequirementSegment             : String(40);

        @cds.ambiguous     : 'missing on condition?'
        to_Partner                     : Association to many ZAPI_SALES_CONTRACT_SRV.A_SalesContractItemPartner {};

        @cds.ambiguous     : 'missing on condition?'
        to_PricingElement              : Association to many ZAPI_SALES_CONTRACT_SRV.A_SalesContractItemPrcgElmnt {};

        @cds.ambiguous     : 'missing on condition?'
        to_SalesContract               : Association to ZAPI_SALES_CONTRACT_SRV.A_SalesContract {};
};

@cds.external        : true
@cds.persistence.skip: true
@sap.creatable       : 'false'
@sap.content.version : '1'
@sap.label           : 'Sales Contract Item Partner (API)'
entity ZAPI_SALES_CONTRACT_SRV.A_SalesContractItemPartner {
        @sap.display.format: 'UpperCase'
        @sap.label         : 'Sales document'
        @sap.quickinfo     : 'Sales and Distribution Document Number'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
    key SalesContract        : String(10) not null;

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Item (SD)'
        @sap.quickinfo     : 'Item number of the SD document'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
    key SalesContractItem    : String(6) not null;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Partner Function'
    key PartnerFunction      : String(2) not null;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Customer'
        @sap.quickinfo     : 'Customer Number'
        Customer             : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Vendor'
        @sap.quickinfo     : 'Account Number of Vendor or Creditor'
        Supplier             : String(10);

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Personnel Number'
        Personnel            : String(8);

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Contact Person'
        @sap.quickinfo     : 'Number of contact person'
        ContactPerson        : String(10);

        @cds.ambiguous     : 'missing on condition?'
        to_SalesContract     : Association to ZAPI_SALES_CONTRACT_SRV.A_SalesContract {};

        @cds.ambiguous     : 'missing on condition?'
        to_SalesContractItem : Association to ZAPI_SALES_CONTRACT_SRV.A_SalesContractItem {};
};

@cds.external        : true
@cds.persistence.skip: true
@sap.creatable       : 'false'
@sap.content.version : '1'
@sap.label           : 'Sales Contract Item Pricing Element (API)'
entity ZAPI_SALES_CONTRACT_SRV.A_SalesContractItemPrcgElmnt {
        @sap.display.format: 'UpperCase'
        @sap.label         : 'Sales document'
        @sap.quickinfo     : 'Sales Document'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
    key SalesContract                 : String(10) not null;

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Item'
        @sap.quickinfo     : 'Condition item number'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
    key SalesContractItem             : String(6) not null;

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Step Number'
    key PricingProcedureStep          : String(3) not null;

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Counter'
        @sap.quickinfo     : 'Condition Counter'
    key PricingProcedureCounter       : String(3) not null;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Condition type'
        ConditionType                 : String(4);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Valid From'
        @sap.quickinfo     : 'Timestamp for Pricing'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        PricingDateTime               : String(14);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Calculation Type'
        @sap.quickinfo     : 'Calculation Type for Condition'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ConditionCalculationType      : String(3);

        @sap.label         : 'Basis Value'
        @sap.quickinfo     : 'Condition Basis Value'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ConditionBaseValue            : Decimal(24, 9);

        @sap.label         : 'Amount'
        @sap.quickinfo     : 'Rate (Amount or Percentage)'
        ConditionRateValue            : Decimal(24, 9);

        @sap.label         : 'Currency'
        @sap.quickinfo     : 'Currency Key'
        @sap.semantics     : 'currency-code'
        ConditionCurrency             : String(5);

        @sap.unit          : 'ConditionQuantityUnit'
        @sap.label         : 'Pricing Unit'
        @sap.quickinfo     : 'Condition Pricing Unit'
        ConditionQuantity             : Decimal(5, 0);

        @sap.label         : 'Condition Unit'
        @sap.quickinfo     : 'Condition Unit in the Document'
        @sap.semantics     : 'unit-of-measure'
        ConditionQuantityUnit         : String(3);

        @sap.label         : 'Condition Category'
        @sap.quickinfo     : 'Condition Category (Examples: Tax, Freight, Price, Cost)'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ConditionCategory             : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Statistical'
        @sap.quickinfo     : 'Condition is used for statistics'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ConditionIsForStatistics      : Boolean;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Scale Type'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        PricingScaleType              : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Accruals'
        @sap.quickinfo     : 'Condition is Relevant for Accrual (e.g. Freight)'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        IsRelevantForAccrual          : Boolean;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Invoice List Cond.'
        @sap.quickinfo     : 'Condition for Invoice List'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        CndnIsRelevantForInvoiceList  : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Condition Origin'
        @sap.quickinfo     : 'Origin of the Condition'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ConditionOrigin               : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Group Condition'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        IsGroupCondition              : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Condition Record No.'
        @sap.quickinfo     : 'Number of the Condition Record'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ConditionRecord               : String(10);

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Sequent.No. of Cond.'
        @sap.quickinfo     : 'Sequential Number of the Condition'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ConditionSequentialNumber     : String(3);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Tax Code'
        @sap.quickinfo     : 'Tax on sales/purchases code'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        TaxCode                       : String(2);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'W/Tax Code'
        @sap.quickinfo     : 'Withholding Tax Code'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        WithholdingTaxCode            : String(2);

        @sap.unit          : 'TransactionCurrency'
        @sap.label         : 'Cond.Rounding Diff.'
        @sap.quickinfo     : 'Rounding-Off Difference of the Condition'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        CndnRoundingOffDiffAmount     : Decimal(6, 3);

        @sap.unit          : 'TransactionCurrency'
        @sap.label         : 'Value'
        @sap.quickinfo     : 'Condition Value'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ConditionAmount               : Decimal(16, 3);

        @sap.label         : 'Document Currency'
        @sap.quickinfo     : 'SD document currency'
        @sap.semantics     : 'currency-code'
        TransactionCurrency           : String(5);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Condition Control'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ConditionControl              : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Inactive Condition'
        @sap.quickinfo     : 'Condition is Inactive'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ConditionInactiveReason       : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Condition Class'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ConditionClass                : String(1);

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Counter'
        @sap.quickinfo     : 'Condition Counter (Header)'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        PrcgProcedureCounterForHeader : String(3);

        @sap.label         : 'Condition Factor'
        @sap.quickinfo     : 'Factor for Condition Base Value'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        FactorForConditionBasisValue  : Double;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Structure Condition'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        StructureCondition            : String(1);

        @sap.label         : 'Condition Factor'
        @sap.quickinfo     : 'Factor for Condition Basis (Period)'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        PeriodFactorForCndnBasisValue : Double;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Scale Basis'
        @sap.quickinfo     : 'Scale Basis Indicator'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        PricingScaleBasis             : String(3);

        @sap.label         : 'Scale Basis Value'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ConditionScaleBasisValue      : Decimal(24, 9);

        @sap.label         : 'Scale Unit of Meas.'
        @sap.quickinfo     : 'Condition Scale Unit of Measure'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        @sap.semantics     : 'unit-of-measure'
        ConditionScaleBasisUnit       : String(3);

        @sap.label         : 'Scale Currency'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        @sap.semantics     : 'currency-code'
        ConditionScaleBasisCurrency   : String(5);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Intercomp.Billing'
        @sap.quickinfo     : 'Condition for Intercompany Billing'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        CndnIsRelevantForIntcoBilling : Boolean;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Changed Manually'
        @sap.quickinfo     : 'Condition Changed Manually'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ConditionIsManuallyChanged    : Boolean;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'UsedforVariantConfig'
        @sap.quickinfo     : 'Condition Used for Variant Configuration'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ConditionIsForConfiguration   : Boolean;

        @sap.label         : 'Variant Condition'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        VariantCondition              : String(26);

        @cds.ambiguous     : 'missing on condition?'
        to_SalesContract              : Association to ZAPI_SALES_CONTRACT_SRV.A_SalesContract {};

        @cds.ambiguous     : 'missing on condition?'
        to_SalesContractItem          : Association to ZAPI_SALES_CONTRACT_SRV.A_SalesContractItem {};
};

@cds.external        : true
@cds.persistence.skip: true
@sap.creatable       : 'false'
@sap.content.version : '1'
@sap.label           : 'Sales Contract Partner (API)'
entity ZAPI_SALES_CONTRACT_SRV.A_SalesContractPartner {
        @sap.display.format: 'UpperCase'
        @sap.label         : 'Sales Order'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
    key SalesContract    : String(10) not null;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Partner Function'
    key PartnerFunction  : String(2) not null;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Customer'
        @sap.quickinfo     : 'Customer Number'
        Customer         : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Vendor'
        @sap.quickinfo     : 'Account Number of Vendor or Creditor'
        Supplier         : String(10);

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Personnel Number'
        Personnel        : String(8);

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Contact Person'
        @sap.quickinfo     : 'Number of contact person'
        ContactPerson    : String(10);

        @cds.ambiguous     : 'missing on condition?'
        to_SalesContract : Association to ZAPI_SALES_CONTRACT_SRV.A_SalesContract {};
};

@cds.external        : true
@cds.persistence.skip: true
@sap.creatable       : 'false'
@sap.content.version : '1'
@sap.label           : 'Sales Contract Pricing Element (API)'
entity ZAPI_SALES_CONTRACT_SRV.A_SalesContractPrcgElmnt {
        @sap.display.format: 'UpperCase'
        @sap.label         : 'Sales document'
        @sap.quickinfo     : 'Sales Document'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
    key SalesContract                 : String(10) not null;

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Step Number'
    key PricingProcedureStep          : String(3) not null;

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Counter'
        @sap.quickinfo     : 'Condition Counter'
    key PricingProcedureCounter       : String(3) not null;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Condition type'
        ConditionType                 : String(4);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Valid From'
        @sap.quickinfo     : 'Timestamp for Pricing'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        PricingDateTime               : String(14);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Calculation Type'
        @sap.quickinfo     : 'Calculation Type for Condition'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ConditionCalculationType      : String(3);

        @sap.label         : 'Basis Value'
        @sap.quickinfo     : 'Condition Basis Value'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ConditionBaseValue            : Decimal(24, 9);

        @sap.label         : 'Amount'
        @sap.quickinfo     : 'Rate (Amount or Percentage)'
        ConditionRateValue            : Decimal(24, 9);

        @sap.label         : 'Currency'
        @sap.quickinfo     : 'Currency Key'
        @sap.semantics     : 'currency-code'
        ConditionCurrency             : String(5);

        @sap.label         : 'Pricing Unit'
        @sap.quickinfo     : 'Condition Pricing Unit'
        ConditionQuantity             : Decimal(5, 0);

        @sap.label         : 'Condition Unit'
        @sap.quickinfo     : 'Condition Unit in the Document'
        @sap.semantics     : 'unit-of-measure'
        ConditionQuantityUnit         : String(3);

        @sap.label         : 'Condition Category'
        @sap.quickinfo     : 'Condition Category (Examples: Tax, Freight, Price, Cost)'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ConditionCategory             : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Statistical'
        @sap.quickinfo     : 'Condition is used for statistics'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ConditionIsForStatistics      : Boolean;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Scale Type'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        PricingScaleType              : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Condition Origin'
        @sap.quickinfo     : 'Origin of the Condition'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ConditionOrigin               : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Group Condition'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        IsGroupCondition              : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Condition Record No.'
        @sap.quickinfo     : 'Number of the Condition Record'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ConditionRecord               : String(10);

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Sequent.No. of Cond.'
        @sap.quickinfo     : 'Sequential Number of the Condition'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ConditionSequentialNumber     : String(3);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Tax Code'
        @sap.quickinfo     : 'Tax on sales/purchases code'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        TaxCode                       : String(2);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'W/Tax Code'
        @sap.quickinfo     : 'Withholding Tax Code'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        WithholdingTaxCode            : String(2);

        @sap.unit          : 'TransactionCurrency'
        @sap.label         : 'Cond.Rounding Diff.'
        @sap.quickinfo     : 'Rounding-Off Difference of the Condition'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        CndnRoundingOffDiffAmount     : Decimal(6, 3);

        @sap.unit          : 'TransactionCurrency'
        @sap.label         : 'Value'
        @sap.quickinfo     : 'Condition Value'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ConditionAmount               : Decimal(16, 3);

        @sap.label         : 'Document Currency'
        @sap.quickinfo     : 'SD document currency'
        @sap.semantics     : 'currency-code'
        TransactionCurrency           : String(5);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Condition Control'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ConditionControl              : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Inactive Condition'
        @sap.quickinfo     : 'Condition is Inactive'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ConditionInactiveReason       : String(1);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Condition Class'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ConditionClass                : String(1);

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Counter'
        @sap.quickinfo     : 'Condition Counter (Header)'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        PrcgProcedureCounterForHeader : String(3);

        @sap.label         : 'Condition Factor'
        @sap.quickinfo     : 'Factor for Condition Base Value'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        FactorForConditionBasisValue  : Double;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Structure Condition'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        StructureCondition            : String(1);

        @sap.label         : 'Condition Factor'
        @sap.quickinfo     : 'Factor for Condition Basis (Period)'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        PeriodFactorForCndnBasisValue : Double;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Scale Basis'
        @sap.quickinfo     : 'Scale Basis Indicator'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        PricingScaleBasis             : String(3);

        @sap.label         : 'Scale Basis Value'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ConditionScaleBasisValue      : Decimal(24, 9);

        @sap.label         : 'Scale Unit of Meas.'
        @sap.quickinfo     : 'Condition Scale Unit of Measure'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        @sap.semantics     : 'unit-of-measure'
        ConditionScaleBasisUnit       : String(3);

        @sap.label         : 'Scale Currency'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        @sap.semantics     : 'currency-code'
        ConditionScaleBasisCurrency   : String(5);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Intercomp.Billing'
        @sap.quickinfo     : 'Condition for Intercompany Billing'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        CndnIsRelevantForIntcoBilling : Boolean;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Changed Manually'
        @sap.quickinfo     : 'Condition Changed Manually'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ConditionIsManuallyChanged    : Boolean;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'UsedforVariantConfig'
        @sap.quickinfo     : 'Condition Used for Variant Configuration'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        ConditionIsForConfiguration   : Boolean;

        @sap.label         : 'Variant Condition'
        @sap.creatable     : 'false'
        @sap.updatable     : 'false'
        VariantCondition              : String(26);

        @cds.ambiguous     : 'missing on condition?'
        to_SalesContract              : Association to ZAPI_SALES_CONTRACT_SRV.A_SalesContract {};
};

// VALUE HELP

/* checksum : 4efdd53c977f37b507507d84e782a3c0 */
@cds.external               : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported: 'true'
@sap.supported.formats      : 'atom json xlsx'
service ZGMS_VALUE_HELP_SRV {};

@cds.external        : true
@cds.persistence.skip: true
@sap.creatable       : 'false'
@sap.updatable       : 'false'
@sap.deletable       : 'false'
@sap.pageable        : 'false'
@sap.content.version : '1'
entity ZGMS_VALUE_HELP_SRV.MaterialSet {
        @sap.unicode   : 'false'
        @sap.label     : 'Material'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
    key Matnr : String(40) not null;

        @sap.unicode   : 'false'
        @sap.label     : 'Base Unit'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
        @sap.semantics : 'unit-of-measure'
        Meins : String(3) not null;
};

@cds.external        : true
@cds.persistence.skip: true
@sap.creatable       : 'false'
@sap.updatable       : 'false'
@sap.deletable       : 'false'
@sap.pageable        : 'false'
@sap.content.version : '1'
entity ZGMS_VALUE_HELP_SRV.PlantSet {
        @sap.unicode   : 'false'
        @sap.label     : 'Plant'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
    key Werks : String(4) not null;

        @sap.unicode   : 'false'
        @sap.label     : 'Material'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
        Matnr : String(40) not null;
};

@cds.external        : true
@cds.persistence.skip: true
@sap.creatable       : 'false'
@sap.updatable       : 'false'
@sap.deletable       : 'false'
@sap.pageable        : 'false'
@sap.content.version : '1'
entity ZGMS_VALUE_HELP_SRV.Storage_LocSet {
        @sap.unicode   : 'false'
        @sap.label     : 'Stor. Loc.'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
    key Lgort : String(4) not null;
};

@cds.external        : true
@cds.persistence.skip: true
@sap.creatable       : 'false'
@sap.updatable       : 'false'
@sap.deletable       : 'false'
@sap.pageable        : 'false'
@sap.content.version : '1'
entity ZGMS_VALUE_HELP_SRV.Sold_To_PartySet {
        @sap.unicode   : 'false'
        @sap.label     : 'Customer'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
    key Kunnr : String(10) not null;
};

@cds.external        : true
@cds.persistence.skip: true
@sap.creatable       : 'false'
@sap.updatable       : 'false'
@sap.deletable       : 'false'
@sap.pageable        : 'false'
@sap.content.version : '1'
entity ZGMS_VALUE_HELP_SRV.LocationSet {
        @sap.unicode   : 'false'
        @sap.label     : 'Location ID'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
    key Pblnr : String(10) not null;

        @sap.unicode   : 'false'
        @sap.label     : 'Bus.loc. name'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
        Name1 : String(35) not null;
};

@cds.external        : true
@cds.persistence.skip: true
@sap.creatable       : 'false'
@sap.updatable       : 'false'
@sap.deletable       : 'false'
@sap.pageable        : 'false'
@sap.content.version : '1'
entity ZGMS_VALUE_HELP_SRV.TransportSet {
        @sap.unicode   : 'false'
        @sap.label     : 'Trans system'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
    key Tsyst : String(10) not null;

        @sap.unicode   : 'false'
        @sap.label     : 'TS name'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
        Tsnam : String(60) not null;
};

@cds.external        : true
@cds.persistence.skip: true
@sap.creatable       : 'false'
@sap.updatable       : 'false'
@sap.deletable       : 'false'
@sap.pageable        : 'false'
@sap.content.version : '1'
entity ZGMS_VALUE_HELP_SRV.Sales_OrgSet {
        @sap.unicode   : 'false'
        @sap.label     : 'Sales Org.'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
    key Vkorg : String(4) not null;
};

@cds.external        : true
@cds.persistence.skip: true
@sap.creatable       : 'false'
@sap.updatable       : 'false'
@sap.deletable       : 'false'
@sap.pageable        : 'false'
@sap.content.version : '1'
entity ZGMS_VALUE_HELP_SRV.Dist_ChannelSet {
        @sap.unicode   : 'false'
        @sap.label     : 'Distr. Channel'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
    key Vtweg : String(2) not null;
};

@cds.external        : true
@cds.persistence.skip: true
@sap.creatable       : 'false'
@sap.updatable       : 'false'
@sap.deletable       : 'false'
@sap.pageable        : 'false'
@sap.content.version : '1'
entity ZGMS_VALUE_HELP_SRV.DivisionSet {
        @sap.unicode   : 'false'
        @sap.label     : 'Division'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
    key Spart : String(2) not null;
};

@cds.external        : true
@cds.persistence.skip: true
@sap.creatable       : 'false'
@sap.updatable       : 'false'
@sap.deletable       : 'false'
@sap.pageable        : 'false'
@sap.content.version : '1'
entity ZGMS_VALUE_HELP_SRV.Ship_To_PartySet {
        @sap.unicode   : 'false'
        @sap.label     : 'Customer'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
    key Kunnr : String(10) not null;

        @sap.unicode   : 'false'
        @sap.label     : 'Sales Org.'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
        Vkorg : String(4) not null;

        @sap.unicode   : 'false'
        @sap.label     : 'Division'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
        Spart : String(2) not null;
};

@cds.external        : true
@cds.persistence.skip: true
@sap.creatable       : 'false'
@sap.updatable       : 'false'
@sap.deletable       : 'false'
@sap.pageable        : 'false'
@sap.content.version : '1'
entity ZGMS_VALUE_HELP_SRV.Sales_ContractSet {
        @sap.unicode   : 'false'
        @sap.label     : 'Sales Document'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
    key Vbeln : String(10) not null;
};

@cds.external        : true
@cds.persistence.skip: true
@sap.creatable       : 'false'
@sap.updatable       : 'false'
@sap.deletable       : 'false'
@sap.pageable        : 'false'
@sap.content.version : '1'
entity ZGMS_VALUE_HELP_SRV.LocMatnrSet {
        @sap.unicode   : 'false'
        @sap.label     : 'Material'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
    key Pmatnr   : String(40) not null;

        @sap.unicode   : 'false'
        @sap.label     : 'Location ID'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
        Locid    : String(10) not null;

        @sap.unicode   : 'false'
        @sap.label     : 'Plan UoM'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
        @sap.semantics : 'unit-of-measure'
        Pluom    : String(3) not null;

        @sap.unicode   : 'false'
        @sap.label     : 'Location name'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
        Locname  : String(60) not null;

        @sap.unicode   : 'false'
        @sap.label     : 'Description'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
        Pmatname : String(40) not null;
};

@cds.external        : true
@cds.persistence.skip: true
@sap.creatable       : 'false'
@sap.updatable       : 'false'
@sap.deletable       : 'false'
@sap.pageable        : 'false'
@sap.content.version : '1'
entity ZGMS_VALUE_HELP_SRV.UOMSet {
        @sap.unicode   : 'false'
        @sap.label     : 'Internal UoM'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
        @sap.semantics : 'unit-of-measure'
    key Msehi : String(3) not null;
};

@cds.external        : true
@cds.persistence.skip: true
@sap.creatable       : 'false'
@sap.updatable       : 'false'
@sap.deletable       : 'false'
@sap.pageable        : 'false'
@sap.content.version : '1'
entity ZGMS_VALUE_HELP_SRV.LocationPointSet {
        @sap.unicode   : 'false'
        @sap.label     : 'Location ID'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
    key Locid  : String(10) not null;

        @sap.unicode   : 'false'
        @sap.label     : 'Location type'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
        Loctyp : String(4) not null;

        @sap.unicode   : 'false'
        @sap.label     : 'Location name'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
        Locnam : String(60) not null;
};

@cds.external        : true
@cds.persistence.skip: true
@sap.creatable       : 'false'
@sap.updatable       : 'false'
@sap.deletable       : 'false'
@sap.pageable        : 'false'
@sap.content.version : '1'
entity ZGMS_VALUE_HELP_SRV.TsystLocSet {
        @sap.unicode   : 'false'
        @sap.label     : 'Trans system'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
    key Tsyst  : String(10) not null;

        @sap.unicode   : 'false'
        @sap.label     : 'Location ID'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
        Locid  : String(10) not null;

        @sap.unicode   : 'false'
        @sap.label     : 'Location name'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
        Locnam : String(60) not null;
};

@cds.external        : true
@cds.persistence.skip: true
@sap.creatable       : 'false'
@sap.updatable       : 'false'
@sap.deletable       : 'false'
@sap.pageable        : 'false'
@sap.content.version : '1'
entity ZGMS_VALUE_HELP_SRV.ContractTypeSet {
        @sap.unicode   : 'false'
        @sap.label     : 'Sales Doc. Type'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
    key Auart : String(4) not null;

        @sap.unicode   : 'false'
        @sap.label     : 'Screen seq.grp'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
        Kopgr : String(4) not null;
};

@cds.external        : true
@cds.persistence.skip: true
@sap.creatable       : 'false'
@sap.updatable       : 'false'
@sap.deletable       : 'false'
@sap.content.version : '1'
@sap.label           : 'Location Material'
entity ZGMS_VALUE_HELP_SRV.ZLocMatnr {
        @sap.display.format: 'UpperCase'
        @sap.label         : 'Location ID'
    key Locid    : String(10) not null;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Material'
        @sap.quickinfo     : 'Material Number'
    key Pmatnr   : String(40) not null;

        @sap.label         : 'Location name'
        @sap.quickinfo     : 'Location name (used by system owner)'
        Locname  : String(60);

        @sap.label         : 'Material description'
        Pmatname : String(40);

        @sap.label         : 'Planning UoM'
        @sap.quickinfo     : 'OIL-TSW: Planning UoM'
        @sap.semantics     : 'unit-of-measure'
        Pluom    : String(3);
};

@cds.external        : true
@cds.persistence.skip: true
@sap.creatable       : 'false'
@sap.updatable       : 'false'
@sap.deletable       : 'false'
@sap.content.version : '1'
@sap.label           : 'Location Path Mapping Value Help'
entity ZGMS_VALUE_HELP_SRV.ZLocPath_Map {
        @sap.display.format: 'UpperCase'
        @sap.label         : 'Business location ID'
        @sap.quickinfo     : 'Business location identifier (IS-Oil MRN)'
    key Pblnr  : String(10) not null;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Transport system'
    key Tsyst  : String(10) not null;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Location ID'
    key Locid  : String(10) not null;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Bus. Location Type'
        @sap.quickinfo     : 'Business Location Type (IS-Oil MRN)'
    key Pbltyp : String(4) not null;
};


// PROFILE SERVICE

/* checksum : 3068dfdafe28c058e62301dc0718d782 */
@cds.external               : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported: 'true'
@sap.supported.formats      : 'atom json xlsx'
service ZSERV_PD_SRV {};

@cds.external        : true
@cds.persistence.skip: true
@sap.creatable       : 'false'
@sap.updatable       : 'false'
@sap.deletable       : 'false'
@sap.pageable        : 'false'
@sap.content.version : '1'
entity ZSERV_PD_SRV.ServProfSet {
        @sap.unicode    : 'false'
        @sap.label      : 'ID'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
    key Id              : String(10) not null;

        @sap.unicode    : 'false'
        @sap.label      : 'Sales Document'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
    key Vbeln           : String(10) not null;

        @sap.unicode    : 'false'
        @sap.label      : 'Item'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
    key ProfileId       : String(6) not null;

        @sap.unicode    : 'false'
        @sap.label      : 'Threshold Perc'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        ThresholdP      : String(3) not null;

        @sap.unicode    : 'false'
        @sap.label      : 'Location ID'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        DeliveryPt      : String(10) not null;

        @sap.unicode    : 'false'
        @sap.label      : 'Item'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        ItemNo          : String(6) not null;

        @sap.unicode    : 'false'
        @sap.label      : 'Calculated Value'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        CalculatedValue : String(10) not null;

        @sap.unicode    : 'false'
        @sap.label      : 'Location ID'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        RedeliveryPt    : String(10) not null;

        @sap.unicode    : 'false'
        @sap.label      : 'Service Profile'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        ServProfile     : String(20) not null;

        @sap.unicode    : 'false'
        @sap.label      : 'Clause Code'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        ClauseCode      : String(10) not null;

        @sap.unicode    : 'false'
        @sap.label      : 'Firm'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        Firm            : String(20) not null;

        @sap.unicode    : 'false'
        @sap.label      : 'Interruptable'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        Interruptible   : String(20) not null;

        @odata.Type     : 'Edm.DateTime'
        @odata.Precision: 7
        @sap.unicode    : 'false'
        @sap.label      : 'Date'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        ValidFrom       : Timestamp;

        @sap.unicode    : 'false'
        @sap.label      : 'Path'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        Path            : String(20) not null;

        @odata.Type     : 'Edm.DateTime'
        @odata.Precision: 7
        @sap.unicode    : 'false'
        @sap.label      : 'Date'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        ValidTo         : Timestamp;

        @sap.unicode    : 'false'
        @sap.label      : 'Rank'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        Rank            : String(20) not null;

        @sap.unicode    : 'false'
        @sap.label      : 'DCQ'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        Dcq             : String(20) not null;

        @sap.unicode    : 'false'
        @sap.label      : 'Threshold Reference'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        ThreshRef       : String(20) not null;

        @sap.unicode    : 'false'
        @sap.label      : 'Max DCQ'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        MaxDcq          : String(20) not null;

        @sap.unicode    : 'false'
        @sap.label      : 'Remark'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        Remark          : String(50) not null;

        @sap.unicode    : 'false'
        @sap.label      : 'Min DCQ'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        MinDcq          : String(20) not null;

        @sap.unicode    : 'false'
        @sap.label      : 'Fuel Provider'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        FuelProvider    : String(20) not null;

        @sap.unicode    : 'false'
        @sap.label      : 'Fuel%'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        FuelPer         : String(20) not null;

        @sap.unicode    : 'false'
        @sap.label      : 'AACQ'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        Aacq            : String(20) not null;

        @sap.unicode    : 'false'
        @sap.label      : 'Overrun allowed'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        OverrunAllowed  : String(20) not null;

        @sap.unicode    : 'false'
        @sap.label      : 'Underrun allowed'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        UnderrunAllowed : String(20) not null;

        @sap.unicode    : 'false'
        @sap.label      : 'Take or pay'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        TakePay         : String(20) not null;

        @sap.unicode    : 'false'
        @sap.label      : 'Early Termination'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        EarlyTermCharge : String(20) not null;
};

@cds.external        : true
@cds.persistence.skip: true
@sap.creatable       : 'false'
@sap.updatable       : 'false'
@sap.deletable       : 'false'
@sap.pageable        : 'false'
@sap.content.version : '1'
entity ZSERV_PD_SRV.CreateSPSet {
        @sap.unicode   : 'false'
        @sap.label     : 'ID'
        @sap.creatable : 'false'
        @sap.updatable : 'false'
        @sap.sortable  : 'false'
        @sap.filterable: 'false'
    key Id             : String(10) not null;

        @cds.ambiguous : 'missing on condition?'
        IdtoServiceNav : Association to many ZSERV_PD_SRV.ServProfSet
                             on IdtoServiceNav.Id = Id;
};

@cds.external        : true
@cds.persistence.skip: true
@sap.creatable       : 'false'
@sap.updatable       : 'false'
@sap.deletable       : 'false'
@sap.content.version : '1'
@sap.label           : 'Service Profile Get'
entity ZSERV_PD_SRV.ZServProf_Get {
        @sap.display.format: 'UpperCase'
        @sap.label         : 'Sales document'
        @sap.quickinfo     : 'Sales Document'
    key Vbeln           : String(10) not null;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'ID'
        @sap.quickinfo     : 'Id'
    key Id              : String(10) not null;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Profile Id'
    key ProfileId       : String(10) not null;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Service Profile'
    key ServProfile     : String(20) not null;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Service Parameter'
    key ServiceParam    : String(20) not null;

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Sales Document Item'
    key ItemNo          : String(6) not null;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Service Parameter'
    key ClauseCode      : String(20) not null;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Parameter Value'
        @sap.quickinfo     : 'Service Parameter Value'
        ParamValue      : String(20);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Parameter Type'
        ParamType       : String(20);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Delivery Point'
        DeliveryPt      : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Redelivery Point'
        RedeliveryPt    : String(10);

        @sap.display.format: 'Date'
        @sap.label         : 'Valid From'
        ValidFrom       : Date;

        @sap.display.format: 'Date'
        @sap.label         : 'Valid To'
        ValidTo         : Date;

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Threshold Perc'
        @sap.quickinfo     : 'Threshold Percentage'
        ThresholdP      : String(3);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Service Parameter'
        ThreshRef       : String(20);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Remark'
        @sap.quickinfo     : 'Remarks'
        Remark          : String(50);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Calculated Value'
        CalculatedValue : String(10);
};


// ZNOMCP_GMS_SRV

/* checksum : 3c864a999801008ca263e2ec2297726e */
@cds.external               : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported: 'true'
@sap.supported.formats      : 'atom json xlsx'
service ZNOMCP_GMS_SRV {};

@cds.external        : true
@cds.persistence.skip: true
@sap.creatable       : 'false'
@sap.updatable       : 'false'
@sap.deletable       : 'false'
@sap.content.version : '1'
@sap.label           : 'GMS Nomination'
entity ZNOMCP_GMS_SRV.ZGMS_nom {
        @sap.display.format: 'Date'
        @sap.label         : 'Gas Day'
        @sap.quickinfo     : 'Gas Day Date'
    key Gasday          : Date not null;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Sales document'
        @sap.quickinfo     : 'Sales Document'
    key Vbeln           : String(10) not null;

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Sales Document Item'
    key Posnr           : String(6) not null;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Version'
    key Versn           : String(3) not null;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Nomination key'
        @sap.quickinfo     : 'Nomination (technical) Key'
    key Nomtk           : String(20) not null;

        @odata.Type        : 'Edm.DateTimeOffset'
        @sap.label         : 'Short Time Stamp'
        @sap.quickinfo     : 'UTC Time Stamp in Short Form (YYYYMMDDhhmmss)'
    key Timestamp       : DateTime not null;

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Sold-To Party'
        Kunnr           : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Sales Document Type'
        Auart           : String(4);

        @sap.display.format: 'NonNegative'
        @sap.label         : 'Priority'
        Rank            : String(3);

        @sap.unit          : 'PC5332959FA97B1B24F72095D9FE6B797'
        @sap.label         : 'Daily ContractQty'
        @sap.quickinfo     : 'DCQ'
        Dcq             : Decimal(13, 3);

        @sap.label         : 'Unit of Measure'
        @sap.quickinfo     : 'Unit of Measurement'
        @sap.semantics     : 'unit-of-measure'
        Uom1            : String(3);

        @sap.unit          : 'PC5332959FA97B1B24F72095D9FE6B797'
        @sap.label         : 'DNQ'
        @sap.quickinfo     : 'daily nomination Quantity'
        PDnq            : Decimal(13, 3);

        @sap.label         : 'Unit of Measurement'
        @sap.semantics     : 'unit-of-measure'
        Uom2            : String(3);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Event Type'
        @sap.quickinfo     : 'Nomination Event'
        Event           : String(40);

        @sap.unit          : 'PC5332959FA97B1B24F72095D9FE6B797'
        @sap.label         : 'Approved DNQ'
        Adnq            : Decimal(13, 3);

        @sap.unit          : 'PC5332959FA97B1B24F72095D9FE6B797'
        @sap.label         : 'RePublish DNQ'
        @sap.quickinfo     : 'Re-Publish DNQ'
        Rpdnq           : Decimal(13, 3);

        @sap.label         : 'Unit of Measurement'
        @sap.semantics     : 'unit-of-measure'
        Uom4            : String(3);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Nomination Number'
        Znomtk          : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Status'
        Zstat           : String(4);

        @sap.label         : 'Delivery Tolerace %'
        @sap.quickinfo     : 'Delivery Tolerance %'
        Dtolp           : Decimal(5, 2);

        @sap.unit          : 'PC5332959FA97B1B24F72095D9FE6B797'
        @sap.label         : 'Delivery Tolerace Q'
        @sap.quickinfo     : 'Delivery Tolerance Quantity'
        Dtolq           : Decimal(13, 3);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Potential Shortfall'
        ZpotentialSf    : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Source'
        Src             : String(3);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Delivery Point'
        ZdeliveryPoint  : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Long comment'
        @sap.quickinfo     : 'iSeries: Long comment of a table, view or table field'
        Remarks         : String(255);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Nomination Flag'
        @sap.quickinfo     : 'flag for customer nomination'
        Flag            : String(6);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Action'
        Action          : String(1);

        @sap.label         : 'Service Param'
        @sap.quickinfo     : 'Service Parameter'
        Srvparam1       : String(20);

        @sap.label         : 'Service Param'
        @sap.quickinfo     : 'Service Parameter'
        Srvparam2       : String(20);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Redelivery Point'
        @sap.quickinfo     : 'Re-Delivery Ponit'
        ZredelivryPoint : String(20);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Path'
        Path            : String(20);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Customer Group'
        CustGrp         : String(10);

        @sap.display.format: 'UpperCase'
        @sap.label         : 'Service Profile'
        SrvProfile      : String(20);
};

// CAPACITY RELEASE
/* checksum : 3d485092fc6310467152089381b538de */
@cds.external              : true
@m.IsDefaultEntityContainer: 'true'
@sap.supported.formats     : 'atom json xlsx'
service ZCAPACITYRELEASE_SRV {};

@cds.external        : true
@cds.persistence.skip: true
@sap.creatable       : 'false'
@sap.updatable       : 'false'
@sap.deletable       : 'false'
@sap.pageable        : 'false'
@sap.content.version : '1'
entity ZCAPACITYRELEASE_SRV.CapacityReleaseSet {
        @sap.unicode    : 'false'
        @sap.label      : 'Location ID'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
    key Locid   : String(10) not null;

        @sap.unicode    : 'false'
        @sap.label      : 'Material'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
    key Matnr   : String(40) not null;

        @odata.Type     : 'Edm.DateTime'
        @odata.Precision: 7
        @sap.unicode    : 'false'
        @sap.label      : 'From Date'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
    key Fromdat : Timestamp not null;

        @odata.Type     : 'Edm.DateTime'
        @odata.Precision: 7
        @sap.unicode    : 'false'
        @sap.label      : 'To Date'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        Todat   : Timestamp not null;

        @sap.unicode    : 'false'
        @sap.label      : 'Valuation Type'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        Charg   : String(10) not null;

        @sap.unicode    : 'false'
        @sap.label      : 'Production qty.'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        Rprod   : Decimal(13, 3) not null;

        @sap.unicode    : 'false'
        @sap.unit       : 'Puom'
        @sap.label      : 'Inverse Prod'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        Iprod   : Decimal(13, 3) not null;

        @sap.unicode    : 'false'
        @sap.label      : 'Production UOM'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        @sap.semantics  : 'unit-of-measure'
        Puom    : String(3) not null;
};

@cds.external        : true
@cds.persistence.skip: true
@sap.creatable       : 'false'
@sap.updatable       : 'false'
@sap.deletable       : 'false'
@sap.pageable        : 'false'
@sap.content.version : '1'
entity ZCAPACITYRELEASE_SRV.CreateCRSet {
        @sap.unicode    : 'false'
        @sap.label      : 'Location ID'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
    key Locid   : String(10) not null;

        @sap.unicode    : 'false'
        @sap.label      : 'Material'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
    key Matnr   : String(18) not null;

        @odata.Type     : 'Edm.DateTime'
        @odata.Precision: 7
        @sap.unicode    : 'false'
        @sap.label      : 'From Date'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
    key Fromdat : Timestamp not null;

        @odata.Type     : 'Edm.DateTime'
        @odata.Precision: 7
        @sap.unicode    : 'false'
        @sap.label      : 'To Date'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        Todat   : Timestamp not null;

        @sap.unicode    : 'false'
        @sap.label      : 'Valuation Type'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        Charg   : String(10) not null;

        @sap.unicode    : 'false'
        @sap.label      : 'Production qty.'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        Rprod   : Decimal(13, 3) not null;

        @sap.unicode    : 'false'
        @sap.label      : 'Inverse Prod'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        Iprod   : Decimal(13, 3) not null;

        @sap.unicode    : 'false'
        @sap.label      : 'Production UOM'
        @sap.creatable  : 'false'
        @sap.updatable  : 'false'
        @sap.sortable   : 'false'
        @sap.filterable : 'false'
        @sap.semantics  : 'unit-of-measure'
        Puom    : String(3) not null;
};
