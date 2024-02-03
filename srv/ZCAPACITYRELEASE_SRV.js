const cds = require('@sap/cds');

module.exports = async (srv) => 
{        
    // Using CDS API      
    const ZCAPACITYRELEASE_SRV = await cds.connect.to("ZCAPACITYRELEASE_SRV"); 
      srv.on('READ', 'CreateCRSet', req => ZCAPACITYRELEASE_SRV.run(req.query)); 
      srv.on('READ', 'CapacityReleaseSet', req => ZCAPACITYRELEASE_SRV.run(req.query)); 
}