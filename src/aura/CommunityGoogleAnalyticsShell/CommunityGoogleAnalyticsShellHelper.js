({
    sendGAEvent : function(component, hitType, gaData) {
        var gaFrameLoaded = component.get("v.gaFrameLoaded");
        this.log(component, 'ga proxy loaded? :' + gaFrameLoaded);
        // If Ga Frame Not loaded or if these events are coming from community builder, ignore it.
        if(!gaFrameLoaded || location.href.indexOf('commeditor') >=0){
            return;
        }
        var frameWindow = component.find("analyticsFrame").getElement().contentWindow;
        frameWindow.postMessage({
            'hitType': hitType,
            'data': gaData
        }, location.protocol + "//" + location.host);        
    },
    // Helper method to log messages to browser console.
    log : function(component, message){
        if(window.console && component.get('v.debug') == true){
            console.log(message);
        }
    }
})