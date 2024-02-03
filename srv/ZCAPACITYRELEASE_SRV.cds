using ZCAPACITYRELEASE_SRV from './external/ZCAPACITYRELEASE_SRV.cds';

service ZCAPACITYRELEASE_SRVSampleService {
    @readonly
    entity CreateCRSet as projection on ZCAPACITYRELEASE_SRV.CreateCRSet
    {        key Locid, key Matnr, key Fromdat, Todat, Charg, Rprod, Iprod, Puom     }    
;
    @readonly
    entity CapacityReleaseSet as projection on ZCAPACITYRELEASE_SRV.CapacityReleaseSet
    {        key Locid, key Matnr, key Fromdat, Todat, Charg, Rprod, Iprod, Puom     }    
;
}