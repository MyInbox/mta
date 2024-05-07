const cds = require("@sap/cds");
const proxy = require("@sap/cds-odata-v2-adapter-proxy");

cds.on("bootstrap", (app) => {
        app.use(proxy())       
    }    
);

// cds.on('served', ()=>{
//     const { 'cds.xt.ModelProviderService': mps } = cds.services
//     const { 'cds.xt.DeploymentService': ds } = cds.services
//     const {'cds.xt.SaasProvisioningService': sp} = cds.services


//     ds.on('subscribe', async (req, next) => {
//         await next();
//         return 'https://traininggms-ingenx-dev-gms-mt-approuter.cfapps.eu10-004.hana.ondemand.com';
//      });
  
//     sp.on('dependencies', async (req, next) => {
//       let dependencies = await next();
//       const services = xsenv.getServices({
//           html5Runtime: { tag: 'html5-apps-repo-rt' },
//           destination: { tag: 'destination' },
//           connectivity: { tag: "connectivity" }
//       });
  
//       dependencies.push({ xsappname: services.html5Runtime.uaa.xsappname });
//       dependencies.push({ xsappname: services.destination.xsappname });
//       dependencies.push({ xsappname: services.connectivity.xsappname });
      
//       Logger.log("SaaS Dependencies:", JSON.stringify(dependencies));
//       return dependencies;    
//     });

// })

module.exports = cds.server;