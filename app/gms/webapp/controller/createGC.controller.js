sap.ui.define(
  [
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/json/JSONModel",
    "sap/ui/model/Filter",
    "sap/ui/model/FilterType",
    "sap/ui/model/FilterOperator",
    "sap/m/MessageBox",
    "sap/m/ColumnListItem",
    "sap/m/Input",
  ],
  function (BaseController, JSONModel, Filter, FilterType, FilterOperator, MessageBox, ColumnListItem, Input) {
    "use strict";
    var Doc_TypeValue;
    var dataArray;
    var NewoData;
    var data = [];
    var dataThreshold = [];
    var dataContract = [];
    var DocId = [];
    var filteredObjects; var relevenceData;
    var contractData;
    var contractDataModel;
    var onDP1;
    var onDP2;
    var formattedDate1;
    var formattedDate2;
    return BaseController.extend("app.gms.controller.createGC", {

      onInit: function () {

        NewoData = new sap.ui.model.json.JSONModel();
        NewoData.loadData("/odata/v4/odataservices/ServiceProfile")

        var odata = new sap.ui.model.json.JSONModel();
        var JsonModel = new JSONModel()
        var relevenceDataModel = new JSONModel()
        contractDataModel = new JSONModel()

        odata.loadData("/odata/v4/odataservices/serviceProfileParametersItems", {}, true, "GET", false, false, {});
        var that = this;
        odata.attachRequestCompleted(function () {
          dataArray = odata.getData().value;

          // Filter based on Threshold_Relevance
          filteredObjects = dataArray.filter(obj => obj.Threshold_Relevance === true);

          // Filter based on Referrence_Relevant
          relevenceData = dataArray.filter(obj => obj.Referrence_Relevant === true);

          // Filter based on Contract_Relevant
          contractData = dataArray.filter(obj => obj.ContractRelevant === true);

          // Set the models
          JsonModel.setData(filteredObjects);
          relevenceDataModel.setData(relevenceData);
          contractDataModel.setData(contractData);

          that.getView().setModel(JsonModel, "serviceParameter");
          that.getView().setModel(relevenceDataModel, "relevenceDataModel");
          that.getView().setModel(contractDataModel, "contractDataModel");

          let getData = that.getView().getModel("serviceParameter").getData();
          let relevenceDataModelData = that.getView().getModel("relevenceDataModel").getData()
          let contractModelData = that.getView().getModel("contractDataModel").getData()
          console.log(relevenceDataModelData);
          console.log(contractModelData);
        });

        odata.attachRequestFailed(function () {
          console.error("Failed to load data.");
        });



        let salesModel = new JSONModel();
        let arrNom = {
          SalesContract: "",
          SalesContractValidityStartDate: "",
          SalesContractValidityEndDate: "",
          to_Item: [{}],
        };
        salesModel.setData(arrNom);
        this.getView().setModel(salesModel, "sales");

        // PROFILE DATA TO ZTABLE

        let proModel = new JSONModel();
        let arrPro = {
          Id: "",
          IdtoServiceNav: [
            {
              Vbeln: "",
              Id: "",
              ProfileId: "",
              ServProfile: "",
              Firm: "",
              Interruptible: "",
              Path: "",
              Rank: "",
              Dcq: "",
              MaxDcq: "",
              MinDcq: "",
              FuelProvider: "",
              FuelPer: "",
              Aacq: "",
              OverrunAllowed: "",
              UnderrunAllowed: "",
              TakePay: "",
              EarlyTermCharge: "",
              DeliveryPt: "",
              RedeliveryPt: "",
              ClauseCode: "",
              ValidFrom: "",
              ValidTo: "",
              ThresholdP: "",
              ThreshRef: ""
            }
          ]
        };
        proModel.setData(arrPro);
        this.getView().setModel(proModel, "profile");

        // Onint Ends
      },

      onCreatePress: function () {
        var oTable = this.getView().byId("tab");
        var oNewRow = new ColumnListItem({
          cells: [
            new sap.m.ComboBox({
              width: "100px",
              items: {
                path: "threshHoldData>/",
                template: new sap.ui.core.ListItem({
                  key: "{threshHoldData>}",
                  text: "{threshHoldData>}"
                })
              }
            }),
            new sap.m.DatePicker({ width: "100px" }),
            new sap.m.DatePicker({ width: "100px" }),
            new Input({ text: " ", width: "100px" }),
            new sap.m.ComboBox({
              width: "130px",
              items: {
                path: "relevenceData>/",
                template: new sap.ui.core.ListItem({
                  key: "{relevenceData>}",
                  text: "{relevenceData>}"
                })
              }
            }),
            new Input({ text: " ", width: "100px" }),


            // new Input({ width: "30px" }),
            // new CheckBox(),
            // new CheckBox(),
            // new CheckBox(),
            // new CheckBox(),
            // new CheckBox(),
            // new CheckBox(),
            // new CheckBox(),
            // new CheckBox(),
            // new CheckBox(),
            // new CheckBox()
          ]
        });

        // Add the new row to the table
        oTable.addItem(oNewRow);
      },


      onSelectDate: function () {
        onDP1 = this.getView().byId("DP1").getValue();
        var oDateFormatDP1 = sap.ui.core.format.DateFormat.getDateInstance({ pattern: "yyyy-MM-dd" });
        formattedDate1 = oDateFormatDP1.format(new Date(onDP1));
        console.log(formattedDate1);
        onDP2 = this.getView().byId("DP2").getValue();
        var oDateFormatDP2 = sap.ui.core.format.DateFormat.getDateInstance({ pattern: "yyyy-MM-dd" });
        formattedDate2 = oDateFormatDP2.format(new Date(onDP2));
        console.log(formattedDate2);
      },

      // DOCUMENT TYPE VALUE HELP

      onDocType: function () {
        var oView = this.getView();
        if (!this._oTankInfoDialog1) {
          this._oTankInfoDialog1 = sap.ui.xmlfragment(
            oView.getId(),
            "app.gms.fragments.docType",
            this
          );
          oView.addDependent(this._oTankInfoDialog1);
        }
        this._oTankInfoDialog1.open();
      },
      onValueHelpSearch1: function (oEvent) {
        var sValue = oEvent.getParameter("value");

        var oFilter = new Filter("Auart", FilterOperator.Contains, sValue);

        oEvent.getSource().getBinding("items").filter([oFilter]);
      },
      onValueHelpClose1: function (oEvent) {
        DocId = [];
        data = [];
        dataThreshold = [];
        dataContract = [];
        var oSelectedItem = oEvent.getParameter("selectedItem");

        oEvent.getSource().getBinding("items").filter([]);

        if (!oSelectedItem) {
          return;
        }
        this.getServiceProfile(oSelectedItem.getTitle());
        this.byId("docType_id").setValue(oSelectedItem.getTitle());

        Doc_TypeValue = this.getView().byId("docType_id").getValue();
        var docValue = NewoData.getData().value
        const relevenceDataOP = docValue.filter(obj => obj.field1 === Doc_TypeValue)
        relevenceDataOP.forEach(element => {
          DocId.push(element.ID)
        });
        DocId.forEach(elem => {
          const changeId = filteredObjects.filter(obj => obj.ProfileId === elem)
          console.log("relevenceData ", relevenceData);
          const changeThreshold = relevenceData.filter(obj => obj.ProfileId === elem)
          console.log("changeId", changeId);
          const changeContract = contractData.filter(obj => obj.ProfileId === elem)
          if (changeId.length > 0) {
            data.push(changeId);
          }

          if (changeThreshold.length > 0) {
            dataThreshold.push(changeThreshold);
          }

          if (changeContract.length > 0) {
            dataContract.push(changeContract);

          }
        });

        console.log("data", data);
        console.log("dataThreshold ", dataThreshold);

        let serviceParameterValues = [];
        let relevenceParamterValue = [];
        let contractParamterValue = [];
        for (let i = 0; i < data.length; i++) {
          for (let j = 0; j < data[i].length; j++) {
            serviceParameterValues.push(data[i][j].serviceParameter)
          }
        }
        for (let i = 0; i < dataThreshold.length; i++) {
          for (let j = 0; j < dataThreshold[i].length; j++) {
            relevenceParamterValue.push(dataThreshold[i][j].serviceParameter)
          }
        }
        for (let i = 0; i < dataContract.length; i++) {
          for (let j = 0; j < dataContract[i].length; j++) {
            contractParamterValue.push(dataContract[i][j].serviceParameter)
          }
        }

        console.log("Service Parameter ", serviceParameterValues);
        console.log("Relevence Value ", relevenceParamterValue)
        console.log("Contract Value ", contractParamterValue)
        var threshHoldModelData = new JSONModel();
        threshHoldModelData.setData(serviceParameterValues);
        this.getView().setModel(threshHoldModelData, "threshHoldData");

        var relevenceModelData = new JSONModel();
        relevenceModelData.setData(relevenceParamterValue);
        this.getView().setModel(relevenceModelData, "relevenceData");

        var contractModelData = new JSONModel();
        contractModelData.setData(contractParamterValue);
        this.getView().setModel(contractModelData, "contractData");

      },
      getServiceProfile: function (docid) {
        var oFilter = new Filter("field1", FilterOperator.EQ, docid);
        this.getView().byId("table55").getBinding("items").filter(oFilter, FilterType.Application);
      },

      // SOLD TO PARTY VALUE HELP

      onSoldToParty: function () {
        var oView = this.getView();
        if (!this._oTankInfoDialog2) {
          this._oTankInfoDialog2 = sap.ui.xmlfragment(
            oView.getId(),
            "app.gms.fragments.soldToParty",
            this
          );
          oView.addDependent(this._oTankInfoDialog2);
        }
        this._oTankInfoDialog2.open();
      },
      onValueHelpSearch2: function (oEvent) {
        var sValue = oEvent.getParameter("value");

        var oFilter = new Filter("Kunnr", FilterOperator.Contains, sValue);

        oEvent.getSource().getBinding("items").filter([oFilter]);
      },
      onValueHelpClose2: function (oEvent) {
        var oSelectedItem = oEvent.getParameter("selectedItem");

        oEvent.getSource().getBinding("items").filter([]);

        if (!oSelectedItem) {
          return;
        }

        this.byId("SoldTP_id").setValue(oSelectedItem.getTitle());
      },

      // SHIP TO PARTY VALUE HELP

      onShipToParty: function () {
        var oView = this.getView();
        if (!this._oTankInfoDialog3) {
          this._oTankInfoDialog3 = sap.ui.xmlfragment(
            oView.getId(),
            "app.gms.fragments.shipToParty",
            this
          );
          oView.addDependent(this._oTankInfoDialog3);
        }
        this._oTankInfoDialog3.open();
      },
      onValueHelpSearch3: function (oEvent) {
        var sValue = oEvent.getParameter("value");

        var oFilter = new Filter("Kunnr", FilterOperator.Contains, sValue);

        oEvent.getSource().getBinding("items").filter([oFilter]);
      },
      onValueHelpClose3: function (oEvent) {
        var oSelectedItem = oEvent.getParameter("selectedItem");

        oEvent.getSource().getBinding("items").filter([]);

        if (!oSelectedItem) {
          return;
        }

        this.byId("ShipTP_id").setValue(oSelectedItem.getTitle());
      },

      // DISTRIBUTION CHANNEL VALUE HELP

      onDistChanType: function () {
        var oView = this.getView();
        if (!this._oTankInfoDialog4) {
          this._oTankInfoDialog4 = sap.ui.xmlfragment(
            oView.getId(),
            "app.gms.fragments.distChannel",
            this
          );
          oView.addDependent(this._oTankInfoDialog4);
        }
        this._oTankInfoDialog4.open();
      },
      onValueHelpSearch4: function (oEvent) {
        var sValue = oEvent.getParameter("value");

        var oFilter = new Filter("Vtweg", FilterOperator.Contains, sValue);

        oEvent.getSource().getBinding("items").filter([oFilter]);
      },
      onValueHelpClose4: function (oEvent) {
        var oSelectedItem = oEvent.getParameter("selectedItem");

        oEvent.getSource().getBinding("items").filter([]);

        if (!oSelectedItem) {
          return;
        }

        this.byId("distChan_id").setValue(oSelectedItem.getTitle());
      },

      // SALES ORGANISATION VALUE HELP

      onSalesOrg: function () {
        var oView = this.getView();
        if (!this._oTankInfoDialog5) {
          this._oTankInfoDialog5 = sap.ui.xmlfragment(
            oView.getId(),
            "app.gms.fragments.salesOrg",
            this
          );
          oView.addDependent(this._oTankInfoDialog5);
        }
        this._oTankInfoDialog5.open();
      },
      onValueHelpSearch5: function (oEvent) {
        var sValue = oEvent.getParameter("value");

        var oFilter = new Filter("Vkorg", FilterOperator.Contains, sValue);

        oEvent.getSource().getBinding("items").filter([oFilter]);
      },
      onValueHelpClose5: function (oEvent) {
        var oSelectedItem = oEvent.getParameter("selectedItem");

        oEvent.getSource().getBinding("items").filter([]);

        if (!oSelectedItem) {
          return;
        }

        this.byId("SalesOrg_id").setValue(oSelectedItem.getTitle());
      },

      // DIVISON VALUE HELP

      onDivision: function () {
        var oView = this.getView();
        if (!this._oTankInfoDialog6) {
          this._oTankInfoDialog6 = sap.ui.xmlfragment(
            oView.getId(),
            "app.gms.fragments.division",
            this
          );
          oView.addDependent(this._oTankInfoDialog6);
        }
        this._oTankInfoDialog6.open();
      },
      onValueHelpSearch6: function (oEvent) {
        var sValue = oEvent.getParameter("value");

        var oFilter = new Filter("Vkorg", FilterOperator.Contains, sValue);

        oEvent.getSource().getBinding("items").filter([oFilter]);
      },
      onValueHelpClose6: function (oEvent) {
        var oSelectedItem = oEvent.getParameter("selectedItem");

        oEvent.getSource().getBinding("items").filter([]);

        if (!oSelectedItem) {
          return;
        }

        this.byId("division_id").setValue(oSelectedItem.getTitle());
      },

      // MATERIAL VALUE HELP

      onMaterial: function () {
        var oView = this.getView();
        if (!this._oTankInfoDialog7) {
          this._oTankInfoDialog7 = sap.ui.xmlfragment(
            oView.getId(),
            "app.gms.fragments.material",
            this
          );
          oView.addDependent(this._oTankInfoDialog7);
        }
        this._oTankInfoDialog7.open();
      },
      onValueHelpClose7: function (oEvent) {
        var oSelectedItem = oEvent.getParameter("selectedItem");

        oEvent.getSource().getBinding("items").filter([]);

        if (!oSelectedItem) {
          return;
        }

        this.byId("material_id").setValue(oSelectedItem.getTitle());
      },
      onValueHelpSearch7: function (oEvent1) {
        var sValue1 = oEvent1.getParameter("value");

        var oFilter1 = new Filter("Matnr", FilterOperator.Contains, sValue1);

        oEvent1.getSource().getBinding("items").filter([oFilter1]);
      },

      // UNIT OF MEASUREMENT VALUE HELP

      onUom: function () {
        var oView = this.getView();
        if (!this._oTankInfoDialog8) {
          this._oTankInfoDialog8 = sap.ui.xmlfragment(
            oView.getId(),
            "app.gms.fragments.uom",
            this
          );
          oView.addDependent(this._oTankInfoDialog8);
        }
        this._oTankInfoDialog8.open();
      },
      onValueHelpSearch8: function (oEvent) {
        var sValue1 = oEvent.getParameter("value");

        var oFilter1 = new Filter("Msehi", FilterOperator.Contains, sValue1);

        oEvent.getSource().getBinding("items").filter([oFilter1]);
      },
      onValueHelpClose8: function (oEvent) {
        var oSelectedItem = oEvent.getParameter("selectedItem");

        oEvent.getSource().getBinding("items").filter([]);

        if (!oSelectedItem) {
          return;
        }

        this.byId("Uom_id").setValue(oSelectedItem.getTitle());
      },

      // PLANT VALUE HELP

      onPlant: function (oEvent) {
        var oView = this.getView();
        if (!this._oTankInfoDialog9) {
          this._oTankInfoDialog9 = sap.ui.xmlfragment(
            oView.getId(),
            "app.gms.fragments.plant",
            this
          );
          oView.addDependent(this._oTankInfoDialog9);
        }
        this._oTankInfoDialog9.open();
      },
      onValueHelpSearch9: function (oEvent) {
        var sValue1 = oEvent.getParameter("value");

        var oFilter1 = new Filter("Werks", FilterOperator.Contains, sValue1);

        oEvent.getSource().getBinding("items").filter([oFilter1]);
      },
      onValueHelpClose9: function (oEvent) {
        var oSelectedItem = oEvent.getParameter("selectedItem");

        oEvent.getSource().getBinding("items").filter([]);

        if (!oSelectedItem) {
          return;
        }

        this.byId("plant_id").setValue(oSelectedItem.getTitle());
      },

      // TRANSPORT VALUE HELP

      onTransport: function (oEvent) {
        var oView = this.getView();
        if (!this._oTankInfoDialog10) {
          this._oTankInfoDialog10 = sap.ui.xmlfragment(
            oView.getId(),
            "app.gms.fragments.transportSet",
            this
          );
          oView.addDependent(this._oTankInfoDialog10);
        }
        this._oTankInfoDialog10.open();
      },
      onValueHelpSearch10: function (oEvent) {
        var sValue1 = oEvent.getParameter("value");

        var oFilter1 = new Filter("Werks", FilterOperator.Contains, sValue1);

        oEvent.getSource().getBinding("items").filter([oFilter1]);
      },
      onValueHelpClose10: function (oEvent) {
        var oSelectedItem = oEvent.getParameter("selectedItem");

        oEvent.getSource().getBinding("items").filter([]);

        if (!oSelectedItem) {
          return;
        }

        this.byId("transport_id").setValue(oSelectedItem.getTitle());
      },

      // LOCATIONPOINT VALUE HELP

      // DELIVERY POINT

      onDelivery: function (oEvent) {
        var oView = this.getView();
        if (!this._oTankInfoDialog11) {
          this._oTankInfoDialog11 = sap.ui.xmlfragment(
            oView.getId(),
            "app.gms.fragments.deliveryPoint",
            this
          );
          oView.addDependent(this._oTankInfoDialog11);
        }
        this._oTankInfoDialog11.open();
      },
      onValueHelpSearch11: function (oEvent) {
        var sValue1 = oEvent.getParameter("value");

        var oFilter1 = new Filter("Locid", FilterOperator.Contains, sValue1);

        oEvent.getSource().getBinding("items").filter([oFilter1]);
      },
      onValueHelpClose11: function (oEvent) {
        var oSelectedItem = oEvent.getParameter("selectedItem");

        oEvent.getSource().getBinding("items").filter([]);

        if (!oSelectedItem) {
          return;
        }

        this.byId("delivery_id").setValue(oSelectedItem.getTitle());
      },

      // RECEIPT POINT

      onReceipt: function (oEvent) {
        var oView = this.getView();
        if (!this._oTankInfoDialog12) {
          this._oTankInfoDialog12 = sap.ui.xmlfragment(
            oView.getId(),
            "app.gms.fragments.receiptPoint",
            this
          );
          oView.addDependent(this._oTankInfoDialog12);
        }
        this._oTankInfoDialog12.open();
      },
      onValueHelpSearch12: function (oEvent) {
        var sValue1 = oEvent.getParameter("value");

        var oFilter1 = new Filter("Locid", FilterOperator.Contains, sValue1);

        oEvent.getSource().getBinding("items").filter([oFilter1]);
      },
      onValueHelpClose12: function (oEvent) {
        var oSelectedItem = oEvent.getParameter("selectedItem");

        oEvent.getSource().getBinding("items").filter([]);

        if (!oSelectedItem) {
          return;
        }

        this.byId("receipt_id").setValue(oSelectedItem.getTitle());
      },

      // BUTTONS

      onProceedItem: function () {
        let y = this?.byId("iconTabBar")?.setSelectedKey("container-app.gms---createGC--_IDGenIconTabFilter2");


      },

      onProceedServ: function () {
        let y = this?.byId("iconTabBar")?.setSelectedKey("container-app.gms---createGC--_IDGenIconTabFilter3");


      },

      // SUBMIT BUTTON

      onSubmitgms: function () {
        let oData = this.getView().getModel("sales").getData();
        oData.SalesContractValidityStartDate = formattedDate1;
        oData.SalesContractValidityEndDate = formattedDate2;
        let salesModel = this.getOwnerComponent().getModel();
        let oBindList = salesModel.bindList("/A_SalesContract");
        oBindList.create(oData, {
          success: function (msg) {
            MessageBox.success("Successfully.");
          },
          error: function (msg) {
            MessageBox.success("Error.");
          },
        });


        // setTimeout(() => {
        //   const url = "/odata/v4/odataservices/A_SalesContract";

        //   fetch(url)
        //     .then((response) => {
        //       if (!response.ok) {
        //         throw new Error("Network response was not ok");
        //       }

        //       return response.json();
        //     })

        //     .then((odata) => {
        //       console.log(odata.value.SalesContract);
        //       var lastContract = odata.value.length;
        //       console.log(lastContract);
        //       console.log(odata.value[lastContract - 1].SalesContract);
        //       var contractNumber = odata.value[lastContract - 1].SalesContract;
        //       MessageBox.alert("Contract Generated Successfully. Contract Number: " + contractNumber);

        //       // let pro = this.getView().byId("table66").getItems();
        //       var lastContract = odata.value.length;
        //       console.log(lastContract);
        //       console.log(odata.value[lastContract - 1].SalesContract);
        //       var contractNumber = odata.value[lastContract - 1].SalesContract;
        //       MessageBox.alert("Contract Generated Successfully. Contract Number: " + contractNumber);

        //       let oDataProModel = this.getView().getModel("profile");
        //       let oDataPro = oDataProModel.getData();
        //       oDataPro.IdtoServiceNav[0].Vbeln = contractNumber;

        //       let proModel = this.getOwnerComponent().getModel();
        //       let oBindList = proModel.bindList("/CreateSPSet");

        //       oBindList.create(oDataPro, {
        //         success: function (msg) {
        //           MessageBox.success("Successfully.");
        //         },
        //         error: function (msg) {
        //           MessageBox.error("Error.");
        //         },
        //       });

        //     })

        //     .catch((error) => {
        //       console.error(
        //         "There was a problem with the fetch operation:",
        //         error
        //       );
        //     });
        // }, 1000);
      },
    });
  }
);
