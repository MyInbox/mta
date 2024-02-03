sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/json/JSONModel",
    'sap/ui/core/Fragment',
],
    /**
     * @param {typeof sap.ui.core.mvc.Controller} Controller
     */
    function (Controller,JSONModel,Fragment) {
        "use strict";

        return Controller.extend("app.config.controller.home", {
            onInit: function () {

            },
            onCreate: function(){
                const createP = this.getOwnerComponent().getRouter();
                createP.navTo("RoutecreateProfile");
            },
            onPathFuel: function(){
                const pathFuel = this.getOwnerComponent().getRouter();
                pathFuel.navTo("RoutepathFuel");
            },
        });
    });
