const cds = require('@sap/cds');

module.exports = async (srv) => 
{        
    // Using CDS API      
    const ZNOMCP_GMS_SRV = await cds.connect.to("ZNOMCP_GMS_SRV"); 
      srv.on('READ', 'ZGMS_nom', req => ZNOMCP_GMS_SRV.run(req.query)); 
}