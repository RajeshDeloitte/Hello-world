({
    confirm : function(cmp, evt, h) {
        h.hideDialog(cmp);
        var dialogConfirmedEvent = cmp.getEvent('dialogConfirmed');
        dialogConfirmedEvent.fire();
    },

    reject : function(cmp, evt, h) {
        h.hideDialog(cmp);
        var dialogRejectedEvent = cmp.getEvent('dialogRejected');
        dialogRejectedEvent.fire();
    },

    show : function(cmp, evt, h) {
        h.showDialog(cmp);
    },

    hide : function(cmp, evt, h) {
        h.hideDialog(cmp);
    }
})