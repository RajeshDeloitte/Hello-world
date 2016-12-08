({
    init: function(component, event, helper) {
    	var parsedOptions = helper.convertStringToArray(component.get('v.options'));
        var parsedLinks = helper.convertStringToArray(component.get('v.links'));    
        
        component.set('v.parsedOptions', parsedOptions);
        component.set('v.parsedLinks', parsedLinks);
    },
    
	onChange : function(component, event, helper) {
        var value = event.getParam('value');
        var links = component.get('v.parsedLinks');
        var options = component.get('v.parsedOptions');
        
        options.forEach(function(o, i) {
            if (o === value) {
            	helper.navigateToCommunityPage(links[i], true);    
            }    
        });
		
	}
})