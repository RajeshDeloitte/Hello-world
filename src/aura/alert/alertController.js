({  
	onClose : function(component, event, helper) {
        component.getEvent('onClose').fire({ domEvent: event });
	},
    
    onClick : function(component, event, helper) {
    	component.getEvent('onClick').fire({ domEvent: event });    
    }
})