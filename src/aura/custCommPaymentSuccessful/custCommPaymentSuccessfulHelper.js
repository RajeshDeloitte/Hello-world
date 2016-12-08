({
    // Since there isn't a nice way to get the url parameters, I'm using this function
    // Source: http://bobbuzzard.blogspot.com.uy/2015/09/lightning-design-system-edit-parent-and.html
	getURLParameter : function(param) {
    	var result=decodeURIComponent((new RegExp('[?|&]' + param + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search)||[,""])[1].replace(/\+/g, '%20'))||null;
        return result;
	}
})