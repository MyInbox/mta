sap.ui.define(
  [
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/json/JSONModel",
    "sap/ui/model/Filter",
    "sap/ui/model/FilterOperator",
    "sap/ui/model/FilterType",
    "sap/m/MessageBox",
  ],
  /**
   * @param {typeof sap.ui.core.mvc.Controller} Controller
   */
  function (
    Controller,
    JSONModel,
    Filter,
    FilterOperator,
    FilterType,
    MessageBox
  ) {
    "use strict";
    var selectedData;
    var materialNo;
    var myData;

    return Controller.extend("app.gms.controller.capacityRelease", {
      onInit: function () {
        var oData = new sap.ui.model.json.JSONModel();

        oData.loadData("/odata/v4/odataservices/ZLocMatnr").then(function () {
          myData = oData.getData().value;

          // Log the loaded data
          console.log("materialData ", myData);

          // Create an object to store unique Pmatnr values
          var uniqueMaterialNoObject = {};
          let filter1 = [];

          myData.forEach(function (item) {
            // uniqueMaterialNoObject[item.Pmatnr] = true;
            uniqueMaterialNoObject[item.Pmatnr] = item.Locid;
            var obj = {};
            obj[item.Pmatnr] = item.Pmatnr;
            filter1.push(obj);
          });

          // Get an array of unique material numbers from the object keys
          materialNo = Object.values(uniqueMaterialNoObject);

          var filteredKeys = Object.keys(uniqueMaterialNoObject).filter(
            function (key) {
              return uniqueMaterialNoObject[key] === "DISC_LOC1";
            }
          );

          var result = {};
          filteredKeys.forEach(function (key) {
            result[key] = uniqueMaterialNoObject[key];
          });

          var resultArray = Object.keys(result).map(function (key, index) {
            var obj = {};
            obj[index] = key;
            return obj;
          });

          console.log(resultArray);
          let newObjModel = new JSONModel({
            item: resultArray,
          });
          let that = this.getView().getOwnerComponent();
          that.setModel(newObjModel, "test1");
        });
      },

      //Location field
      onLocationValueHelp: function () {
        var oView = this.getView();
        if (!this.onLocationfrag) {
          this.onLocationfrag = sap.ui.xmlfragment(
            oView.getId(),
            "app.gms.fragments.locMatnr",
            this
          );
          oView.addDependent(this.onLocationfrag);
        }

        this.onLocationfrag.open();
      },
      onValueHelpClosemate: function (oEvent) {
        var oSelectedItem = oEvent.getParameter("selectedItem");

        oEvent.getSource().getBinding("items").filter([]);

        if (!oSelectedItem) {
          return;
        }

        this.byId("loc_ID").setValue(oSelectedItem.getTitle());
        this.onInputFieldChange();
      },
      onSearch: function (oEvent) {
        var sValue = oEvent.getParameter("value");
        var oFilter = new Filter("Locid", FilterOperator.Contains, sValue);
        oEvent.getSource().getBinding("items").filter([oFilter]);
      },

      onInputFieldChange: function (oEvent) {
        selectedData = this.getView().byId("loc_ID").getValue();
        console.log(selectedData);
      },

      //Material field
      onMaterialValueHelp: function () {

        var oView = this.getView();
        if (!this.onMatFrag) {
          this.onMatFrag = sap.ui.xmlfragment(
            oView.getId(),
            "app.gms.fragments.matnr",
            this
          );
          oView.addDependent(this.onMatFrag);
        }

        this.onMatFrag.open();
      },
      onValueHelpClosemat: function (oEvent) {
        var oSelectedItems = oEvent.getParameter("selectedItem");

        oEvent.getSource().getBinding("items").filter([]);

        if (!oSelectedItems) {
          return;
        }

        this.byId("material_ID").setValue(oSelectedItems.getTitle());
        this.onInputFieldChange();
      },
      onSearch1: function (oEvent) {
        var sValue = oEvent.getParameter("value");
        var oFilter = new Filter("Locid", FilterOperator.Contains, sValue);
        oEvent.getSource().getBinding("items").filter([oFilter]);
      },

      onInputFieldChange: function (oEvent) {
        selectedData = this.getView().byId("loc_ID").getValue();
        console.log(selectedData);
      },


      //On submit button action
      onSubmitPress: function () {
        var oInput1 = this.getView().byId("loc_ID");
        var oInput2 = this.getView().byId("material_ID");
        var oDatePicker = this.getView().byId("DP1");


        //uom


        // Validate all fields
        this.validateInputField(oInput1);
        this.validateInputField(oInput2);
        this.validateDatePicker(oDatePicker);

        // Check if all fields are valid before proceeding
        if (this.isFormValid([oInput1, oInput2, oDatePicker])) {

          var sLocation = oInput1.getValue();
          var sMaterial = oInput2.getValue();
          var sGasDay = oDatePicker.getValue();

          var uom = myData.filter(function (ufm) {

            return ufm.Pmatnr === sMaterial
          })
          console.log("filter data", uom);
          if (uom.length > 0) {
            // Get the last element from the filtered array
            var lastUom = uom[uom.length - 1];

            // Get an array of keys for the last element
            var keysArray = Object.keys(lastUom);

            // Get the last key
            var lastKey = keysArray[keysArray.length - 1];

            // Get the value corresponding to the last key
            var lastValue = lastUom[lastKey];

            console.log("Last key:", lastKey);
            console.log("Corresponding value:", lastValue);
          } else {
            console.log("No matching elements in the filtered data.");
          }


          // Create payload
          var payload = {
            loc: sLocation,
            mat: sMaterial,
            day: sGasDay,
            Puom: lastValue
          };

          // Set up the data model
          var oComponent = this.getOwnerComponent();
          oComponent.setModel(
            new sap.ui.model.json.JSONModel(payload),
            "formData"
          );
debugger;
          // Navigate to "capacityAvailability"
          this.getOwnerComponent()
            .getRouter()
            .navTo("RoutecapacityAvailability");
        } else {
          // Handle validation errors, if needed
          MessageBox.alert("Please fill out all required fields correctly.");
        }
      },

      validateInputField: function (oInput) {
        var sValue = oInput.getValue();

        // Check if the value is not empty
        if (!sValue) {
          oInput.setValueState("Error");
          oInput.setValueStateText("This field is required");
        } else {
          oInput.setValueState("None");
          oInput.setValueStateText("");
        }
      },

      validateDatePicker: function (oDatePicker) {
        // Additional validation for the DatePicker if needed
        var sValue = oDatePicker.getValue();
        var oToday = new Date();
        var oSelectedDate = new Date(sValue);

        // Example: Check if the date is selected and it is not after today
        if (!sValue || oSelectedDate > oToday) {
          oDatePicker.setValueState("Error");
          oDatePicker.setValueStateText(
            "Please select a valid date before or on today"
          );
        } else {
          oDatePicker.setValueState("None");
          oDatePicker.setValueStateText(""); // Clear the validation text
        }
      },

      isFormValid: function (aFields) {
        // Check if all fields in the array are in a valid state
        return aFields.every(function (oField) {
          return oField.getValueState() === "None";
        });
      },
    });
  }
);
