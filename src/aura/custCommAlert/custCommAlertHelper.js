({
	addMessage : function(component, event) {
		var alerts = component.get('v.alerts');
        component.set('v.alerts', alerts.concat([{
            type: event.getParam('type'),
            message: event.getParam('message'),
            identifier: event.getParam('identifier')
        }]));
	},
    
    removeMessage : function(component, identifier) {
		var alerts = component.get('v.alerts');
        component.set('v.alerts', alerts.filter(function(alert) {
            return (alert.identifier !== identifier);
        }));
	}
})