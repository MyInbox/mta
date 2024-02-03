sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/core/format/DateFormat",
    "sap/m/MessageBox",
    "sap/ui/model/Filter",
    "sap/ui/model/FilterOperator",
    "sap/ui/model/FilterType",
    "sap/ui/model/json/JSONModel",
    "sap/m/Label"
], function (Controller, DateFormat, MessageBox, Filter, FilterOperator, FilterType, JSONModel, Label) {
    "use strict";
    var GasDate;
    return Controller.extend("app.gms.controller.balancing", {
        onInit: function () {
           
        },
        onLoc: function () {
            console.log("hello");
            var oView = this.getView();
            if (!this._oTankInfomates) {
              this._oTankInfomates = sap.ui.xmlfragment(
                oView.getId(),
                "app.gms.fragments.location",
                this
              );
              oView.addDependent(this._oTankInfomates);
            }
   
            this._oTankInfomates.open();
          },
          onValueHelpCloseloc: function (oEvent) {
            var oSelectedItem = oEvent.getParameter("selectedItem");
   
            oEvent.getSource().getBinding("items").filter([]);
   
            if (!oSelectedItem) {
              return;
            }
   
            this.byId("location").setValue(oSelectedItem.getTitle());
          },
         
   
          //Material field
          onMat: function () {
            var oView = this.getView();
            if (!this._oTankInfates) {
              this._oTankInfates = sap.ui.xmlfragment(
                oView.getId(),
                "app.gms.fragments.material",
                this
              );
              oView.addDependent(this._oTankInfates);
            }
   
            this._oTankInfates.open();
        },
       
        onValueHelpClose7: function (oEvent) {
            var oSelectedItem = oEvent.getParameter("selectedItem");
   
            oEvent.getSource().getBinding("items").filter([]);
   
            if (!oSelectedItem) {
              return;
            }
   
            this.byId("mat").setValue(oSelectedItem.getTitle());
          },


       
    });
});
