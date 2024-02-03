sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/json/JSONModel",
    'sap/ui/core/Fragment',
    "../model/formatter"
],
    /**
     * @param {typeof sap.ui.core.mvc.Controller} Controller
     */
    function (Controller, JSONModel, Fragment, formatter) {
        "use strict";

        return Controller.extend("app.config.controller.createProfile", {
            formatter: formatter,
            onInit: function () {
            },
            onCreate: function () {
                var oView = this.getView();
                const addServiceProfileData = {
                    profileName: "",
                    profileDesc: ""
                };
                const addServiceProfileModel = new JSONModel(addServiceProfileData);
                oView.setModel(addServiceProfileModel, "addServiceProfileModel");
                if (!this._oDialog) {
                    this._oDialog = sap.ui.xmlfragment("app.config.fragments.addServiceProfile", this);
                    oView.addDependent(this._oDialog);
                }
                this._oDialog.open();
            },
            onComboBoxChange: function (oEvent) {
                var selectedKey = oEvent.getParameter("selectedItem").getKey();
                var oView = this.getView();
                oView.getModel("addServiceModel").setProperty("/selectedFieldType", selectedKey);
                oView.getModel("addServiceModel").setProperty("/fieldLength", "");
            },
            oncancelNewProfile: function () {
                this._oDialog.close();
            },
            onsaveNewProfile: function () {

                // this._oDialog.close();
            },
            onsaveNewProfile: function () {
                var addServiceProfileData = this.getView().getModel("addServiceProfileModel").getData();
                var oEntryDataServiceProfile = {
                    ID: this.getView().byId("table1").getItems().length + 1,
                    serviceProfileName: addServiceProfileData.profileName,
                    serviceProfileDesc: addServiceProfileData.profileDesc,
                    field1: "",
                    field2: "",
                    field3: "",
                    field4: "",
                    field5: ""
                };

                let oModel = this.getView().getModel();
                let oBindListSP = oModel.bindList("/ServiceProfile");
                oBindListSP.create(oEntryDataServiceProfile);
                this._oDialog.close();
                this.RefreshData();

            },
            RefreshData: function () {
                this.getView().byId("table1").getBinding("items").refresh();
            },
            onSelectServiceProfile: function (oEvent) {
                const config = this.getOwnerComponent().getRouter();
                var data = oEvent.getSource().getBindingContext().getObject();
                config.navTo("RoutecreateParameter", {
                    ID: data.ID,
                    serviceProfileName: data.serviceProfileName,
                    serviceProfileDesc: data.serviceProfileDesc
                })
            },
            onAddDocumentNo: function (oEvent) {
                this.selectedContext = oEvent.getSource().getBindingContext();
                var selectedData = oEvent.getSource().getBindingContext().getObject();
                var oView = this.getView();
                const addDocData = {
                    DocumentNo: "",
                    ID: selectedData.ID,
                    profileName: selectedData.serviceProfileName,
                    profileDesc: selectedData.serviceProfileDesc
                };
                const addDocDataModel = new JSONModel(addDocData);
                oView.setModel(addDocDataModel, "addDocDataModel");
                if (!this._oDialogDOCNo) {
                    this._oDialogDOCNo = sap.ui.xmlfragment("app.config.fragments.addDocumentNo", this);
                    oView.addDependent(this._oDialogDOCNo);
                }
                this._oDialogDOCNo.open();
            },
            oncanceleNewDocumentNo: function () {
                this._oDialogDOCNo.close();
            },
            onDocValueHelp: function () {
                var oView = this.getView();
               // this._oDialogDOCNo.close();
            //    oView.setModel(addDocDataModel, "addDocDataModel");
               if (!this._oDialogDOCvalueHelpNo) {
                   this._oDialogDOCvalueHelpNo = sap.ui.xmlfragment("app.config.fragments.docType", this);
                   oView.addDependent(this._oDialogDOCvalueHelpNo);
               }
               this._oDialogDOCvalueHelpNo.open();
            },
            onValueHelpDialogSearch: function (oEvent) {
                var sValue = oEvent.getParameter("value");
                var oFilter = new Filter("Auart", FilterOperator.Contains, sValue);  
                oEvent.getSource().getBinding("items").filter([oFilter]);
            },
            onValueHelpDialogClose: function (oEvent) {
                var sDescription,
                    oSelectedItem = oEvent.getParameter("selectedItem");
                oEvent.getSource().getBinding("items").filter([]);
    
                if (!oSelectedItem) {
                    return;
                }
    
                sDescription = oSelectedItem.getTitle();
                this.getView().getModel("addDocDataModel").setProperty("/DocumentNo",sDescription);
                this._oDialogDOCvalueHelpNo.close();
                // this.byId("productInput").setSelectedKey(sDescription);
                // this.byId("selectedKeyIndicator").setText(sDescription);
    
            },
            onValueHelpDialogCancel:function(){
                this._oDialogDOCvalueHelpNo.close();
            },
            onsaveNewDocumentNo: function () {
                var addDocData = this.getView().getModel("addDocDataModel").getData();
                // var oEntryDataServiceProfile = {
                //     ID: addDocData.ID,
                //     serviceProfileName: addDocData.profileName,
                //     serviceProfileDesc: addDocData.profileDesc,
                //     field1: addDocData.DocumentNo,
                //     field2: "",
                //     field3: "",
                //     field4: "",
                //     field5: ""
                // };
                this.selectedContext.setProperty("field1",addDocData.DocumentNo);
                let oModel = this.getView().getModel();
                oModel.submitBatch("peopleGroup");
                this._oDialogDOCNo.close();
                this.RefreshData();

            },

        });
    });
