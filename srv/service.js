const cds = require('@sap/cds');

module.exports = async (srv) => {

  // Using VALUE HELP CDS API      
  const ZGMS_VALUE_HELP_SRV = await cds.connect.to("ZGMS_VALUE_HELP_SRV");
  srv.on('READ', 'ContractTypeSet', req => ZGMS_VALUE_HELP_SRV.run(req.query));
  srv.on('READ', 'Dist_ChannelSet', req => ZGMS_VALUE_HELP_SRV.run(req.query));
  srv.on('READ', 'DivisionSet', req => ZGMS_VALUE_HELP_SRV.run(req.query));
  srv.on('READ', 'LocMatnrSet', req => ZGMS_VALUE_HELP_SRV.run(req.query));
  srv.on('READ', 'LocationPointSet', req => ZGMS_VALUE_HELP_SRV.run(req.query));
  srv.on('READ', 'LocationSet', req => ZGMS_VALUE_HELP_SRV.run(req.query));
  srv.on('READ', 'MaterialSet', req => ZGMS_VALUE_HELP_SRV.run(req.query));
  srv.on('READ', 'PlantSet', req => ZGMS_VALUE_HELP_SRV.run(req.query));
  srv.on('READ', 'Sales_ContractSet', req => ZGMS_VALUE_HELP_SRV.run(req.query));
  srv.on('READ', 'Sales_OrgSet', req => ZGMS_VALUE_HELP_SRV.run(req.query));
  srv.on('READ', 'Sold_To_PartySet', req => ZGMS_VALUE_HELP_SRV.run(req.query));
  srv.on('READ', 'Ship_To_PartySet', req => ZGMS_VALUE_HELP_SRV.run(req.query));
  srv.on('READ', 'Storage_LocSet', req => ZGMS_VALUE_HELP_SRV.run(req.query));
  srv.on('READ', 'TransportSet', req => ZGMS_VALUE_HELP_SRV.run(req.query));
  srv.on('READ', 'ZLocMatnr', req => ZGMS_VALUE_HELP_SRV.run(req.query));
  srv.on('READ', 'TsystLocSet', req => ZGMS_VALUE_HELP_SRV.run(req.query));
  srv.on('READ', 'UOMSet', req => ZGMS_VALUE_HELP_SRV.run(req.query));
  srv.on('READ', 'ZLocPath_Map', req => ZGMS_VALUE_HELP_SRV.run(req.query));

  // Using SALES CDS API      
  const ZAPI_SALES_CONTRACT_SRV = await cds.connect.to("ZAPI_SALES_CONTRACT_SRV");
  srv.on('READ', 'A_SalesContractPrcgElmnt', req => ZAPI_SALES_CONTRACT_SRV.run(req.query));
  srv.on('READ', 'A_SalesContractPartner', req => ZAPI_SALES_CONTRACT_SRV.run(req.query));
  srv.on('READ', 'A_SalesContractItemPrcgElmnt', req => ZAPI_SALES_CONTRACT_SRV.run(req.query));
  srv.on('READ', 'A_SalesContractItemPartner', req => ZAPI_SALES_CONTRACT_SRV.run(req.query));
  srv.on('READ', 'A_SalesContractItem', req => ZAPI_SALES_CONTRACT_SRV.run(req.query));
  srv.on('READ', 'A_SalesContract', req => ZAPI_SALES_CONTRACT_SRV.run(req.query));

  srv.on('CREATE', 'A_SalesContractPrcgElmnt', req => ZAPI_SALES_CONTRACT_SRV.run(req.query));
  srv.on('CREATE', 'A_SalesContractPartner', req => ZAPI_SALES_CONTRACT_SRV.run(req.query));
  srv.on('CREATE', 'A_SalesContractItemPrcgElmnt', req => ZAPI_SALES_CONTRACT_SRV.run(req.query));
  srv.on('CREATE', 'A_SalesContractItemPartner', req => ZAPI_SALES_CONTRACT_SRV.run(req.query));
  srv.on('CREATE', 'A_SalesContractItem', req => ZAPI_SALES_CONTRACT_SRV.run(req.query));
  srv.on('CREATE', 'A_SalesContract', req => ZAPI_SALES_CONTRACT_SRV.run(req.query));

  // PROFILE SERVICE API

  const ZSERV_PD_SRV = await cds.connect.to("ZSERV_PD_SRV"); 
  srv.on('READ', 'ZServProf_Get', req => ZSERV_PD_SRV.run(req.query)); 
  srv.on('READ', 'ServProfSet', req => ZSERV_PD_SRV.run(req.query)); 
  srv.on('READ', 'CreateSPSet', req => ZSERV_PD_SRV.run(req.query)); 

  srv.on('CREATE', 'ZServProf_Get', req => ZSERV_PD_SRV.run(req.query)); 
  srv.on('CREATE', 'ServProfSet', req => ZSERV_PD_SRV.run(req.query)); 
  srv.on('CREATE', 'CreateSPSet', req => ZSERV_PD_SRV.run(req.query)); 

  // ZNOMCP_SRV

  const ZNOMCP_GMS_SRV = await cds.connect.to("ZNOMCP_GMS_SRV");
  srv.on('READ', 'ZGMS_nom', req => ZNOMCP_GMS_SRV.run(req.query));
  srv.on('CREATE', 'ZGMS_nom', req => ZNOMCP_GMS_SRV.run(req.query));
  srv.on('UPDATE', 'ZGMS_nom', req => ZNOMCP_GMS_SRV.run(req.query));

  // CAPACITY RELEASE

  const ZCAPACITYRELEASE_SRV = await cds.connect.to("ZCAPACITYRELEASE_SRV");
  srv.on('READ', 'CreateCRSet', req => ZCAPACITYRELEASE_SRV.run(req.query));
  srv.on('READ', 'CapacityReleaseSet', req => ZCAPACITYRELEASE_SRV.run(req.query));
  srv.on('CREATE', 'CreateCRSet', req => ZCAPACITYRELEASE_SRV.run(req.query));

}