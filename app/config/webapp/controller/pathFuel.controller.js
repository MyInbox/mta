sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/json/JSONModel",
    "sap/ui/model/Filter",
    "sap/ui/model/FilterOperator",
    "sap/ui/model/FilterType",
], function (Controller, JSONModel,
    Filter,
    FilterOperator,
    FilterType,) {
    "use strict";
    var zloc;
    var Tsyst;
    var Tsys;
    return Controller.extend("app.config.controller.pathFuel", {
        onInit: function () {
            // Initialization code here, if needed
            var oData = new sap.ui.model.json.JSONModel();
            oData.loadData("/odata/v4/odataservices/ZLocPath_Map").then(function () {
                zloc = oData.getData().value;
                console.log("map", zloc);
            })
        },

        onDeliveryPoint: function () {
            console.log("hello");
            var oView = this.getView();
            if (!this.onLocationfrag) {
                this.onLocationfrag = sap.ui.xmlfragment(
                    oView.getId(),
                    "app.config.fragments.deliveryPoint",
                    this
                );
                oView.addDependent(this.onLocationfrag);
            }

            this.onLocationfrag.open();
        },

        ondelivery: function (oEvent) {
            var oSelectedItem = oEvent.getParameter("selectedItem");

            oEvent.getSource().getBinding("items").filter([]);

            if (!oSelectedItem) {
                return;
            }

            this.byId("Delivery_Point").setValue(oSelectedItem.getTitle());

            var loc = this.getView().byId("Delivery_Point");
            var sloc = loc.getValue();
            var uom = zloc.filter(function (ufm) {

                // console.log("Uom finding",ufm.Pluom);
                // console.log("material number",sloc);
                return ufm.Pblnr === sloc
            })
            console.log("filter data", uom);
            if (uom.length > 0) {
                var lastUom = uom[uom.length - 1];
                Tsys = lastUom.Tsyst
                this.getView().byId("_IDGenInput1").setValue(Tsys)
            }

        },
        onValueHelpDialogSearchde: function (oEvent) {
            var sValue = oEvent.getParameter("value");
            var oFilter = new Filter("Locid", FilterOperator.Contains, sValue);
            oEvent.getSource().getBinding("items").filter([oFilter]);
        },

        // onInputFieldChange: function (oEvent) {
        //   selectedData = this.getView().byId("Delivery_Point").getValue();
        //   console.log(selectedData);
        // },
        onReDeliveryPoint: function () {
            console.log("hello");
            var oView = this.getView();
            if (!this.onLocationfrag1) {
                this.onLocationfrag1 = sap.ui.xmlfragment(
                    oView.getId(),
                    "app.config.fragments.reDeliveryPoint",
                    this
                );
                oView.addDependent(this.onLocationfrag1);
            }

            this.onLocationfrag1.open();
        },
        onValueredivery: function (oEvent) {
            var oSelectedItem = oEvent.getParameter("selectedItem");

            oEvent.getSource().getBinding("items").filter([]);

            if (!oSelectedItem) {
                return;
            }

            this.byId("reDelivery_Point").setValue(oSelectedItem.getTitle());

            var loc = this.getView().byId("reDelivery_Point");
            var sloc = loc.getValue();
            var uom = zloc.filter(function (ufm) {

                // console.log("Uom finding",ufm.Pluom);
                // console.log("material number",sloc);
                return ufm.Pblnr === sloc
            })
            console.log("filter data", uom);
            if (uom.length > 0) {
                var lastUom = uom[uom.length - 1];
                Tsyst = lastUom.Tsyst
                this.getView().byId("_IDGenInput2").setValue(Tsyst)
            }

            if (Tsys === Tsyst) {
                this.getView().byId("_IDGenInput3").setValue("No")
            } else {
                this.getView().byId("_IDGenInput3").setValue("Yes")
            }

        },
        onValueHelpDialogSearch1: function (oEvent) {
            var sValue = oEvent.getParameter("value");
            var oFilter = new Filter("Locid", FilterOperator.Contains, sValue);
            oEvent.getSource().getBinding("items").filter([oFilter]);
        },

        // onInputFieldChange: function (oEvent) {
        //   selectedData = this.getView().byId("reDelivery_Point").getValue();
        //   console.log(selectedData);
        // },

        onCreateButtonPress: function () {
            // Get the reference to the table
            var table = this.byId("table");

            // Get the number of items currently in the table
            var itemCount = table.getItems().length++;


            // Create a new row
            var newRow = new sap.m.ColumnListItem({
                cells: [
                    new sap.m.Text({ text: itemCount.toString() }),
                    new sap.m.Input({
                        id: "Delivery_Point",
                        width: "100px",
                        showValueHelp: true,
                        required: true,
                        valueHelpRequest: "onDeliveryPoint",
                        value: "",
                        valueHelpOnly: true
                    }),
                    new sap.m.Input({ editable: false }),
                    new sap.m.Input({
                        id: "reDelivery_Point",
                        width: "100px",
                        showValueHelp: true,
                        required: true,
                        valueHelpRequest: "onReDeliveryPoint",
                        value: "",
                        valueHelpOnly: true
                    }),
                    new sap.m.Input({ editable: false }),
                    new sap.m.Input({ editable: false }),
                    new sap.m.Select({

                    }),
                    new sap.m.Select({

                    }),
                    new sap.m.Input({ editable: false }),
                ]

            });
            // Add the new row to the table
            table.addItem(newRow);
        },

    });
});
