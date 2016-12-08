({
	navigate : function(component, event, helper) {
		var url = component.get('v.url');
        if (url != '') {
        	helper.navigateToCommunityPage(url);
        }
	}
})