({
    doInit : function(cmp, event, helper) {
        // Generate the Href for the icon
        var linkRef = helper.generateXLinkHref(cmp.get("v.buttonIconType"), cmp.get("v.buttonIconName"));
        cmp.set('v.linkRef', linkRef);
    },
    
	navigate : function(component, event, helper) {
		var url = component.get('v.url');
        helper.navigateToCommunityPage(url);
	}
})