({
    // Your renderer method overrides go here
    afterRender: function(component, helper){
        var autoPlay = component.get('v.autoPlay');
        // If auto play is selected, start the auto play.
        if(autoPlay){
            helper.play(component);
        }
        this.superAfterRender();
    }
})