({
	// submitZuoraForm : function(cmp, containerId) {
 //        // Submit the iframe using the Zuora js library
 //        Z.submit(containerId);
 //        // Set a js function to run periodically to ask the iframe if we should redirect
 //        var refreshIntervalId = setInterval(function(){ 
 //            message = "isProcessFinished";
 //            target_url = encodeURIComponent(document.location.href);
 //            target = document.getElementById(containerId).getElementsByTagName('iframe')[0].contentWindow;
 //            if (target_url.toLowerCase().indexOf('zuora') < 0){
 //                console.log("calling post message");
 //            	target['postMessage'](message, "*");
 //            }
 //        }, 3000);
 //        // Get the Id of the interval function to be able to cancel it
 //        cmp.set("v.intervalId", refreshIntervalId);
 //        // Set a listener function to handle the message from the iframe
 //        var listener = function(event) {
 //          	console.log("received by parent");
 //            clearInterval(cmp.get("v.intervalId"));
 //            console.log("url " + event.data.url);
 //            if (event.data.type == "serverCallFinished" && event.data.url != ""){
 //                this.navigateToCommunityPage(event.data.url);
 //            }
 //      	}.bind(this);
 //        if(window.addEventListener !== undefined) {
 //            window.addEventListener("message", listener, false);
	// 	}
	// },
    
 //    setListener : function(){
        
 //    },
    
 //    // Since there isn't a nice way to get the url parameters, I'm using this function
 //    // Source: http://bobbuzzard.blogspot.com.uy/2015/09/lightning-design-system-edit-parent-and.html
	// getURLParameter : function(param) {
 //    	var result = decodeURIComponent((new RegExp('[?|&]' + param + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search)||[,""])[1].replace(/\+/g, '%20'))||null;
 //        return result;
	// },
    
 //    createZXDObject: function(component) {
 //        var __z_version='1.3.0';
	// 	var ifrmId = 'z_hppm_iframe';
 //        var ZXD = function () {
            
 //            var interval_id,
 //                last_hash,
 //                cache_bust = 1,
 //                attached_callback,
 //                window = this;
            
 //            return {
 //                postMessage: function (message, target_url, target) {
                    
 //                    if (!target_url) {
 //                        return;
 //                    }
 //                    target = target || parent;  // default to parent
 //                    target['postMessage'](message, target_url.replace(/([^:]+:\/\/[^\/]+).*/, '$1'));
 //                },
                
 //                receiveMessage: function (callback, source_origin, allowSubDomain) {   
 //                    if (callback) {
 //                        attached_callback = function (e) {
 //                            if (Object.prototype.toString.call(source_origin) === "[object Function]" && source_origin(e.origin) === !1) {
 //                                return !1;
 //                            }
 //                            if (typeof source_origin === 'string' && e.origin !== source_origin) {
 //                                if (!allowSubDomain)
 //                                    return !1;
 //                                else if (allowSubDomain === 'true') {
 //                                    try {
 //                                        if (typeof source_origin === 'string') {
 //                                            var domains = e.origin.split('.');
 //                                            if (domains) {
 //                                                var secondLevelDomain = domains.slice(-2).join('.');
 //                                                var source_domains = source_origin.split('.');
 //                                                var source_sndLevelDomain = source_domains.slice(-2).join('.');
 //                                                if (source_sndLevelDomain.indexOf(secondLevelDomain) <= -1) {
 //                                                    return !1;
 //                                                }
 //                                            }
 //                                        }
 //                                    } catch (ex) {
 //                                        return !1;
 //                                    }
                                    
 //                                }
 //                                    else {
 //                                        return !1;
 //                                    }
 //                            }
 //                            callback(e);
 //                        };
 //                    }
 //                }
 //            };
 //        }();
        
 //        component.set('v.ZXD', ZXD);
 //        console.log(component.get('v.ZXD'));
 //    },
    
 //    createZObject: function(component, href) {
        
 //        var __z_version='1.3.0';
	// 	var ifrmId = 'z_hppm_iframe';
        
 //        var Z = function () {
 //            var zoverlay = '#z-overlay {filter: alpha(opacity=50);opacity:0.5;display:inline-block;position:fixed;top:0;left:0;width:100%;height:100%;background-color: #000;z-index: 1001;}';
 //            var zcontainer = '#z-container {border:1px;float:left; overflow: visible; position: absolute;padding: 0px; display: inline-block; top:5%; left:34%; margin: 0 auto;-webkit-border-radius: 5px;-moz-border-radius: 5px;border-radius:5px;background-color: #FAFAFA; border:1px solid #FAFAFA;border-top-color:#EDEDED;behavior: url(js/PIE.htc);z-index: 1002;}';
 //            var zdata = '#z-data {height: 100%; outline: 0px; width: 100%; overflow: visible;display: inline-block;border:1px; -webkit-border-radius: 5px;-moz-border-radius: 5px;border-radius:5px;}';
 //            var reset = "#reset{*, *:before, *:after {display: inline-block;-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;}}";
 //            var ziframe = '#z_hppm_iframe {background-color: #FAFAFA;vertical-align:bottom;z-index:9999;display:block;padding:0px;margin: 0px; border:0px solid #DDD;}';
            
 //            var method = 'requestPage';
 //            var baseUri;
 //            var errFn;
 //            var queryParam, initParams, ek;
 //            var requiredParams = ['tenantId', 'id', 'token', 'signature', 'key', 'style', 'submitEnabled', 'url'];
 //            // PAY-6939: add 'bankAccountNumber' and 'bankAccountName', since from now on we consider them as sensitive data
 //            var pciParams = ['creditCardNumber', 'cardSecurityCode', 'creditCardExpirationYear', 'creditCardExpirationMonth', 'bankAccountNumber', 'bankAccountName', 'ipAddress'];
 //            var callbackRegistered = false;
 //            var eventHandlers = {};
 //            var p;
            
 //            function isFunction(obj) {
 //                return obj && typeof obj === 'function';
 //            }
            
 //            function shallowCopy(oldObj) {
 //                var newObj = {};
 //                for(var i in oldObj) {
 //                    if(oldObj.hasOwnProperty(i)) {
 //                        newObj[i] = oldObj[i];
 //                    }
 //                }
 //                return newObj;
 //            }
            
 //            component.get('v.ZXD').receiveMessage(function (message) {
 //                try{
 //                    /*Init Part*/
 //                    var response = message.data;
                    
 //                    response = JSON.parse(response);
 //                    if (response.success) {
 //                        if (isFunction(eventHandlers['init'])) {
 //                            eventHandlers['init'](response);
 //                        }
 //                    } else if (response.success == false) {
 //                        Z.deactivateOverlay('z-overlay');
 //                        Z.deactivateOverlay('z-container');
 //                        if (eventHandlers['init']) {
 //                            eventHandlers['init'](response);
 //                        }
 //                    } else if (response.action == 'close') {
 //                        Z.deactivateOverlay('z-overlay');
 //                        Z.deactivateOverlay('z-container');
 //                    } else if (response.action == 'resize') {
 //                        Z.receive(response);
 //                    }
                    
 //                    if (response.action === 'validate' && isFunction(eventHandlers['validate'])) {
 //                        eventHandlers['validate'](response);
 //                    }
                    
 //                    if (response.action == 'customizeErrorMessage' && isFunction(eventHandlers['customizeErrorMessage'])) {
 //                        eventHandlers['customizeErrorMessage'](response.key, response.code, response.message);
 //                    }
                    
 //                    if (response.action && isFunction(eventHandlers[response.action])) {
 //                        eventHandlers[response.action](response);
 //                    }
 //                } catch (e) {
 //                    return;
 //                }
                
 //            });
            
 //            return {
 //                validateRequiredParams: function (params) {
 //                    var len = requiredParams.length;
 //                    for (var index = 0; index < len; index++) {
 //                        if (!params.hasOwnProperty(requiredParams[index])) {
 //                            // submit is optional for overlay
 //                            if (requiredParams[index] == 'submitEnabled' && params["style"].toLowerCase() == 'overlay') {
 //                                continue;
 //                            } else {
 //                                var msg = "Param with key [" + requiredParams[index] + "] is required.";
 //                                alert(msg);
 //                                if (!Z.isIE()) {
 //                                    // not ie, we will output the error message to console too.
 //                                    console.log(msg);
 //                                }
 //                                return false;
 //                            }
 //                        }
 //                    }
 //                    return true;
 //                },
                
 //                isIE: function () {
 //                    var ua = window.navigator.userAgent;
 //                    var msie = ua.indexOf('MSIE ');
 //                    var trident = ua.indexOf('Trident/');
                    
 //                    if (msie > 0) {
 //                        // IE 10 or older => return version number
 //                        return true;
 //                    }
                    
 //                    if (trident > 0) {
 //                        // IE 11 (or newer) => return version number
 //                        var rv = ua.indexOf('rv:');
 //                        return true;
 //                    }
                    
 //                    // other browser
 //                    return false;
 //                },
                
 //                validatePCIParams: function (params) {
 //                    var len = pciParams.length;
 //                    for (var index = 0; index < len; index++) {
 //                        var paramKey = 'field_' + pciParams[index];
 //                        if (params.hasOwnProperty(paramKey)) {
 //                            // submit is optional for overlay
 //                            if (0 < params[paramKey].trim().length && params[paramKey].trim().length < 300) {
 //                                var msg = "Field [" + paramKey + "] for Credit Card payment method type should be encrypted for pre-population";
 //                                if (!Z.isIE()) {
 //                                    // not ie, we will output the error message to console too.
 //                                    console.log(msg);
 //                                }
 //                                return false;
 //                            }
 //                        }
 //                    }
 //                    return true;
 //                },
                
 //                init: function (params, callback) {
 //                    console.log($A.getRoot());
 //                    queryParam = '?method=requestPage&host=' + encodeURIComponent(href) + '&';
 //                    var required = Z.validateRequiredParams(params);
                    
 //                    if (!required) return false;
 //                    required = Z.validatePCIParams(params);
                    
 //                    if (!required) return false;
                    
 //                    var pstr = JSON.stringify(params,
 //                                              function (key, value) {
 //                                                  if (key != '') {
 //                                                      if ('key' == key) {
 //                                                          ek = value;
 //                                                          // public key will be gotten from server side
 //                                                      } else if ('url' == key) {
 //                                                          baseUri = value;
 //                                                      } else {
 //                                                          queryParam = queryParam + key + '=' + encodeURIComponent(value) + '&';
 //                                                      }
 //                                                  }
 //                                                  return value;
 //                                              });
 //                    p = JSON.parse(pstr);
                    
 //                    eventHandlers['init'] = callback;
 //                    console.log("before remove pci");
 //                    // Remove PCI fields from params
 //                    var len = pciParams.length;
 //                    if (params) {
 //                        for (var index = 0; index < len; index++) {
 //                            var paramKey = "field_" + pciParams[index];
 //                            if (params.hasOwnProperty(paramKey)) {
 //                                params[paramKey] = "";
 //                            }
 //                        }
 //                    }
                    
 //                    return true;
 //                },
                
 //                prepopulate: function (params) {
                    
 //                    var iframeSrc = Z.createIframeURL();
                    
 //                    if (iframeSrc == document.getElementById(ifrmId).src || (document.getElementById(ifrmId).src.indexOf(iframeSrc) >= 0 && p.hasOwnProperty('customizeErrorRequired') && p.customizeErrorRequired == 'true')) {
 //                        var pstr = JSON.stringify(params,
 //                                                  function (key, value) {
 //                                                      if (key != '') {
 //                                                          var message = 'setField(' + key + ':' + value + ')';
 //                                                          Z.post(ifrmId, message);
 //                                                      }
 //                                                      return value;
 //                                                  });
 //                        var message = 'setField(key:' + ek + ')';
 //                        Z.post(ifrmId, message);
 //                        Z.post(ifrmId, 'setField(style:' + p.style + ')');
 //                        if (p.hasOwnProperty('customizeErrorRequired') && p.customizeErrorRequired == 'true') {
 //                            Z.post(ifrmId, 'customizeErrorRequired');
 //                            p['customizeErrorRequired'] = 'false';
 //                        }
 //                        Z.post(ifrmId, 'resize');
                        
 //                        if (errFn) {
 //                            errFn();
 //                        }
 //                    }
                    
 //                    // Remove error function after render
 //                    if (errFn) {
 //                        errFn = null;
 //                    }
 //                },
                
 //                contains: function (a, obj) {
 //                    for (var i = 0; i < a.length; i++) {
 //                        if (a[i] === obj) {
 //                            return true;
 //                        }
 //                    }
 //                    return false;
 //                },
                
 //                renderWithErrorHandler: function (params, initFields, callback, errorCallback) {
 //                    params['customizeErrorRequired'] = 'true';
 //                    Z.render(params, initFields, callback);
 //                    Z.customizeErrorHandler(errorCallback);
 //                },
                
 //                runAfterRender: function (errorFn) {
 //                    errFn = errorFn;
 //                },
                
 //                render: function (params, initFields, callback) {
 //                    console.log("Entering render");
 //                    var len = pciParams.length;
 //                    /*For USA and CAN, we provide state drop-down list, and set a default value if state is not specified to show the list*/
 //                    if (initFields && initFields['creditCardCountry'] && (initFields['creditCardCountry'] === 'USA' || initFields['creditCardCountry'] === 'CAN')) {
 //                        initFields['creditCardState'] = initFields['creditCardState'] || ' ';
 //                    }
 //                    console.log("First log");
 //                    if (initFields) {
 //                        for (var index = 0; index < len; index++) {
 //                            var paramKey = 'field_' + pciParams[index];
 //                            if (initFields.hasOwnProperty(pciParams[index])) {
 //                                params[paramKey] = initFields[pciParams[index]];
 //                            }
 //                        }
 //                    }
 //                    console.log("before doing init");
 //                    var inited = Z.init(params, callback);

 //                    if (!inited) return;
                    
 //                    if (initFields) {
 //                        var len = Object.keys(initFields).length;
 //                        initParams = shallowCopy(initFields);
 //                        for (index = 0; index < len; index++) {
 //                            var initKey = Object.keys(initFields)[index];
 //                            if (Z.contains(pciParams, initKey)) {
 //                                delete initParams[initKey];
 //                            }
 //                        }
 //                    } else {
 //                        initParams = null;
 //                    }
 //                    // S.Colman, 5/25: getting the id of the div by the value set on the parameter object (if defined)
 //                    // Otherwise use the default "zuora_payment"
 //                    console.log("checking containerId");
 //                    var containerId = 'zuora_payment';
 //                    if (params.hasOwnProperty('containerId')){
 //                        containerId = params.containerId;
 //                    }
 //                    console.log("getting containerId");
 //                    var container = document.getElementById(containerId);
 //                    if (typeof container == 'undefined' || !container) {
 //                        return {
 //                            "error"            : "invalid_request",
 //                            "error_description": "The container you specified does not exist"
 //                        };
 //                    }
                    
 //                    container.innerHTML = '';
 //                    Z.cleanUp(container, 'z-overlay');
 //                    Z.cleanUp(container, 'z-container');
                    
 //                    //mode-inline, overlay
 //                    if (p.style == 'inline') {
 //                        Z.addInlineStyles();
 //                        console.log("before creteIfrm");
 //                        Z.createIframe(container);
 //                        console.log("after creteIfrm");
 //                        return;
 //                    }
                    
 //                    if (p.style == 'overlay') {
 //                        Z.addOverlayStyles();
                        
 //                        var divOuter = Z.generateDiv('z-overlay', 'z-overlay');
 //                        container.appendChild(divOuter);
                        
 //                        var divContent = Z.generateDiv('z-container', 'z-container');
 //                        container.appendChild(divContent);
                        
 //                        var divData = Z.generateDiv('z-data', 'z-data');
 //                        divData.tabindex = "-1";
                        
 //                        divContent.appendChild(divData);
                        
 //                        Z.createIframe(document.getElementById('z-data'));
 //                        Z.activateOverlay('z-overlay');
 //                    }
 //                },
                
 //                cleanUp: function (container, elementName) {
 //                    var element = document.getElementById(elementName);
 //                    if (element != null) {
 //                        container.removeChild(element);
 //                    }
 //                },
                
 //                activateOverlay: function (id) {
 //                    try {
 //                        document.getElementById(id).style.display = 'inline';
 //                    } catch (e) {
 //                    }
 //                },
                
 //                deactivateOverlay: function (id) {
 //                    try {
 //                        document.getElementById(id).style.display = 'none';
 //                    } catch (e) {
 //                        //alert(e);
 //                    }
 //                },
                
 //                generateDiv: function (id, style, handler) {
 //                    var div = document.createElement("div");
 //                    div.id = id;
 //                    div.className = style;
 //                    div.border = '0';
                    
 //                    if (div.addEventListener) {
 //                        div.addEventListener("click", handler, false);
 //                    } else {
 //                        div.attachEvent("click", handler);
 //                    }
 //                    return div;
 //                },
                
 //                addOverlayStyles: function () {
 //                    var style = document.createElement('style');
 //                    style.type = 'text/css';
 //                    var lbstyle = document.createTextNode(zoverlay);
 //                    var lbcontentstyle = document.createTextNode(zcontainer);
 //                    var lbdatastyle = document.createTextNode(zdata);
 //                    var iframestyle = document.createTextNode(ziframe);
 //                    var lbreset = document.createTextNode(reset);
                    
                    
 //                    if (style.styleSheet) {
 //                        style.styleSheet.cssText = lbstyle.nodeValue + ' ' + lbcontentstyle.nodeValue + ' ' + lbdatastyle.nodeValue + ' ' + lbreset.nodeValue + ' ' + iframestyle.nodeValue;
 //                    } else {
 //                        style.appendChild(lbstyle);
 //                        style.appendChild(lbcontentstyle);
 //                        style.appendChild(lbdatastyle);
 //                        style.appendChild(iframestyle);
 //                        style.appendChild(lbreset);
 //                    }
                    
 //                    document.getElementsByTagName('head')[0].appendChild(style);
 //                },
                
 //                addInlineStyles: function () {
 //                    var style = document.createElement('style');
 //                    style.type = 'text/css';
 //                    var iframestyle = document.createTextNode(ziframe);
                    
 //                    if (style.styleSheet) {
 //                        style.styleSheet.cssText = iframestyle.nodeValue;
 //                    } else {
 //                        style.appendChild(iframestyle);
 //                    }
                    
 //                    document.getElementsByTagName('head')[0].appendChild(style);
 //                },
                
 //                createIframe: function (container) {
 //                    var uri = Z.createIframeURL();
                    
 //                    var iframe = component.find('zuora_iframe').getElement();
 //                    iframe.setAttribute('src', uri);
 //                    iframe.setAttribute('id', ifrmId);
 //                    iframe.setAttribute("overflow", "visible");
 //                    iframe.setAttribute("scrolling", "no");
 //                    iframe.setAttribute('frameBorder', '0');
 //                    iframe.setAttribute('allowtransparency', 'true');
 //                    iframe.setAttribute('class', 'z_hppm_iframe');
 //                    iframe.setAttribute('width', '100%');
 //                    iframe.setAttribute('height', '100%');
 //                    console.log(iframe);
 //                    iframe.setAttribute('onload', component.getReference('onIframeLoad'));

 //                    /*if (iframe.addEventListener) {
 //                        iframe.addEventListener("load", function (e) {
 //                            Z.prepopulate(initParams);
 //                            return false;
 //                        }, false);
 //                    } else {
 //                        iframe.attachEvent("onload", function () {
 //                            Z.prepopulate(initParams);
 //                            return false;
 //                        });
 //                    }*/
 //                    if (typeof options != 'undefined') {
 //                        if (typeof options.vertical != 'undefined' && options.vertical) {
 //                            iframe.style.width = '100%';
 //                            iframe.style.height = '100%';
 //                        }
 //                    }
 //                },
                
 //                createIframeURL: function () {
 //                    var uri = baseUri;
 //                    return uri.concat(queryParam);
 //                },
                
 //                post: function (hosted_iframe_id, message) {
 //                    // pass the URL of the current parent page to the iframe using location.hash
 //                    var iframe = document.getElementById(hosted_iframe_id);
 //                    var host = encodeURIComponent(document.location.href);
 //                    var src = iframe.src;
 //                    if (src.indexOf(host) <= -1) {
 //                        iframe.src = src + '#' + host;
 //                    }
 //                    console.log('here?');
                    
 //                    component.get('v.ZXD').postMessage(message, src, iframe.contentWindow);
 //                    return false;
 //                },
                
 //                receive              : function (message) {
 //                    ZFB.resizeCaller(ifrmId, message.action, message.height, message.width);
 //                },
                
 //                // validate should be invoked after z.render(...), otherwise it won't be available.
 //                validate             : function (callback) {
 //                    if (callback == null || callback == undefined) {
 //                        Z.closeWindow();
                        
 //                        var msg = "Validate function required.";
 //                        alert(msg);
 //                        if (!Z.isIE()) {
 //                            // not ie, we will output the error message to console too.
 //                            console.log(msg);
 //                        }
                        
                        
 //                        return false;
 //                    }
                    
 //                    // register callback for validation
 //                    /*ZXD.receiveMessage(function(message) {
 //       var response= message.data;
 //       response =JSON.parse(response);
 //       callback(response);
 //       });*/
 //                    eventHandlers['validate'] = callback;
                    
 //                    // post message to backend
 //                    var message = 'validate';
 //                    Z.post(ifrmId, message);
 //                },
                
 //                // customizeErrorHandler should be invoked after z.render(...), otherwise it won't be available.
 //                customizeErrorHandler: function (callback) {
 //                    if (callback == null || callback == undefined) {
 //                        Z.closeWindow();
 //                        var msg = "Customized error message function required.";
 //                        alert(msg);
 //                        if (!Z.isIE()) {
 //                            // not ie, we will output the error message to console too.
 //                            console.log(msg);
 //                        }
 //                        return false;
 //                    }
                    
 //                    /*
 //       ZXD.receiveMessage(function(message) {
 //       var response= message.data;
 //       response =JSON.parse(response);
 //       if(response.action == 'customizeErrorMessage'){
 //       callback(response.key, response.code, response.message);
 //       }
 //       });
 //       */
 //          eventHandlers['customizeErrorMessage'] = callback;
 //      },
                
 //                sendErrorMessageToHpm: function (key, errorMessage) {
 //                    var jsonMessage = {
 //                        action : 'customizeErrorMessage',
 //                        key    : key,
 //                        message: errorMessage
 //                    };
                    
 //                    var newMessage = JSON.stringify(jsonMessage);
 //                    Z.post(ifrmId, newMessage);
 //                },
                
 //                closeWindow: function () {
 //                    // close window
 //                    Z.deactivateOverlay('z-overlay');
 //                    Z.deactivateOverlay('z-container');
 //                },
                
 //                submit: function (containerId) {
 //                    // S.Colman, 5/25: if passed as parameter, set the iframe Id as the the Id of the iframe
 //                    // contained in the element with Id containerId
 //                    if (containerId !== undefined){
 //                        var currentIframe = document.getElementById(containerId).getElementsByTagName('iframe')[0];
 //                        //console.log(document.getElementById(containerId));
 //                        //console.log(document.getElementById(containerId).getElementsByTagName('iframe'));
 //                        console.log(currentIframe.src);
 //                        //ifrmId = iframeId;
 //                        var src = currentIframe.src + '#' + encodeURIComponent(document.location.href);
 //                        document.getElementById(containerId).getElementsByTagName('iframe')[0].src = src;
                        
 //                        component.get('v.ZXD').postMessage("postPage", src, document.getElementById(containerId).getElementsByTagName('iframe')[0].contentWindow);
 //                        component.get('v.ZXD').postMessage("postPage", src, null);
                        
 //                    } else {
 //                        var src = document.getElementById(ifrmId).src + '#' + encodeURIComponent(document.location.href);
 //                        document.getElementById(ifrmId).src = src;
 //                        // Temporarily commentd out
 //                        //ZXD.postMessage("postPage", src, document.getElementById(ifrmId).contentWindow);
 //                    }
 //                    return true;
 //                },
                
 //                responseHandler: function (response) {
 //                    var url = response.redirectUrl;
 //                    if (response.success) {
 //                        var redirectUrl = url + "?refId=" + response.refId + "&success=" + response.success + "&signature=" + response.signature + "&token=" + response.token;
 //                        window.location.replace(redirectUrl);
 //                    } else {
 //                        var redirectUrl = url + "?errorCode=" + response.errorCode + "&errorMessage=" + response.errorMessage + "&success=" + response.success + "&signature=" + response.signature + "&token=" + response.token;
 //                        window.location.replace(redirectUrl);
 //                    }
 //                },
 //                setEventHandler: function (actionName, handler ) {
 //                    if(actionName && handler) {
 //                        eventHandlers[actionName] = handler;
 //                    }
 //                }
                
 //            };
 //        }();
        
 //        component.set('v.Zuora', Z);
 //        console.log(component.get('v.Zuora'));
 //    },

    submitPayment: function( cmp, auraWindowName ) {
        var paymentWindow = cmp.find( auraWindowName ).getElement().contentWindow;
        var payload = {
            action: 'SUBMIT'
        }
        paymentWindow.postMessage( payload, window.location.origin);
    }  
})