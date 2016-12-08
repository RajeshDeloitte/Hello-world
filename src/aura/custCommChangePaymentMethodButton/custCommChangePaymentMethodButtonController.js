({
    doInit : function(cmp, event, helper) {
        // Generate the Href for the icon
        var linkRef = helper.generateXLinkHref(cmp.get("v.buttonIconType"), cmp.get("v.buttonIconName"));
        cmp.set('v.linkRef', linkRef);
        helper.callAction(cmp.get('c.paymentButtonAvailabilityChecks'), {}, function(result) {
            if (result.hasBillingAccount) {
                cmp.set('v.showPaymentChangeButton', result.hasBillingAccount);
            }
            
            if (result.payNowURL) {
                cmp.set('v.payNowURL', result.payNowURL);
            }
        });
    },
    
	redirectToMakeAPayment : function(cmp, event, helper) {
		helper.navigateToCommunityPage("/make-a-payment");
	},
    
    redirectToPayNow : function(cmp, event, helper) {
		helper.navigateToCommunityPage(cmp.get('v.payNowURL'));
	}
})