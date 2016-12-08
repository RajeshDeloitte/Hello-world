({
    init: function(component, event, helper) {
        var linkRef = helper.generateXLinkHref(component.get("v.buttonIconType"), component.get("v.buttonIconName"));
        component.set('v.linkRef', linkRef);
        
        helper.showSpinner('manageSubscription-getPermissions');
        helper.callAction(component.get('c.hasPermission'), {
            name: 'Manage_Subscriptions'
        }, function(result) {
            helper.hideSpinner('manageSubscription-getPermissions');
            if (result === true) {
            	component.set('v.showButton', true);    
            } else {
                component.set('v.showButton', false);
            }
        }, function(error) {
            helper.hideSpinner('manageSubscription-getPermissions');
        	helper.showMessage(error);
        });
    },
    
    navigate: function(component, event, helper) {
        helper.navigateToCommunityPage('/my-subscription');
    }
})