({
    init : function(cmp, event, helper) {
        // Generate the Href for the icon
        var linkRef = helper.generateXLinkHref(cmp.get("v.buttonIconType"), cmp.get("v.buttonIconName"));
        cmp.set('v.linkRef', linkRef);
    },
    
	navigateToRegitrationPage : function(cmp, event, helper) {
		var url = cmp.get('v.registrationUrl');
        helper.navigateToCommunityPage(url);
	}
})