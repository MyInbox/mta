sap.ui.define([
    "sap/ui/core/mvc/Controller"
],
    /**
     * @param {typeof sap.ui.core.mvc.Controller} Controller
     */
    function (Controller) {
        "use strict";

        return Controller.extend("app.gms.controller.mainTile", {
            onInit: function () {

            },
            onGasContract: function(){
                const Gascontract = this.getOwnerComponent().getRouter();
                Gascontract.navTo("RoutegasContract");
            },
            onNomimation: function(){
                const nomTiles = this.getOwnerComponent().getRouter();
                nomTiles.navTo("Routenomination");
            },
            onBalancing: function(){
                const balancing = this.getOwnerComponent().getRouter();
                balancing.navTo("Routebalancing");
            },
            onCapcityRelease: function(){
                const capRel = this.getOwnerComponent().getRouter();
                capRel.navTo("RoutecapacityRelease");
            },
        });
    });
