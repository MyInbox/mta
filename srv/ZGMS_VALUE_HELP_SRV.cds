using ZGMS_VALUE_HELP_SRV from './external/ZGMS_VALUE_HELP_SRV.cds';

service ZGMS_VALUE_HELP_SRVSampleService {
    @readonly
    entity ContractTypeSet as projection on ZGMS_VALUE_HELP_SRV.ContractTypeSet
    {        Kopgr, key Auart     }    
;
    @readonly
    entity DivisionSet as projection on ZGMS_VALUE_HELP_SRV.DivisionSet
    {        key Spart     }    
;
    @readonly
    entity Dist_ChannelSet as projection on ZGMS_VALUE_HELP_SRV.Dist_ChannelSet
    {        key Vtweg     }    
;
    @readonly
    entity LocMatnrSet as projection on ZGMS_VALUE_HELP_SRV.LocMatnrSet
    {        Locid, Pluom, key Pmatnr, Locname, Pmatname     }    
;
    @readonly
    entity LocationPointSet as projection on ZGMS_VALUE_HELP_SRV.LocationPointSet
    {        key Locid, Loctyp, Locnam     }    
;
    @readonly
    entity LocationSet as projection on ZGMS_VALUE_HELP_SRV.LocationSet
    {        key Pblnr, Name1     }    
;
    @readonly
    entity MaterialSet as projection on ZGMS_VALUE_HELP_SRV.MaterialSet
    {        Meins, key Matnr     }    
;
    @readonly
    entity PlantSet as projection on ZGMS_VALUE_HELP_SRV.PlantSet
    {        Matnr, key Werks     }    
;
    @readonly
    entity Sales_ContractSet as projection on ZGMS_VALUE_HELP_SRV.Sales_ContractSet
    {        key Vbeln     }    
;
    @readonly
    entity Sales_OrgSet as projection on ZGMS_VALUE_HELP_SRV.Sales_OrgSet
    {        key Vkorg     }    
;
    @readonly
    entity Ship_To_PartySet as projection on ZGMS_VALUE_HELP_SRV.Ship_To_PartySet
    {        key Kunnr, Vkorg, Spart     }    
;
    @readonly
    entity Sold_To_PartySet as projection on ZGMS_VALUE_HELP_SRV.Sold_To_PartySet
    {        key Kunnr     }    
;
    @readonly
    entity Storage_LocSet as projection on ZGMS_VALUE_HELP_SRV.Storage_LocSet
    {        key Lgort     }    
;
    @readonly
    entity TransportSet as projection on ZGMS_VALUE_HELP_SRV.TransportSet
    {        key Tsyst, Tsnam     }    
;
    @readonly
    entity ZLocPath_Map as projection on ZGMS_VALUE_HELP_SRV.ZLocPath_Map
    {        key Pblnr, key Tsyst, key Locid, key Pbltyp     }    
;
    @readonly
    entity ZLocMatnr as projection on ZGMS_VALUE_HELP_SRV.ZLocMatnr
    {        key Locid, key Pmatnr, Locname, Pmatname, Pluom     }    
;
    @readonly
    entity UOMSet as projection on ZGMS_VALUE_HELP_SRV.UOMSet
    {        key Msehi     }    
;
    @readonly
    entity TsystLocSet as projection on ZGMS_VALUE_HELP_SRV.TsystLocSet
    {        key Tsyst, Locid, Locnam     }    
;
}