({
	init: function(component, event, helper) {
        // Set the Arrays
        helper.setArrays(component);
        
        // Fetch column values
        helper.fetchColumns(component, helper);
	}
})