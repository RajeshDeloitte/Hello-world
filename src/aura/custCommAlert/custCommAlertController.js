({
	addMessage : function(component, event, helper) {
		helper.addMessage(component, event);
	},
    
    removeMessage : function(component, event, helper) {
		helper.removeMessage(component, event.getParam('identifier'));
	},
    
    closeMessage : function(component, event, helper) {
        var identifier = event.getSource().get('v.data');
        helper.removeMessage(component, identifier);
    }
})