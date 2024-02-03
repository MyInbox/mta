sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/json/JSONModel",
    'sap/ui/core/Fragment',
    "sap/ui/model/Filter",
    "sap/ui/model/FilterOperator",
    "sap/ui/model/FilterType",
    "sap/m/MessageBox",
],
    /**
     * @param {typeof sap.ui.core.mvc.Controller} Controller
     */
    function (Controller, JSONModel, Fragment, Filter, FilterOperator, FilterType, MessageBox) {
        "use strict";
        var aSelectedItems;

        return Controller.extend("app.config.controller.createParameter", {
            onInit: function () {
                this.getOwnerComponent().getRouter().getRoute("RoutecreateParameter").attachPatternMatched(this.handleRouteMatched, this);
            },
            handleRouteMatched: function (oEvent) {
                const profile = {
                    ProfileId: oEvent.getParameter("arguments").ID,
                    ProfileName: oEvent.getParameter("arguments").serviceProfileName,
                    ProfileDesc: oEvent.getParameter("arguments").serviceProfileDesc,
                }
                const profileModel = new JSONModel(profile);
                this.getView().setModel(profileModel, "profileModel");
                var oFilter = new Filter("ProfileId", FilterOperator.EQ, oEvent.getParameter("arguments").ID);
                this.getView().byId("table0").getBinding("items").filter(oFilter, FilterType.Application);
            },
            onCreate: function () {
                var oView = this.getView();
                const addServiceData = {
                    fieldName: "",
                    fieldDesc: "",
                    selectedFieldType: "String",
                    fieldLength: "",
                    fieldTypeList: [
                        {
                            key: "String",
                            text: "String"
                        },
                        {
                            key: "Integer",
                            text: "Integer"
                        },
                        {
                            key: "Boolean",
                            text: "Boolean"
                        },
                        {
                            key: "Decimal",
                            text: "Decimal"
                        },
                        {
                            key: "Date",
                            text: "Date"
                        },
                        {
                            key: "Date and Time",
                            text: "Date and Time"
                        },
                        {
                            key: "Table",
                            text: "Table"
                        },
                    ]
                };
                const addServiceModel = new JSONModel(addServiceData);
                oView.setModel(addServiceModel, "addServiceModel");
                if (!this._oDialogItem) {
                    this._oDialogItem = sap.ui.xmlfragment("app.config.fragments.addServiceParameter", this);
                    oView.addDependent(this._oDialogItem);
                }
                this._oDialogItem.open();
            },
            onComboBoxChange: function (oEvent) {
                var selectedKey = oEvent.getParameter("selectedItem").getKey();
                var oView = this.getView();
                oView.getModel("addServiceModel").setProperty("/selectedFieldType", selectedKey);
                oView.getModel("addServiceModel").setProperty("/fieldLength", "");
            },
            oncancelNewProfile: function () {
                this._oDialogItem.close();
            },
            onsaveNewProfile: function () {

                // this._oDialogItem.close();
            },
            onsaveNewProfile: function () {
                var addServicedata = this.getView().getModel("addServiceModel").getData();
                if (addServicedata.fieldLength) {
                    var fieldLength = parseInt(addServicedata.fieldLength)
                } else {
                    var fieldLength = 0;
                }

                // var oEntryDataServiceParameter = {
                //     ID: this.getView().byId("table0").getItems().length + 1,
                //     serviceParameter: addServicedata.fieldName,
                //     serviceParameterDesc: addServicedata.fieldDesc,
                //     serviceParameterType: addServicedata.selectedFieldType,
                //     serviceParameterlength: fieldLength
                // };
                var oEntryDataServiceParameterMapping = {
                    ID: this.getView().byId("table0").getItems().length + 1,
                    ProfileId: parseInt(this.getView().getModel("profileModel").getProperty("/ProfileId")),
                    serviceProfileName: this.getView().getModel("profileModel").getProperty("/ProfileName"),
                    serviceProfileDesc: this.getView().getModel("profileModel").getProperty("/ProfileDesc"),
                    serviceParameter: addServicedata.fieldName,
                    serviceParameterDesc: addServicedata.fieldDesc,
                    serviceParameterType: addServicedata.selectedFieldType,
                    serviceParameterlength: fieldLength,
                    ParentId: "",
                    ContractRelevant: false,
                    Value_Parameter: false,
                    Threshold_Relevance: false,
                    Referrence_Relevant: false,
                    Nomination_Relevant: false,
                    Balancing_Relevant: false,
                    Allocation_Relevant: false,
                    Billing_Relevant: false,
                    Price_Relevant: false
                };
                // var odataModel = this.getView().getModel();
                let oModel = this.getView().getModel();
                // let oBindListSP = oModel.bindList("/ServiceProfileParameters");
                // oBindListSP.create(oEntryDataServiceParameter);

                let oBindListSPM = oModel.bindList("/serviceProfileParametersItems");
                oBindListSPM.create(oEntryDataServiceParameterMapping);
                this._oDialogItem.close();
                this.RefreshData();

            },
            RefreshData: function () {
                this.getView().byId("table0").getBinding("items").refresh();
                var oFilter = new Filter("ProfileId", FilterOperator.EQ, this.getView().getModel("profileModel").getProperty("/ProfileId"));
                this.getView().byId("table0").getBinding("items").filter(oFilter, FilterType.Application);
            },

            // BUTTONS

            onEdit: function () {
                this.byId("deleteParameterBtn").setVisible(true);
                this.byId("createParameterBtn").setVisible(true);
                this.byId("editParameterBtn").setVisible(false);
            },

            onDelete: function () {
                this.byId("deleteLabel").setVisible(true);
                this.byId("deleteCheckBox").setVisible(true);
            },

            deleteParameter: function (oEvent) {
                var oSelectedItem = oEvent.getSource().getParent();

                if (oSelectedItem) {
                    var sServiceParameterID = oSelectedItem.getAggregation("cells")[1].getProperty("text");
                    console.log("Selected ID: " + sServiceParameterID);

                    var oTable = this.byId("table0");
                    var oRow = null;
                    for (var i = 0; i < oTable.getItems().length; i++) {
                        var oItem = oTable.getItems()[i];
                        var sRowId = oItem.getCells()[1].getText();

                        if (sRowId === sServiceParameterID) {
                            oRow = oItem; break;
                        }
                    }
                    console.log(oRow);
                    oRow.getBindingContext().delete().catch(function (oError) {
                        if (!oError.canceled) {
                          // Error was already reported to message model
                        }
                        this.RefreshData();
                    });
                }
                    
                    // var sPath = oSelectedItem.getBindingContextPath();
                    // console.log("Binding Context Path: " + sPath);

                    // var oModel = oTable.getModel();
                    // var sCurrentGroupId = oModel.getGroupId();
                    // console.log("Current Group ID: " + sCurrentGroupId);


            //         oModel.delete(sPath, {
            //             groupId: "$auto",
            //             success: function () {
            //                 MessageBox.alert(sServiceParameterID + " Successfully Deleted");
            //                 this.RefreshData();
            //             }.bind(this),
            //             error: function (oError) {
            //                 MessageBox.alert("Deletion Error: " + oError.message);
            //             }
            //         });
            //     } else {
            //         MessageBox.alert("Please Select a Row to Delete");
            //     }
            }


        });
    });
