({
	addRequestor: function(component, event, helper) {
        var id = event.getParam('identifier');
        var currentList = component.get('v.requests');
		component.set('v.requests', currentList.concat([id]));
	},
    
    removeRequestor: function(component, event, helper) {
        var id = event.getParam('identifier');
        var newRequestorList = component.get('v.requests').filter(function(requestId) {
        	return requestId !== id;	    
        });
        component.set('v.requests', newRequestorList);
    }
})