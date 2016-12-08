({
    doInit : function(cmp, event, helper) {
        helper.showSpinner(cmp.getGlobalId());

        var failure = function error(err){
            helper.hideSpinner(cmp.getGlobalId());
        };
		
        helper.callAction(cmp.get("c.canCancelSubscription"), {}, function(value) {
            if (value) {
                cmp.set('v.isVisible', true);
            	helper.callAction(cmp.get("c.getPicklistValues"), { objectAPIName : "Case", fieldAPIName : "Cancellation_Reason__c"}, function success(respValue){
                    cmp.set("v.cancelReasons", respValue);
                    // Set the first value as selected
                    cmp.set("v.reasonSelected", respValue[0]);
        
                    helper.callAction(cmp.get('c.getSubscriptionManagementOpenCases'), {}, function(openCases){
                        if(openCases && openCases.length) {
                            cmp.find('cancelButton').set('v.notransition',true);
                            cmp.set('v.isDisabled', true);
                            helper.hideMessage('smopencases');
                            helper.showMessage($A.get('$Label.c.CustComm_Info_Subscription_Management_Case_In_Progress'), 'info', 'smopencases');
                        }
                        helper.hideSpinner(cmp.getGlobalId());
                    }, failure);
                    helper.hideSpinner(cmp.getGlobalId());
                }, failure);    
            } else {
                helper.hideSpinner(cmp.getGlobalId());
            }
        }, failure);
        
        
    },
    
    handleChangeEvent : function(cmp, event){
        cmp.set("v.reasonSelected", event.getParam("value"));
    },
    
    smCaseCreated: function( cmp, evt, h ) {
        cmp.set('v.isDisabled', true);
    },

    showConfirmation : function(cmp, evt, helper) {
        helper.hideMessage(cmp.getGlobalId());
        cmp.find('cancelSubscriptionConfirmation').show();
    },

	cancelSubscription : function(cmp, event, helper){
        helper.showSpinner(cmp.getGlobalId());
        helper.callAction(cmp.get("c.createCase"), { type : "cancel", reason : cmp.get("v.reasonSelected")}, function success(respValue){
            $A.get("e.c:custCommSubscriptionManagementCaseCreated").fire();
            helper.showMessage("{!$Label.c.CancelSubscriptionSuccessMsg}", "success", cmp.getGlobalId());
            helper.hideSpinner(cmp.getGlobalId());
        }, function error(err){
            helper.showMessage("{!$Label.c.CustComm_Generic_Error}", "error", cmp.getGlobalId());
            helper.hideSpinner(cmp.getGlobalId());
        });
	}
})