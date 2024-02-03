const cds = require('@sap/cds');

module.exports = async (srv) => 
{        
    // Using CDS API      
    const ZSERV_PD_SRV = await cds.connect.to("ZSERV_PD_SRV"); 
      srv.on('READ', 'ZServProf_Get', req => ZSERV_PD_SRV.run(req.query)); 
      srv.on('READ', 'ServProfSet', req => ZSERV_PD_SRV.run(req.query)); 
      srv.on('READ', 'CreateSPSet', req => ZSERV_PD_SRV.run(req.query)); 
}