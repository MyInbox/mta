sap.ui.define(
    [
      "sap/ui/core/mvc/Controller",
      "sap/ui/model/Filter",
      "sap/ui/model/FilterOperator",
      "sap/ui/model/json/JSONModel"
    ],
    function(BaseController, Filter, FilterOperator, JSONModel) {
      "use strict";
  
      return BaseController.extend("app.gms.controller.publishNom", {
        onInit: function() {
          this.Router = this.getOwnerComponent().getRouter();
        },
        onSearch: function(oEvent){
          var sSearch = oEvent.getParameter("query");
          var oFilter= new Filter("SalesContractType", FilterOperator.Contains, sSearch);
          var oFilter2= new Filter("SalesContract", FilterOperator.Contains, sSearch);
          var aFilter= [oFilter, oFilter2];
          var oMaster= new Filter({
              filters: aFilter,
              and: false
          })
          var oList = this.getView().byId("idlst");
          oList.getBinding("items").filter(oMaster);

      },
      onContractSelect: function(oEvent) {
        var oSelectedItem = oEvent.getParameter("listItem");
         this.Router.navTo("RoutecontractId",{
          contractId: oSelectedItem.getBindingContextPath().split("/")[1]
         });
      }
      });
    }
  );
  