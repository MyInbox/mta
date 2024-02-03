using ZAPI_SALES_CONTRACT_SRV from './external/ZAPI_SALES_CONTRACT_SRV.cds';

service ZAPI_SALES_CONTRACT_SRVSampleService {
    @readonly
    entity A_SalesContractPrcgElmnt as projection on ZAPI_SALES_CONTRACT_SRV.A_SalesContractPrcgElmnt
    {        key SalesContract, key PricingProcedureStep, key PricingProcedureCounter, ConditionType, PricingDateTime, ConditionCalculationType, ConditionBaseValue, ConditionRateValue, ConditionCurrency, ConditionQuantity, ConditionQuantityUnit, ConditionCategory, ConditionIsForStatistics, PricingScaleType, ConditionOrigin, IsGroupCondition, ConditionRecord, ConditionSequentialNumber, TaxCode, WithholdingTaxCode, CndnRoundingOffDiffAmount, ConditionAmount, TransactionCurrency, ConditionControl, ConditionInactiveReason, ConditionClass, PrcgProcedureCounterForHeader, FactorForConditionBasisValue, StructureCondition, PeriodFactorForCndnBasisValue, PricingScaleBasis, ConditionScaleBasisValue, ConditionScaleBasisUnit, ConditionScaleBasisCurrency, CndnIsRelevantForIntcoBilling, ConditionIsManuallyChanged, ConditionIsForConfiguration, VariantCondition     }    
;
    @readonly
    entity A_SalesContractPartner as projection on ZAPI_SALES_CONTRACT_SRV.A_SalesContractPartner
    {        key SalesContract, key PartnerFunction, Customer, Supplier, Personnel, ContactPerson     }    
;
    @readonly
    entity A_SalesContractItemPrcgElmnt as projection on ZAPI_SALES_CONTRACT_SRV.A_SalesContractItemPrcgElmnt
    {        key SalesContract, key SalesContractItem, key PricingProcedureStep, key PricingProcedureCounter, ConditionType, PricingDateTime, ConditionCalculationType, ConditionBaseValue, ConditionRateValue, ConditionCurrency, ConditionQuantity, ConditionQuantityUnit, ConditionCategory, ConditionIsForStatistics, PricingScaleType, IsRelevantForAccrual, CndnIsRelevantForInvoiceList, ConditionOrigin, IsGroupCondition, ConditionRecord, ConditionSequentialNumber, TaxCode, WithholdingTaxCode, CndnRoundingOffDiffAmount, ConditionAmount, TransactionCurrency, ConditionControl, ConditionInactiveReason, ConditionClass, PrcgProcedureCounterForHeader, FactorForConditionBasisValue, StructureCondition, PeriodFactorForCndnBasisValue, PricingScaleBasis, ConditionScaleBasisValue, ConditionScaleBasisUnit, ConditionScaleBasisCurrency, CndnIsRelevantForIntcoBilling, ConditionIsManuallyChanged, ConditionIsForConfiguration, VariantCondition     }    
;
    @readonly
    entity A_SalesContractItemPartner as projection on ZAPI_SALES_CONTRACT_SRV.A_SalesContractItemPartner
    {        key SalesContract, key SalesContractItem, key PartnerFunction, Customer, Supplier, Personnel, ContactPerson     }    
;
    @readonly
    entity A_SalesContractItem as projection on ZAPI_SALES_CONTRACT_SRV.A_SalesContractItem
    {        key SalesContract, key SalesContractItem, HigherLevelItem, SalesContractItemCategory, SalesContractItemText, PurchaseOrderByCustomer, Material, MaterialByCustomer, PricingDate, RequestedQuantity, RequestedQuantityUnit, ItemGrossWeight, ItemNetWeight, ItemWeightUnit, ItemVolume, ItemVolumeUnit, OutlineAgreementTargetAmount, TransactionCurrency, NetAmount, MaterialGroup, MaterialPricingGroup, Batch, ProductionPlant, StorageLocation, ShippingPoint, IncotermsClassification, IncotermsTransferLocation, IncotermsLocation1, IncotermsLocation2, CustomerPaymentTerms, SalesDocumentRjcnReason, ItemBillingBlockReason, WBSElement, ProfitCenter, ReferenceSDDocument, ReferenceSDDocumentItem, SDProcessStatus, SalesContractValidityStartDate, SalesContractValidityEndDate, NmbrOfSalesContractValdtyPerd, SalesContractValidityPerdUnit, SalesContractValidityPerdCat, SalesContractSignedDate, SalesContractFollowUpAction, SlsContractFollowUpActionDate, RequirementSegment     }    
;
    @readonly
    entity A_SalesContract as projection on ZAPI_SALES_CONTRACT_SRV.A_SalesContract
    {        key SalesContract, SalesContractType, SalesOrganization, DistributionChannel, OrganizationDivision, SalesGroup, SalesOffice, SalesDistrict, SoldToParty, CreationDate, CreatedByUser, LastChangeDate, LastChangeDateTime, PurchaseOrderByCustomer, CustomerPurchaseOrderType, CustomerPurchaseOrderDate, SalesContractDate, TotalNetAmount, TransactionCurrency, SDDocumentReason, PricingDate, IncotermsClassification, IncotermsTransferLocation, IncotermsLocation1, IncotermsLocation2, IncotermsVersion, CustomerPaymentTerms, PaymentMethod, SalesContractValidityStartDate, SalesContractValidityEndDate, SalesContractValidityPerdUnit, SalesContractValidityPerdCat, SalesContractSignedDate, NmbrOfSalesContractValdtyPerd, SalesContractFollowUpAction, SlsContractFollowUpActionDate, ContractManualCompletion, ReferenceSDDocument, ReferenceSDDocumentCategory, OverallSDProcessStatus, TotalCreditCheckStatus, OverallSDDocumentRejectionSts     }    
;
}