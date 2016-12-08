({
    // Your renderer method overrides go here
    afterRender: function(component, helper){
        var gaEvent = $A.get("e.c:CommunityGoogleAnalyticsEvent");
        gaEvent.setParams({'hitType': 'pageView','data': {
                'page': location.pathname,
                'title': document.title
            }});
        gaEvent.fire();
    }
})