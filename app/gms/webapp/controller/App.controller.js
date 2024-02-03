sap.ui.define(
    [
        "sap/ui/core/mvc/Controller",
        "sap/ui/core/routing/History"
    ],
    function(BaseController,History) {
      "use strict";
  
      return BaseController.extend("app.gms.controller.App", {
        onInit: function() {
        },
        onPressBack: function() {
          const oHistory = History.getInstance();
           const sPreviousHash = oHistory.getPreviousHash();
   
           if (sPreviousHash !== undefined) {
             window.history.go(-1);
           } else {
             const oRouter = this.getOwnerComponent().getRouter();
             oRouter.navTo("Routehome", {}, true);
           }
        }
      });
    }
  );
  