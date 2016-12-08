({
	onClick : function(component, event, helper) {
        console.log('onClick buttonCtrl');
		component.getEvent('onClick').fire({domEvent: event});
	}
})