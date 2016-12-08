({
    startChat : function(cmp, evt, h) {
        // liveagent.startChat(cmp.get('v.buttonId'));
        
        var frameWindow = cmp.find("liveAgentProxyIframe").getElement().contentWindow;       
        frameWindow.postMessage({'type': 'START_CHAT'}, window.location.origin);  
    },

    doInit: function(cmp, evt, h) {
        //h.initiateLiveAgent(cmp);
        
        // Before initiate the live agent we must check if the user is authenticated
        var actionId = cmp.getGlobalId();
        h.showSpinner(actionId);
        h.callAction(cmp.get('c.isAuthenticatedUser'), {
        }, function(result) {
            h.hideSpinner(actionId);
            if (result === true) {
                // If the user is indeed authenticated we remove the hidden class
            	cmp.set('v.class', '');
                // And now initiate the live agent
                h.initIFrame( cmp, evt, h );
            }
        }, function(error) {
            h.hideSpinner(actionId);
        	h.showMessage(error);
        });
    }
})