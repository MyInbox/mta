const cds = require('@sap/cds');

module.exports = async (srv) => 
{        
    // Using CDS API      
    const ZAPI_SALES_CONTRACT_SRV = await cds.connect.to("ZAPI_SALES_CONTRACT_SRV"); 
      srv.on('READ', 'A_SalesContractPrcgElmnt', req => ZAPI_SALES_CONTRACT_SRV.run(req.query)); 
      srv.on('READ', 'A_SalesContractPartner', req => ZAPI_SALES_CONTRACT_SRV.run(req.query)); 
      srv.on('READ', 'A_SalesContractItemPrcgElmnt', req => ZAPI_SALES_CONTRACT_SRV.run(req.query)); 
      srv.on('READ', 'A_SalesContractItemPartner', req => ZAPI_SALES_CONTRACT_SRV.run(req.query)); 
      srv.on('READ', 'A_SalesContractItem', req => ZAPI_SALES_CONTRACT_SRV.run(req.query)); 
      srv.on('READ', 'A_SalesContract', req => ZAPI_SALES_CONTRACT_SRV.run(req.query)); 
}