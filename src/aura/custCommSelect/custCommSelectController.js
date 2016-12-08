({
	onChange : function(cmp, event, helper) {
        var selected = cmp.find("dynamicSelect").get("v.value");
        cmp.getEvent('onChange').fire({ domEvent: event, value: selected });
	}
})