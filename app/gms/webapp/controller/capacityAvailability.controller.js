sap.ui.define(
    [
        "sap/ui/core/mvc/Controller",
        "sap/m/MessageToast",
        "sap/ui/model/json/JSONModel",
    ],
    function (Controller, MessageToast, JSONModel) {
        "use strict";

        return Controller.extend("app.gms.controller.capacityAvailability", {
            onInit: function () {
                var oComponent = this.getOwnerComponent();
                var oModel = oComponent.getModel("formData");

                if (oModel) {
                    var oFormData = oModel.getData();
                    console.log("Form Data in View2:", oFormData);
                }
            },

            onCreate: async function () {
                const sDay = this.getView().byId("materialText2").getText();
                const sLocation = this.getView().byId("locationText").getText();
                const sAvailableCapacity = this.getView()
                    .byId("yourInputId")
                    .getValue();
                const sMaterial = this.getView().byId("materialText").getText();
                const sUom = this.getView().byId("yourInput").getText();

                const parts = sDay.split(/[-T:.+]/);
                const dateObject = new Date(
                    Date.UTC(
                        parts[0],
                        parts[1] - 1,
                        parts[2],
                        parts[3],
                        parts[4],
                        parts[5],
                        parts[6]
                    )
                );

                const formattedDateTime =
                    dateObject.getUTCFullYear() +
                    "-" +
                    ("0" + (dateObject.getUTCMonth() + 1)).slice(-2) +
                    "-" +
                    ("0" + dateObject.getUTCDate()).slice(-2) +
                    "T" +
                    ("0" + dateObject.getUTCHours()).slice(-2) +
                    ":" +
                    ("0" + dateObject.getUTCMinutes()).slice(-2) +
                    ":" +
                    ("0" + dateObject.getUTCSeconds()).slice(-2) +
                    "Z";

                const oData = {
                    Locid: sLocation,
                    Matnr: sMaterial,
                    Fromdat: formattedDateTime,
                    Todat: formattedDateTime,
                    Charg: "",
                    Rprod: parseInt(sAvailableCapacity),
                    Iprod: 0,
                    Puom: sUom,
                };

                const oModel = new sap.ui.model.json.JSONModel();
                oModel.setData(oData);

                this.getView().setModel(oModel, "createData");
                const myData = this.getView().getModel("createData").getData();
                console.log("Model data after requestCompleted:", myData);
                let createData = this.getOwnerComponent().getModel();
                let oBinding = createData.bindList("/CreateCRSet");
                oBinding.create(myData, {
                    success: function (msg) {
                        MessageToast.show("Data Posted Successfully!")
                        console.log(msg);
                    },
                    error: function (err) {
                        console.log(err);
                    }
                })
            }
        });
    });  