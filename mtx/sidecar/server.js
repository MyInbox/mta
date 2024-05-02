const cds = require('@sap/cds')
const xsenv = require("@sap/xsenv");
xsenv.loadEnv();
const services = xsenv.getServices({
  destination: { tag: "destination" },
  connectivity: { tag: "connectivity" },
});

cds.env.mtx.dependencies = [services.destination.xsappname, services.connectivity.xsappname];

cds.on('served', ()=>{
  const { 'cds.xt.ModelProviderService': mps } = cds.services
  const { 'cds.xt.DeploymentService': ds } = cds.services

  ds.after ('subscribe', (_,req) => { 
      return 'https://traininggms-ingenx-dev-gms-mt-approuter.cfapps.eu10-004.hana.ondemand.com';
   })

})