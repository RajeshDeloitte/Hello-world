({
	doInit : function(cmp, event, helper) {
        cmp.set("v.sendMsgToParentWindow", false);
        cmp.set("v.redirectUrl", helper.getURLParameter("field_passthrough1"));
        // Set the listener to handle the messages from the parent window
        var listener = function(event) {
        	console.log("received");
            if (cmp.get("v.sendMsgToParentWindow")){
            	event.source.postMessage({"type": "serverCallFinished", "url": cmp.get("v.redirectUrl")}, "*"); 
        	}
        }.bind(this);
        if(window.addEventListener !== undefined) {
            console.log("listner");
			addEventListener("message", listener, false);
		}
        //////
        console.log(helper.getURLParameter("refId"));
        console.log(helper.getURLParameter("field_passthrough1"));
        if (helper.getURLParameter(cmp.get("v.success")) == "true"){
        	helper.showSpinner(cmp.getGlobalId());
        	helper.showMessage($A.get("{!$Label.c.PaymentSuccessfulMsg}"), "success", cmp.getGlobalId());
			// Call the server to link the payment method Id to the Billing Account
			helper.callAction(cmp.get("c.processPaymentID"), { paymentId : helper.getURLParameter("refId")}, function success(respValue){
                cmp.set("v.sendMsgToParentWindow", true);
                helper.hideSpinner(cmp.getGlobalId());
            }, function error(err){
            	cmp.set("v.sendMsgToParentWindow", true);
        		cmp.set("v.redirectUrl", "");
                helper.hideSpinner(cmp.getGlobalId());
            });
		} else {
            // TEMPORARILY
            // Display the error
        	helper.showMessage(helper.getURLParameter(cmp.get("v.errorMessage")), "error", cmp.getGlobalId());
        	cmp.set("v.redirectUrl", "");
            cmp.set("v.sendMsgToParentWindow", true);
            //window.parent.location = "/community/s/my-subscription";
            //window.parent.location = helper.getURLParameter("field_passthrough1");
        }
	}
})