({
	init: function(cmp, evt, h) {
        h.showSpinner(cmp.getGlobalId());
        var failure = function(error) {
            h.hideSpinner(cmp.getGlobalId());
            h.showMessage(error);
        };

        h.callAction(cmp.get('c.canUpgradeSubscription'), {
        }, function(canUpgrade) {
            $A.log('Can upgrade: ' + canUpgrade);
            h.callAction(cmp.get('c.hasOpenCases'), {}, function(hasCases){
                if($A.util.getBooleanValue(hasCases)) {
                    cmp.set('v.isDisabled', true);
                    h.hideMessage('smopencases');
                    h.showMessage($A.get('$Label.c.CustComm_Info_Subscription_Management_Case_In_Progress'), 'info', 'smopencases');
                }
                cmp.set('v.isButtonVisible', canUpgrade);
                h.hideSpinner(cmp.getGlobalId());
            }, failure);
        }, failure);
    },
    
    showConfirmation : function(cmp, evt, h) {
        $A.log('showConfirmation custCommSubscriptionUpgradeButtonCtrl');
        h.hideMessage(cmp.getGlobalId());

        cmp.find('upgradeConfirmation').show();
    },

    smCaseCreated: function( cmp, evt, h ) {
        cmp.set('v.isDisabled', true);
    },

    upgradeSubscription: function(cmp, evt, h){
        // h.hideButton(cmp);
        h.showSpinner(cmp.getGlobalId());

        h.callAction(cmp.get('c.createCase'), {}, function success(respValue){
            $A.log('upgrade success: ' + cmp.getGlobalId());
            $A.get("e.c:custCommSubscriptionManagementCaseCreated").fire();
            h.showMessage($A.get("$Label.c.CustComm_Subscription_Upgrade_Success"), "success", cmp.getGlobalId());
            h.hideSpinner(cmp.getGlobalId());
        }, function error(err){
            $A.log('upgrade error: ' + cmp.getGlobalId());
            h.showMessage($A.get("$Label.c.CustComm_Generic_Error"), "error", cmp.getGlobalId());
            h.hideSpinner(cmp.getGlobalId());
            h.showButton(cmp);
        });
    }   
})