({
    handleGAEvent : function(component, event, helper) {
        var hitType = event.getParam("hitType");
        var gaData = event.getParam("data");
        helper.log(component, 'Received Event for ' + hitType);
        helper.log(component, gaData);
        if(hitType == null || hitType==''){
            hitType = 'pageView';
        } 
        if(gaData == null){
            gaData = {
                'page': location.pathname,
                'title': document.title
            };
        }        
        helper.sendGAEvent(component, hitType, gaData);
    }
})