sap.ui.define(
  [
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/json/JSONModel",
    "sap/ui/model/Filter",

    "sap/ui/model/FilterOperator",
    "sap/m/MessageBox",
  ],
  function (BaseController, JSONModel, Filter, FilterOperator, MessageBox) {
    "use strict";
    var formattedGasday;
    var gasday;
    var formattedTimestamp;
    return BaseController.extend("app.gms.controller.createNomination", {

      onInit: function () {
        this.oRouter = this.getOwnerComponent().getRouter();
        this.oRouter.getRoute("RoutecontractId").attachPatternMatched(this.contNum, this);
      },

      contNum: function (oEvent) {
        var contractId = oEvent.getParameter("arguments").contractId;
        var sPath = '/' + contractId;
        this.getView().bindElement(sPath);
        console.log(contractId);
      },

      onSelectOption: function () {
        gasday = this.getView().byId("dt").getValue();
        var oDateFormat = sap.ui.core.format.DateFormat.getDateInstance({ pattern: "yyyy-MM-dd" });
        formattedGasday = oDateFormat.format(new Date(gasday));
        console.log(formattedGasday);
        var currentDate=new Date();
        formattedTimestamp = currentDate.toISOString();
        console.log("Timestamp:", formattedTimestamp);
      },

      createNomination: function () {
        var contID = this.getView().byId("contractID").getText();
        var event = this.getView().byId("event").getValue();
        var pdnq = this.getView().byId("pdnq").getValue();
        var remarks = this.getView().byId("remarks").getValue();

        let nominationModel = new JSONModel();
        let arrNom = {
          "Gasday": formattedGasday,
          "Vbeln": contID,
          "Posnr": "",
          "Versn": "",
          "Nomtk": "",
          "Timestamp": formattedTimestamp,
          "Kunnr": "",
          "Auart": "",
          "Rank": "000",
          "Dcq": null,
          "Uom1": "",
          "PDnq": pdnq,
          "Uom2": "",
          "Event": event,
          "Adnq": null,
          "Rpdnq": null,
          "Uom4": "",
          "Znomtk": "",
          "Zstat": "",
          "Dtolp": null,
          "Dtolq": null,
          "ZpotentialSf": "",
          "Src": "",
          "ZdeliveryPoint": "",
          "Remarks": remarks,
          "Flag": "",
          "Action": "",
          "Srvparam1": "",
          "Srvparam2": "",
          "ZredelivryPoint": "",
          "Path": "",
          "CustGrp": "",
          "SrvProfile": ""
        };
        nominationModel.setData(arrNom);
        this.getView().setModel(nominationModel, "nomination");

        let oData = this.getView().getModel('nomination').getData()
        let nomModel = this.getOwnerComponent().getModel()
        let oBindList = nomModel.bindList("/ZGMS_nom");
        MessageBox.alert("Nomination Created Successfully");
        oBindList.create(oData, {
          success: function (msg) {
            MessageBox.alert("Nomination Created Successfully");
          },
          error: function (msg) {
            MessageBox.success('Error.')
          },
        })
      },


    });
  }
);