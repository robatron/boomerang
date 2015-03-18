(function(){
    var dom,doc,where,iframe = document.createElement('iframe'),win = window;
    
    function boomerangSaveLoadTime(e) {
        win.BOOMR_onload=e.timeStamp || new Date().getTime();
    }
    if (document.body.addEventListener) {
        win.addEventListener("load", boomerangSaveLoadTime, false);
    } else if (el.attachEvent) {
        win.attachEvent("onload", boomerangSaveLoadTime);
    }
    
    iframe.src = "javascript:false";
    (iframe.frameElement || iframe).style.cssText = "width:0;height:0;border:0;display:none;";
    where = document.getElementsByTagName('script')[0];
    where.parentNode.insertBefore(iframe, where);

    try {
        doc = iframe.contentWindow.document;
    } catch(e) {
        dom = document.domain;
        iframe.src="javascript:var d=document.open();d.domain='"+dom+"';void(0);";
        doc = iframe.contentWindow.document;
    }
    doc.open()._l = function() {
        var js = this.createElement("script");
        if(dom) this.domain = dom;
        js.id = "boomr-if-as";
        js.src = '/delay?delay=3000&file=build/boomerang-latest-debug.js'
        BOOMR_lstart=new Date().getTime();
        this.body.appendChild(js);
    };
    doc.write('<body onload="document._l();">');
    doc.close();
})();
