({
	init: function(cmp, event, helper) {
        var actionId = cmp.getGlobalId();
        helper.showSpinner(actionId);
        helper.callAction(cmp.get('c.hasPermission'), {
            name: cmp.get('v.customPermissionName')
        }, function(result) {
            helper.hideSpinner(actionId);
            if (result === true) {
                // If the user has this permission assigned, the button should be rendered
                // therefore we'll show the button by removing the hidden class
            	cmp.set('v.btnClass', '');   
            }
        }, function(error) {
            helper.hideSpinner(actionId);
        	helper.showMessage(error);
        });
    }
})