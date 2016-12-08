({
    onButtonClick: function(component, event, helper){
        var eventName = component.get("v.eventName");
        if(eventName==null){
            return;
        }
        var eventParamsJson = component.get("v.eventParamsJson");
        var eventParams = null;
        if(eventParamsJson!=null && eventParamsJson !=''){
            eventParams = JSON.parse(component.get("v.eventParamsJson"));
        }
        var eventToFire = $A.get(eventName);
        if(eventParams!=null){
            eventToFire.setParams(eventParams);
        }
        eventToFire.fire();
    }
})