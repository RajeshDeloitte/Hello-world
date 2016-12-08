({
    // Your renderer method overrides go here
    afterRender: function(component, helper){
        window.addEventListener('message', function(event) {
            helper.log(component, 'Received Message from Proxy: ' + event.data);
            component.set("v.gaFrameLoaded", true);
        });
        this.superAfterRender();
    }
})