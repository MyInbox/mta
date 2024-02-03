sap.ui.define([
    "sap/ui/core/mvc/Controller"
],
    /**
     * @param {typeof sap.ui.core.mvc.Controller} Controller
     */
    function (Controller) {
        "use strict";

        return Controller.extend("app.gms.controller.home", {
            onInit: function () {

            },
            onCreate: function(){
                const tile = this.getOwnerComponent().getRouter();
                tile.navTo("RoutemainTile");
            },
        });
    });
