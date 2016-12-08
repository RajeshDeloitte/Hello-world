({
	init: function(cmp, event, helper) {
        var actionId = cmp.getGlobalId();
        helper.showSpinner(actionId);
        helper.callAction(cmp.get('c.hasPermission'), {
            name: cmp.get('v.customPermissionName')
        }, function(result) {
            helper.hideSpinner(actionId);
            cmp.set('v.notAuthenticated', result);   
            
        }, function(error) {
            helper.hideSpinner(actionId);
        	helper.showMessage(error);
        });
    }
})