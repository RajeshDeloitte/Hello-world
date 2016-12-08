({
	createTabHeaders : function(cmp) {
		var components = cmp.get('v.body');
        
        cmp.set('v.tabs', components.map(function(c) {
            return {
                label: c.get('v.label'),
                active: c.get('v.active'),
                component: c
            }
        }));
	}
})