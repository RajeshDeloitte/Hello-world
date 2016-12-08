({
    navToNewPosition : function(component, newPos) {
        var currentPos = component.get('v.currentSlideIdx');
        var slideCount = 0;
        if(component.get('v.slides') !=null){
           slideCount= component.get('v.slides').length;
        }        
        component.set("v.currentSlideIdx" , newPos);
        
        var newDirection = newPos > currentPos ? 'right' : 'left';
        var currentDirection = newPos < currentPos ? 'right' : 'left';
        var indicatorCmp = component.find('slider_indicator');
        $A.util.removeClass (indicatorCmp, 'slider__indicator--' + currentDirection);
        $A.util.addClass(indicatorCmp, 'slider__indicator--' + newDirection);
    },
    next : function(component){
        var currentPos = component.get('v.currentSlideIdx');
        var slideCount = 0;
        if(component.get('v.slides') !=null){
           slideCount= component.get('v.slides').length;
        }
        if(currentPos >= (slideCount-1)){
            currentPos = 0;
        } else {
            currentPos = currentPos+1;
        }
		this.navToNewPosition(component, currentPos);
    },
    play: function(component) {
       	var autoPlayInterval = component.get('v.autoPlayInterval');
    	setInterval(this.next.bind(this,component), autoPlayInterval);
    }
})