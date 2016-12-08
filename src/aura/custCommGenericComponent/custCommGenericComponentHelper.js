({
    /**
     * Calls a server side action based on the passed parameters
     * @param action the action to be called
     * @param params the action would be called using
     * @param successCallback to be called when action succeeds (optional)
     * @param errorCallback to be called when action succeeds (optional)
     **/
	callAction : function(action, params, successCallback, errorCallback) {
		action.setParams(params);
		
        action.setCallback(this, function(response) {
            var state = response.getState();
			if (state === "SUCCESS") {
                if (successCallback)
                	successCallback(response.getReturnValue());
            } else if (state === "ERROR" || state === "INCOMPLETE") {
                if(errorCallback) {
                	var errors = response.getError();
                    if (errors) {
                        if (errors[0] && errors[0].message) {
                            errorCallback(errors[0].message);
                        }
                    } else {
                        errorCallback('Unknown error');
                    }    
                }
            }
        }, 'ALL');
        
        $A.enqueueAction(action);
	},
    
    /**
     * Shows the common spinner
     * @param id for the spinner action. The same id must be passed to hide the spinner
     **/
    showSpinner: function(id) {
        var event = $A.get("e.c:custCommShowSpinner");
        
        if (event) {
            event.setParams({
                identifier: id
            });
        	event.fire();    
        }
    },
    
    /**
     * Hides the common spinner
     * @param id for the spinner action. The same id must be passed to show the spinner
     **/
    hideSpinner: function(id) {
        var event = $A.get("e.c:custCommHideSpinner");
        
        if (event) {
            event.setParams({
                identifier: id
            });
        	event.fire();    
        }
    },
    
    /**
     * Shows a message on the screen
     * @param message the text of the message to be shown
     * @param type the type of the error can be blank, success, error or offline. Default is error (Optional)
     * @param identifier of the error, required to programatically close the error (Optional)
     **/
    showMessage: function(message, type, id) {
        var event = $A.get("e.c:custCommShowMessage");
        if (event) {
            
            var params = { message : message };
            
            
            if (type === undefined) {
                params.type = 'error';
            } else {
                params.type = type;
            }
            
            if (id !== undefined) {
                params.identifier = id;
            }
            event.setParams(params);
        	event.fire();    
        }
        
    },
    
    /**
     * Hides the message shown on the screen
     * @param id of the message to hide
     **/
    hideMessage: function(id) {
        var event = $A.get("e.c:custCommHideMessage");
        if (event) {
            event.setParams({ identifier: id });
            event.fire();
        }
    },
    
    /**
     * Navigates to another community page
     * @param url the url to navigate to
     **/
    navigateToCommunityPage: function(url, redirect) {
        if (url.substring(0,4) == 'http') {
            var element = document.createElement('a');
            element.href = url;
            element.click();
        } else {
        	var urlEvent = $A.get('e.force:navigateToURL');
            var params = {
                'url': url
            };
            
            if (redirect) {
                params.redirect = redirect;
            }
            
            if (urlEvent) {
                urlEvent.setParams(params);
                urlEvent.fire();
            }    
        }
    },
    
	/**
     * Generates the xlinkHref for an svg icon
     * @param iconType SLDS type of the icon
     * @param iconName SLDS name of the icon
     **/
    generateXLinkHref: function(iconType, iconName) {
        var linkRef = "";
        if (iconType !== undefined && iconType != "" && iconName !== undefined && iconName != ""){
        	linkRef = "/sfsites/c/resource/SLDS104/assets/icons/" + iconType;
        	linkRef += "-sprite/svg/symbols.svg#" + iconName;
     	}
        return linkRef;
    }
})