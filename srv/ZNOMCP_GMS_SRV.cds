using ZNOMCP_GMS_SRV from './external/ZNOMCP_GMS_SRV.cds';

service ZNOMCP_GMS_SRVSampleService {
    @readonly
    entity ZGMS_nom as projection on ZNOMCP_GMS_SRV.ZGMS_nom
    {        key Gasday, key Vbeln, key Posnr, key Versn, key Nomtk, key Timestamp, Kunnr, Auart, Rank, Dcq, Uom1, PDnq, Uom2, Event, Adnq, Rpdnq, Uom4, Znomtk, Zstat, Dtolp, Dtolq, ZpotentialSf, Src, ZdeliveryPoint, Remarks, Flag, Action, Srvparam1, Srvparam2, ZredelivryPoint, Path, CustGrp, SrvProfile     }    
;
}