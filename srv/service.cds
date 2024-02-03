using {app.gms} from '../db/schema';

service odataservices {

    entity employee                      as projection on gms.employee;
    entity ServiceProfileParameters      as projection on gms.ServiceProfileParameters;
    entity serviceProfileParametersItems as projection on gms.serviceProfileParametersItems;
    entity ServiceProfile                as projection on gms.ServiceProfile;
    entity ContractTypeSet               as projection on gms.ZGMS_VALUE_HELP_SRV.ContractTypeSet;
    entity Dist_ChannelSet               as projection on gms.ZGMS_VALUE_HELP_SRV.Dist_ChannelSet;
    entity DivisionSet                   as projection on gms.ZGMS_VALUE_HELP_SRV.DivisionSet;
    entity LocMatnrSet                   as projection on gms.ZGMS_VALUE_HELP_SRV.LocMatnrSet;
    entity LocationPointSet              as projection on gms.ZGMS_VALUE_HELP_SRV.LocationPointSet;
    entity LocationSet                   as projection on gms.ZGMS_VALUE_HELP_SRV.LocationSet;
    entity MaterialSet                   as projection on gms.ZGMS_VALUE_HELP_SRV.MaterialSet;
    entity PlantSet                      as projection on gms.ZGMS_VALUE_HELP_SRV.PlantSet;
    entity Sales_ContractSet             as projection on gms.ZGMS_VALUE_HELP_SRV.Sales_ContractSet;
    entity Sales_OrgSet                  as projection on gms.ZGMS_VALUE_HELP_SRV.Sales_OrgSet;
    entity Ship_To_PartySet              as projection on gms.ZGMS_VALUE_HELP_SRV.Ship_To_PartySet;
    entity Sold_To_PartySet              as projection on gms.ZGMS_VALUE_HELP_SRV.Sold_To_PartySet;
    entity Storage_LocSet                as projection on gms.ZGMS_VALUE_HELP_SRV.Storage_LocSet;
    entity TransportSet                  as projection on gms.ZGMS_VALUE_HELP_SRV.TransportSet;
    entity TsystLocSet                   as projection on gms.ZGMS_VALUE_HELP_SRV.TsystLocSet;
    entity UOMSet                        as projection on gms.ZGMS_VALUE_HELP_SRV.UOMSet;
    entity ZLocMatnr                     as projection on gms.ZGMS_VALUE_HELP_SRV.ZLocMatnr;
    entity ZLocPath_Map                  as projection on gms.ZGMS_VALUE_HELP_SRV.ZLocPath_Map;
    entity A_SalesContract               as projection on gms.ZAPI_SALES_CONTRACT_SRV.A_SalesContract;
    entity A_SalesContractItem           as projection on gms.ZAPI_SALES_CONTRACT_SRV.A_SalesContractItem;
    entity A_SalesContractItemPartner    as projection on gms.ZAPI_SALES_CONTRACT_SRV.A_SalesContractItemPartner;
    entity A_SalesContractItemPrcgElmnt  as projection on gms.ZAPI_SALES_CONTRACT_SRV.A_SalesContractItemPrcgElmnt;
    entity A_SalesContractPrcgElmnt      as projection on gms.ZAPI_SALES_CONTRACT_SRV.A_SalesContractPrcgElmnt;
    entity CreateSPSet                   as projection on gms.ZSERV_PD_SRV.CreateSPSet;
    entity ServProfSet                   as projection on gms.ZSERV_PD_SRV.ServProfSet;
    entity ZServProf_Get                 as projection on gms.ZSERV_PD_SRV.ZServProf_Get;
    entity ZGMS_nom                      as projection on gms.ZNOMCP_GMS_SRV.ZGMS_nom;
    entity CapacityReleaseSet            as projection on gms.ZCAPACITYRELEASE_SRV.CapacityReleaseSet;
    entity CreateCRSet                   as projection on gms.ZCAPACITYRELEASE_SRV.CreateCRSet;

}
