({
	setArrays : function(component) {
        var columnDisplayNames = component.get('v.columnDisplayNames');
        
		var headers = columnDisplayNames.split(',').map(function(col) {
           return col.trim(); 
        });
        
        var columnDisplayFields = component.get('v.columnDisplayFields');        
        
		var fieldNames = columnDisplayFields.split(',').map(function(col) {
           return col.trim(); 
        });
        
        component.set('v.headers', headers);
        component.set('v.fieldNames', fieldNames);
	},
    
    fetchColumns : function(component, helper) {
        var action = component.get('c.getInvoices');
        
        var invoiceIdField = component.get('v.invoiceIdField');
        
        var fields = component.get('v.columnDisplayFields').split(',').map(function(col) {
           return col.trim(); 
        }).concat([invoiceIdField.trim()]);
        
        helper.showSpinner('loading-invoices');
        
        helper.callAction(action, {
            fieldNames: fields,
            sortField: component.get('v.sortField'),
            queryLimit: component.get('v.limit')
        }, function(result) {
            helper.hideSpinner('loading-invoices');
            component.set('v.records', result);
        }, function(error) {
            helper.hideSpinner('loading-invoices');
            helper.showMessage(error, 'error', 'loading-invoices');
        });
	}
})