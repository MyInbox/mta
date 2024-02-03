sap.ui.define(
    [
        "sap/ui/core/mvc/Controller"
    ],
    function(BaseController) {
      "use strict";
  
      return BaseController.extend("app.gms.controller.gascontract", {
        onInit: function() {
        },
        onCGC:function(){
          const CGC = this.getOwnerComponent().getRouter();
          CGC.navTo("RoutecreateGC");
        },
        onAGC:function(){
          const AGC = this.getOwnerComponent().getRouter();
          AGC.navTo("RouteamendGC")

        }
      });
    }
  );
  