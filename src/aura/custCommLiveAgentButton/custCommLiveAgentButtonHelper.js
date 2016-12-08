({
    // Helper method to initiate live agent.
    /*initiateLiveAgent : function(cmp) {

        var deploymentName = cmp.get('v.deploymentAPIName');
        var buttonName = cmp.get('v.buttonAPIName');
        var liveAgentInitUrl = cmp.get('v.liveagentInitUrl');
        
        if(!deploymentName || !buttonName || !liveAgentInitUrl) {
            console.error('No Live Agent Settings');
            return;
        }

        // debug mode
        if($A.util.getBooleanValue(cmp.get('v.debugMode'))) liveagent.enableLogging();

        

        cmp.set('v.isAgentAvailable', !!liveagent.lastButtonState);

        liveagent.buttonHandler = function(status){
            // console.log('la status: ', status);
            switch(status) {
                case liveagent.BUTTON_EVENT.BUTTON_AVAILABLE:
                    liveagent.lastButtonState = true;
                    break;
                case liveagent.BUTTON_EVENT.BUTTON_UNAVAILABLE:
                    liveagent.lastButtonState = false;
            } 

            if(!cmp.isValid()) return;

            $A.run(function(){

                if(!cmp.isValid()) return;
                switch(status) {
                    case liveagent.BUTTON_EVENT.BUTTON_AVAILABLE:
                        cmp.set('v.isAgentAvailable', true);
                        break;
                    case liveagent.BUTTON_EVENT.BUTTON_UNAVAILABLE:
                        cmp.set('v.isAgentAvailable', false);
                }  
            });
        };
        
        // skip next steps if live agent is already initialised
        if(window._laq && window._laq.length) return;

        var cb = function(initParams, err){
            try {
                if(err) throw err;

                cmp.set('v.buttonId', initParams.buttonId);

                if (!window._laq) { window._laq = []; }

                liveagent.addButtonEventHandler(initParams.buttonId, function(status){
                    liveagent.buttonHandler(status);
                });

                window._laq.push(function(){
                    var el = document.createElement('span');
                    liveagent.showWhenOnline(initParams.buttonId, el);
                    // liveagent.showWhenOffline(buttonId, el);
                });

                if(cmp.get('v.popupContact')){

                    var curUser = initParams.curUser;

                    if(curUser.ContactId) {
                        liveagent.setName(curUser.Name);
                        liveagent.addCustomDetail('Contact ID', curUser.ContactId, false);

                        liveagent.findOrCreate("Contact")
                            .map("Id", 'Contact ID', true, true, false)
                            .saveToTranscript("Contact")
                            .showOnCreate();

                        // Arturs Gusjko: for some reason salesforce
                        // console opens search screen when provided
                        // with both Account and Contact.
                        // This is mitigated by displaying contact only
                        // and assigning account within the trigger.

                        // liveagent.addCustomDetail('Account ID', curUser.AccountId, false);
                        // if(curUser.Account) liveagent.addCustomDetail('Account Name', curUser.Account.Name, false);
                        // console.log('Contact: ' + curUser.ContactId);
                        // console.log('Account: ' + curUser.AccountId);
                        

                        // liveagent.findOrCreate("Account")
                        //     .map("Id", "Account ID", true, true, false)
                        //     // .map("Name", "Account Name", true, true, false)
                        //     .saveToTranscript("Account")
                        //     .linkToEntity("Contact", "AccountId");
                    }
                }
                
                liveagent.init(liveAgentInitUrl, initParams.deploymentId, initParams.orgId); 
            } catch(ex) {
                console.error(ex);
            }
        }

        this.callAction(cmp.get("c.getInitParams"), { deploymentAPIName: deploymentName, buttonAPIName: buttonName }, function success(initParams){
            console.log('params received');
            console.dir(initParams);
            cb(initParams);
        }, function error(err) {
            cb(null, err);
        });
    },*/

    /**
     * @description Initialises embedded iframe:
     *              Constructs a link with necessary parameters
     *              for the proxy live agent page to initialise
     *              live agent.
     * @author      Arturs Gusjko <arturs.gusjko@bettercloudsolutions.co.uk>
     * @date        2016-06-16
     * @param       {Component} cmp is a top level component
     * @param       {Event} evt is not used
     * @param       {Helper} h is a reference to the helper lightning js class
     * @return      {undefined}
     */
    initIFrame: function( cmp, evt, h ) {

        var deploymentName = cmp.get('v.deploymentAPIName');
        var buttonName = cmp.get('v.buttonAPIName');
        var liveAgentInitUrl = cmp.get('v.liveagentInitUrl');
        var deploymentUrl = cmp.get('v.deploymentUrl');
        var isDebug =  $A.util.getBooleanValue( cmp.get('v.debugMode') );
        
        if(!deploymentName || !buttonName || !liveAgentInitUrl || !deploymentUrl) {
            if( isDebug ) console.log(deploymentName);
            if( isDebug ) console.log(buttonName);
            if( isDebug ) console.log(liveAgentInitUrl);
            if( isDebug ) console.log(deploymentUrl);
            console.error('No Live Agent Settings');
            return;
        }

        var cb = function(initParams, err){
            try {
                if(err) throw err;

                var proxyParams = [
                    'buttonId=' + initParams.buttonId,
                    'deploymentId=' + initParams.deploymentId,
                    'orgId=' + initParams.orgId,
                    'liveAgentInitUrl=' + encodeURIComponent(liveAgentInitUrl),
                    'deploymentUrl=' + encodeURIComponent(deploymentUrl),
                    'debugMode=' + ( cmp.get('v.debugMode') ? '1' : '0' ),
                ];
                console.log(cmp.get('v.popupContact') , initParams.curUser );
                if( $A.util.getBooleanValue( cmp.get('v.popupContact') ) && initParams.curUser.ContactId ) {
                    proxyParams.push( 'userName=' + encodeURIComponent(initParams.curUser.Name) );
                    proxyParams.push( 'contactId=' + initParams.curUser.ContactId );
                }

                var proxyURL =  initParams.baseUrl + '/apex/LiveAgentProxy?' + proxyParams.join('&');
                if( isDebug ) console.log( 'proxyUrl: %s', proxyURL );

                cmp.set( 'v.proxyURL', proxyURL );

                window.addEventListener('message', function(event) {

                    if( isDebug ) console.log('postMessage Received: %o', event);
                    if( event.origin === window.location.origin ) {
                        switch(event.data.status) {
                            case 'LIVEAGENT_BUTTON_AVAILABLE':
                                // $A.getCallback(function(){
                                    if( isDebug ) console.log('setting to active');
                                    cmp.set('v.isAgentAvailable', true);
                                // })
                                break;
                            case 'LIVEAGENT_BUTTON_UNAVAILABLE':
                                // $A.getCallback(function(){
                                    if( isDebug ) console.log('setting to inactive');
                                    cmp.set('v.isAgentAvailable', false);
                                // })
                                break;
                        }
                    }
                });

            } catch(ex) {
                console.error(ex);
            }
        }

        this.callAction(cmp.get("c.getInitParams"), { deploymentAPIName: deploymentName, buttonAPIName: buttonName }, function success(initParams){
            if( isDebug ) console.log('Init params received: %o', initParams);
            cb(initParams);
        }, function error(err) {
            cb(null, err);
        });
    }
})