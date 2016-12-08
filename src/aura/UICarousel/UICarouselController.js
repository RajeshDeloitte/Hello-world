({
    doInit: function(component,event,helper){
        var inputJson = component.get("v.carouselInputJson");
        if(inputJson !=null && inputJson !=''){
            try{
            var slides = JSON.parse(inputJson);
            component.set("v.slides", slides);     
            }catch(err){
                component.set("v.errorMsg", "Error Loading Slides. Please check if Input Json is Valid!");
            }
        }
    },
    onslideClick: function(component, event, helper){
        var slideIdx = parseInt(event.currentTarget.dataset.idx);        
        var slides = component.get('v.slides');
        if(slides !=null && slides.length>=slideIdx){
            console.log(slides[slideIdx].image);
            var slide = slides[slideIdx];
            if(slide['url']!=null){
                var urlEvent = $A.get("e.force:navigateToURL");
                urlEvent.setParams({
                    "url": slide.url
                });
                urlEvent.fire();               
            }

        }
    },
    sliderNav: function(component,event,helper){
        var slideIdx = parseInt(event.currentTarget.dataset.idx);
        helper.navToNewPosition(component, slideIdx);
    },
})