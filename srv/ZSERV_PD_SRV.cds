using ZSERV_PD_SRV from './external/ZSERV_PD_SRV.cds';

service ZSERV_PD_SRVSampleService {
    @readonly
    entity ZServProf_Get as projection on ZSERV_PD_SRV.ZServProf_Get
    {        key Vbeln, key Id, key ProfileId, key ServProfile, key ServiceParam, key ItemNo, key ClauseCode, ParamValue, ParamType, DeliveryPt, RedeliveryPt, ValidFrom, ValidTo, ThresholdP, ThreshRef, Remark, CalculatedValue     }    
;
    @readonly
    entity ServProfSet as projection on ZSERV_PD_SRV.ServProfSet
    {        ThresholdP, DeliveryPt, key Id, ItemNo, CalculatedValue, RedeliveryPt, key Vbeln, key ProfileId, ServProfile, ClauseCode, Firm, Interruptible, ValidFrom, Path, ValidTo, Rank, Dcq, ThreshRef, MaxDcq, Remark, MinDcq, FuelProvider, FuelPer, Aacq, OverrunAllowed, UnderrunAllowed, TakePay, EarlyTermCharge     }    
;
    @readonly
    entity CreateSPSet as projection on ZSERV_PD_SRV.CreateSPSet
    {        key Id     }    
;
}