({
	init: function(cmp, event, helper) {
        var actionId = cmp.getGlobalId();
        helper.showSpinner(actionId);
        helper.callAction(cmp.get('c.getCommunities'), {
        }, function(result) {
            cmp.set('v.communities', result);
            var currentUrl = window.location.href;
            if (result.length > 1){
                // We have a dummy option
            	var allOptions = ['-- Choose a Community --'];
            	for (var i = 0; i < result.length; i++) {
                    if (currentUrl.indexOf(result[i].switchUrl) < 0){
                    	allOptions.push(result[i].name);
                    }
                }
                cmp.set('v.options', allOptions);
                //var commMenu = cmp.find("communityMenu");
	        	//$A.util.toggleClass(commMenu, "hidden");
            }
            helper.hideSpinner(actionId);
        }, function(error) {
            helper.hideSpinner(actionId);
        	helper.showMessage(error);
        });
    },
    
    handleChangeEvent: function(cmp, event, helper) {
        //var source = event.getSource();
        //var label = source.get("v.label");
        var label = event.getParam("value");
        var communityOptions = cmp.get('v.communities');console.log('here');
        for (var i = 0; i < communityOptions.length; i++) {
            if (communityOptions[i].name == label){
        		helper.navigateToCommunityPage(communityOptions[i].switchUrl);
                break;
            }
        }
    }
})