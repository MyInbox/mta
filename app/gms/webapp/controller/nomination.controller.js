sap.ui.define([
    "sap/ui/core/mvc/Controller"
],
    /**
     * @param {typeof sap.ui.core.mvc.Controller} Controller
     */
    function (Controller) {
        "use strict";

        return Controller.extend("app.gms.controller.nomination", {
            onInit: function () {

            },
            publishNom: function () {
                const tile = this.getOwnerComponent().getRouter();
                tile.navTo("RoutepublishNom");
            },
            publishReNom: function () {
                const reNom = this.getOwnerComponent().getRouter();
                reNom.navTo("RoutepublishReNom");
            }
        });
    });
