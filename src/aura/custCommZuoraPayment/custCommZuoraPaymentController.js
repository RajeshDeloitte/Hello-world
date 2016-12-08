({
	/*doInit : function(cmp, event, helper) {
        helper.createZXDObject(cmp);
        helper.createZObject(cmp, cmp.get('v.href'));
        helper.showSpinner(cmp.getGlobalId());
        var redirectUrl = helper.getURLParameter("finishPage");
        redirectUrl = redirectUrl != null ? redirectUrl : "/my-subscription";
        console.log(redirectUrl);
        helper.callAction(cmp.get("c.loadSubscriptionPaymentPages"), {}, function success(respValue){
            var paramsACH = {
                containerId : "ach_payment",
                tenantId : respValue.ppACH.zppTenantID,
                id: respValue.ppACH.zppPageID,
                token: respValue.ppACH.zppToken,
                signature: respValue.ppACH.zppSignature,
                style:"inline",
                key: respValue.ppACH.zppKey,
                submitEnabled:"false",
                locale:"en",
                url: respValue.ppACH.zppURL,
                field_passthrough1  : redirectUrl
            };
            var paramsCreditCard = {
                containerId : "creditCard_payment",
                tenantId : respValue.ppCreditCard.zppTenantID,
                id: respValue.ppCreditCard.zppPageID,
                token: respValue.ppCreditCard.zppToken,
                signature: respValue.ppCreditCard.zppSignature,
                style:"inline",
                key: respValue.ppCreditCard.zppKey,
                submitEnabled:"false",
                locale:"en",
                url: respValue.ppCreditCard.zppURL,
                field_passthrough1  : redirectUrl
            };
            
            try {

            cmp.get('v.Zuora').render(paramsACH, {}, function callback(response) {});
            //Test
            console.log("before after render");
            cmp.get('v.Zuora').runAfterRender(function callback(response) {
                console.log("after render");
                helper.hideSpinner(cmp.getGlobalId());
                cmp.get('v.Zuora').render(paramsCreditCard, {}, function callback(response) {});
            });
            cmp.set("v.iframeLoaded", true);

            } catch(ex) {
                console.error(ex);
            }
            
        }, function error(err){
            helper.hideSpinner(cmp.getGlobalId());
        });
    },
    
    afterZuoraJSLoaded: function(cmp, event) {
        cmp.set("v.zuoraLoaded", true);
        console.log('Window', window);
        console.log("myFF()");
        if (Z === undefined){
                    console.log("Z is undefined");
                } else {
                    
                    console.log("Z is NOT undefined");
                }
	},*/
    
    submitACHZuoraForm: function(cmp, event, helper) {
        //helper.submitZuoraForm(cmp, "ach_payment");
    
        helper.showSpinner( cmp.getGlobalId() );
        helper.callAction( cmp.get('c.incrementSubmitCount'), {}, function success1(isLimitReached){
            cmp.set('v.isLimitReached', isLimitReached);
            helper.submitPayment( cmp, 'zuora_ach_iframe' );
        });
        
	},
    
    submitCreditCardZuoraForm: function(cmp, event, helper) {
        //helper.submitZuoraForm(cmp, "creditCard_payment");
        
        helper.showSpinner( cmp.getGlobalId() );
        helper.callAction( cmp.get('c.incrementSubmitCount'), {}, function success1(isLimitReached){
            cmp.set('v.isLimitReached', isLimitReached);
            helper.submitPayment( cmp, 'zuora_creditcard_iframe');
        });
	},
    
    /*handleRedirectAfterZuoraCallback : function(cmp, event) {
        console.log("handling event");
        var url = event.getParam("redirectUrl");
        console.log(url);
        helper.navigateToCommunityPage(url);
    },

    onIframeLoad: function(cmp, evt, h) {
        console.log('Iframe loaded');

    },*/

    initPage: function( cmp, evt, h ) {

        h.callAction( cmp.get('c.isSubmitLimitReached'), {}, function s1(isLimitReached) {

            cmp.set('v.isLimitReached', isLimitReached);

            if( !isLimitReached ) {

                cmp.set('v.isVisible', true);

                 h.callAction( cmp.get('c.getBaseUrl'), {}, function success(resp) {
                    var zframeWidth = cmp.find('zuora_ach_iframe').getElement().offsetWidth || cmp.find('zuora_creditcard_iframe').getElement().offsetWidth;
                    var baseUrl = resp;
                    cmp.set( 'v.achUrl', baseUrl + '/apex/CustCommZuoraPayment?type=ACH&width=' + zframeWidth );
                    cmp.set( 'v.creditCardUrl', baseUrl + '/apex/CustCommZuoraPayment?type=CreditCard&width=' + zframeWidth );
                });

                window.addEventListener('message', $A.getCallback(function(event) {
                    if( event.origin === window.location.origin ) {
                        switch( event.data.action ) {
                            case 'SET_DIMENSIONS':
                                switch( event.data.data.type ) {
                                    case 'ACH':
                                        // $A.getCallback(function(){
                                            cmp.set( 'v.achIframeStyle', 'height: ' + event.data.data.height + 'px');
                                        // })();
                                        break;
                                    case 'CreditCard':
                                        // $A.getCallback(function(){
                                            cmp.set( 'v.creditCardIframeStyle', 'height: ' + event.data.data.height + 'px');
                                        // })();
                                        break;
                                }
                                break;
                            case 'PAYMENT_COMPLETED':
                                if( event.data.data.success === "true" ) {
                                    h.hideMessage('pyament_change_limit_reached');
                                    h.callAction(cmp.get("c.processPaymentID"), { paymentId : event.data.data.refId }, function success(respValue){
                                        cmp.set( 'v.isVisible', false );
                                        h.showMessage($A.get("{!$Label.c.PaymentSuccessfulMsg}"), "success", cmp.getGlobalId());
                                        h.hideSpinner(cmp.getGlobalId());

                                        setTimeout($A.getCallback(function redirectToSubscriptionPage(){
                                            h.hideMessage(cmp.getGlobalId());
                                            h.navigateToCommunityPage('/my-subscription');
                                        }), 5000);
                                    }, function error(err){
                                        h.showMessage(err, "error", cmp.getGlobalId());
                                        h.hideSpinner(cmp.getGlobalId());
                                    });
                                } else {
                                    h.showMessage(event.data.data.errorMessage, "error", cmp.getGlobalId());
                                    h.hideSpinner(cmp.getGlobalId());
                                }
                                break;
                            case 'PAYMENT_ERROR':
                                if( event.data.data.success !== "true" ) {
                                    h.hideSpinner(cmp.getGlobalId());
                                } 

                        }
                    }
                }));
            }
        });
       
    },

    back: function( cmp, evt, h ) {
        h.navigateToCommunityPage('/my-subscription');
    },

    limitReached: function( cmp, evt, h ) {
        h.hideMessage('pyament_change_limit_reached');
        if( cmp.get('v.isLimitReached') ) {
            h.showMessage($A.get('$Label.c.CustComm_Payment_Change_Limit_Reached_Error'), 'error', 'pyament_change_limit_reached');
        }
    }
})