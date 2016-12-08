({
	init : function(component, event, helper) {
		var record = component.get('v.record');
        var fieldNames = component.get('v.fieldNames');
        
        component.set('v.formattedRecord', fieldNames.map(function(field) {
            if (field in record) {
                return record[field];    
            } else {
            	return '';    
            }
        }));
	},
    
    getInvoice: function(component, event, helper) {
        
        var record = component.get('v.record');
        
        helper.showSpinner('loading-invoiceBody');
        helper.callAction(
            component.get('c.getInvoiceBody'),
            {
                invoiceId: record[component.get('v.invoiceIdField')]
            },
            function(result) {
                helper.hideSpinner('loading-invoiceBody');
                //var link = document.createElement("a");
                //link.href = '/community/servlet/servlet.FileDownload?file=' + result;
                //link.target = '_blank';
                //link.download="invoice.pdf";
                //link.click();
                helper.navigateToCommunityPage('../servlet/servlet.FileDownload?file=' + result);
            },
            function(error) {
                helper.hideSpinner('loading-invoiceBody');
                helper.showMessage(error, 'error', 'loading-invoice');
            }
        );
    }
})