window.Modernizr=function(e,t,i){function n(e){_.cssText=e}function s(e,t){return n(C.join(e+";")+(t||""))}function o(e,t){return typeof e===t}function r(e,t){return!!~(""+e).indexOf(t)}function a(e,t){for(var n in e)if(_[e[n]]!==i)return"pfx"==t?e[n]:!0;return!1}function l(e,t,n){for(var s in e){var r=t[e[s]];if(r!==i)return n===!1?e[s]:o(r,"function")?r.bind(n||t):r}return!1}function c(e,t,i){var n=e.charAt(0).toUpperCase()+e.substr(1),s=(e+" "+T.join(n+" ")+n).split(" ");return o(t,"string")||o(t,"undefined")?a(s,t):(s=(e+" "+S.join(n+" ")+n).split(" "),l(s,t,i))}function u(){f.input=function(i){for(var n=0,s=i.length;s>n;n++)N[i[n]]=i[n]in b;return N.list&&(N.list=!!t.createElement("datalist")&&!!e.HTMLDataListElement),N}("autocomplete autofocus list placeholder max min multiple pattern required step".split(" ")),f.inputtypes=function(e){for(var n,s,o,r=0,a=e.length;a>r;r++)b.setAttribute("type",s=e[r]),n="text"!==b.type,n&&(b.value=w,b.style.cssText="position:absolute;visibility:hidden;",/^range$/.test(s)&&b.style.WebkitAppearance!==i?(g.appendChild(b),o=t.defaultView,n=o.getComputedStyle&&"textfield"!==o.getComputedStyle(b,null).WebkitAppearance&&0!==b.offsetHeight,g.removeChild(b)):/^(search|tel)$/.test(s)||(/^(url|email)$/.test(s)?n=b.checkValidity&&b.checkValidity()===!1:/^color$/.test(s)?(g.appendChild(b),g.offsetWidth,n=b.value!=w,g.removeChild(b)):n=b.value!=w)),E[e[r]]=!!n;return E}("search tel url email datetime date month week time datetime-local number range color".split(" "))}var d,h,p="2.5.3",f={},m=!0,g=t.documentElement,v="modernizr",y=t.createElement(v),_=y.style,b=t.createElement("input"),w=":)",x={}.toString,C=" -webkit- -moz- -o- -ms- ".split(" "),k="Webkit Moz O ms",T=k.split(" "),S=k.toLowerCase().split(" "),A={svg:"http://www.w3.org/2000/svg"},M={},E={},N={},L=[],D=L.slice,$=function(e,i,n,s){var o,r,a,l=t.createElement("div"),c=t.body,u=c?c:t.createElement("body");if(parseInt(n,10))for(;n--;)a=t.createElement("div"),a.id=s?s[n]:v+(n+1),l.appendChild(a);return o=["&#173;","<style>",e,"</style>"].join(""),l.id=v,u.innerHTML+=o,u.appendChild(l),c||(u.style.background="",g.appendChild(u)),r=i(l,e),c?l.parentNode.removeChild(l):u.parentNode.removeChild(u),!!r},I=function(){function e(e,s){s=s||t.createElement(n[e]||"div"),e="on"+e;var r=e in s;return r||(s.setAttribute||(s=t.createElement("div")),s.setAttribute&&s.removeAttribute&&(s.setAttribute(e,""),r=o(s[e],"function"),o(s[e],"undefined")||(s[e]=i),s.removeAttribute(e))),s=null,r}var n={select:"input",change:"input",submit:"form",reset:"form",error:"img",load:"img",abort:"img"};return e}(),W={}.hasOwnProperty;h=o(W,"undefined")||o(W.call,"undefined")?function(e,t){return t in e&&o(e.constructor.prototype[t],"undefined")}:function(e,t){return W.call(e,t)},Function.prototype.bind||(Function.prototype.bind=function(e){var t=this;if("function"!=typeof t)throw new TypeError;var i=D.call(arguments,1),n=function(){if(this instanceof n){var s=function(){};s.prototype=t.prototype;var o=new s,r=t.apply(o,i.concat(D.call(arguments)));return Object(r)===r?r:o}return t.apply(e,i.concat(D.call(arguments)))};return n});!function(i,n){var s=i.join(""),o=n.length;$(s,function(i,n){for(var s=t.styleSheets[t.styleSheets.length-1],r=s?s.cssRules&&s.cssRules[0]?s.cssRules[0].cssText:s.cssText||"":"",a=i.childNodes,l={};o--;)l[a[o].id]=a[o];f.touch="ontouchstart"in e||e.DocumentTouch&&t instanceof DocumentTouch||9===(l.touch&&l.touch.offsetTop),f.csstransforms3d=9===(l.csstransforms3d&&l.csstransforms3d.offsetLeft)&&3===l.csstransforms3d.offsetHeight,f.generatedcontent=(l.generatedcontent&&l.generatedcontent.offsetHeight)>=1,f.fontface=/src/i.test(r)&&0===r.indexOf(n.split(" ")[0])},o,n)}(['@font-face {font-family:"font";src:url("https://")}',["@media (",C.join("touch-enabled),("),v,")","{#touch{top:9px;position:absolute}}"].join(""),["@media (",C.join("transform-3d),("),v,")","{#csstransforms3d{left:9px;position:absolute;height:3px;}}"].join(""),['#generatedcontent:after{content:"',w,'";visibility:hidden}'].join("")],["fontface","touch","csstransforms3d","generatedcontent"]);M.flexbox=function(){return c("flexOrder")},M.canvas=function(){var e=t.createElement("canvas");return!!e.getContext&&!!e.getContext("2d")},M.canvastext=function(){return!!f.canvas&&!!o(t.createElement("canvas").getContext("2d").fillText,"function")},M.webgl=function(){try{var n,s=t.createElement("canvas");n=!(!e.WebGLRenderingContext||!s.getContext("experimental-webgl")&&!s.getContext("webgl")),s=i}catch(o){n=!1}return n},M.touch=function(){return f.touch},M.geolocation=function(){return!!navigator.geolocation},M.postmessage=function(){return!!e.postMessage},M.websqldatabase=function(){return!!e.openDatabase},M.indexedDB=function(){return!!c("indexedDB",e)},M.hashchange=function(){return I("hashchange",e)&&(t.documentMode===i||t.documentMode>7)},M.history=function(){return!!e.history&&!!history.pushState},M.draganddrop=function(){var e=t.createElement("div");return"draggable"in e||"ondragstart"in e&&"ondrop"in e},M.websockets=function(){for(var t=-1,i=T.length;++t<i;)if(e[T[t]+"WebSocket"])return!0;return"WebSocket"in e},M.rgba=function(){return n("background-color:rgba(150,255,150,.5)"),r(_.backgroundColor,"rgba")},M.hsla=function(){return n("background-color:hsla(120,40%,100%,.5)"),r(_.backgroundColor,"rgba")||r(_.backgroundColor,"hsla")},M.multiplebgs=function(){return n("background:url(https://),url(https://),red url(https://)"),/(url\s*\(.*?){3}/.test(_.background)},M.backgroundsize=function(){return c("backgroundSize")},M.borderimage=function(){return c("borderImage")},M.borderradius=function(){return c("borderRadius")},M.boxshadow=function(){return c("boxShadow")},M.textshadow=function(){return""===t.createElement("div").style.textShadow},M.opacity=function(){return s("opacity:.55"),/^0.55$/.test(_.opacity)},M.cssanimations=function(){return c("animationName")},M.csscolumns=function(){return c("columnCount")},M.cssgradients=function(){var e="background-image:",t="gradient(linear,left top,right bottom,from(#9f9),to(white));",i="linear-gradient(left top,#9f9, white);";return n((e+"-webkit- ".split(" ").join(t+e)+C.join(i+e)).slice(0,-e.length)),r(_.backgroundImage,"gradient")},M.cssreflections=function(){return c("boxReflect")},M.csstransforms=function(){return!!c("transform")},M.csstransforms3d=function(){var e=!!c("perspective");return e&&"webkitPerspective"in g.style&&(e=f.csstransforms3d),e},M.csstransitions=function(){return c("transition")},M.fontface=function(){return f.fontface},M.generatedcontent=function(){return f.generatedcontent},M.video=function(){var e=t.createElement("video"),i=!1;try{(i=!!e.canPlayType)&&(i=new Boolean(i),i.ogg=e.canPlayType('video/ogg; codecs="theora"').replace(/^no$/,""),i.h264=e.canPlayType('video/mp4; codecs="avc1.42E01E"').replace(/^no$/,""),i.webm=e.canPlayType('video/webm; codecs="vp8, vorbis"').replace(/^no$/,""))}catch(n){}return i},M.audio=function(){var e=t.createElement("audio"),i=!1;try{(i=!!e.canPlayType)&&(i=new Boolean(i),i.ogg=e.canPlayType('audio/ogg; codecs="vorbis"').replace(/^no$/,""),i.mp3=e.canPlayType("audio/mpeg;").replace(/^no$/,""),i.wav=e.canPlayType('audio/wav; codecs="1"').replace(/^no$/,""),i.m4a=(e.canPlayType("audio/x-m4a;")||e.canPlayType("audio/aac;")).replace(/^no$/,""))}catch(n){}return i},M.localstorage=function(){try{return localStorage.setItem(v,v),localStorage.removeItem(v),!0}catch(e){return!1}},M.sessionstorage=function(){try{return sessionStorage.setItem(v,v),sessionStorage.removeItem(v),!0}catch(e){return!1}},M.webworkers=function(){return!!e.Worker},M.applicationcache=function(){return!!e.applicationCache},M.svg=function(){return!!t.createElementNS&&!!t.createElementNS(A.svg,"svg").createSVGRect},M.inlinesvg=function(){var e=t.createElement("div");return e.innerHTML="<svg/>",(e.firstChild&&e.firstChild.namespaceURI)==A.svg},M.smil=function(){return!!t.createElementNS&&/SVGAnimate/.test(x.call(t.createElementNS(A.svg,"animate")))},M.svgclippaths=function(){return!!t.createElementNS&&/SVGClipPath/.test(x.call(t.createElementNS(A.svg,"clipPath")))};for(var P in M)h(M,P)&&(d=P.toLowerCase(),f[d]=M[P](),L.push((f[d]?"":"no-")+d));return f.input||u(),n(""),y=b=null,f._version=p,f._prefixes=C,f._domPrefixes=S,f._cssomPrefixes=T,f.hasEvent=I,f.testProp=function(e){return a([e])},f.testAllProps=c,f.testStyles=$,g.className=g.className.replace(/(^|\s)no-js(\s|$)/,"$1$2")+(m?" js "+L.join(" "):""),f}(this,this.document),function(e,t){function i(e,t){var i=e.createElement("p"),n=e.getElementsByTagName("head")[0]||e.documentElement;return i.innerHTML="x<style>"+t+"</style>",n.insertBefore(i.lastChild,n.firstChild)}function n(){var e=m.elements;return"string"==typeof e?e.split(" "):e}function s(e){var t={},i=e.createElement,s=e.createDocumentFragment,o=s();e.createElement=function(e){var n=(t[e]||(t[e]=i(e))).cloneNode();return m.shivMethods&&n.canHaveChildren&&!f.test(e)?o.appendChild(n):n},e.createDocumentFragment=Function("h,f","return function(){var n=f.cloneNode(),c=n.createElement;h.shivMethods&&("+n().join().replace(/\w+/g,function(e){return t[e]=i(e),o.createElement(e),'c("'+e+'")'})+");return n}")(m,o)}function o(e){var t;return e.documentShived?e:(m.shivCSS&&!d&&(t=!!i(e,"article,aside,details,figcaption,figure,footer,header,hgroup,nav,section{display:block}audio{display:none}canvas,video{display:inline-block;*display:inline;*zoom:1}[hidden]{display:none}audio[controls]{display:inline-block;*display:inline;*zoom:1}mark{background:#FF0;color:#000}")),h||(t=!s(e)),t&&(e.documentShived=t),e)}function r(e){for(var t,i=e.getElementsByTagName("*"),s=i.length,o=RegExp("^(?:"+n().join("|")+")$","i"),r=[];s--;)t=i[s],o.test(t.nodeName)&&r.push(t.applyElement(a(t)));return r}function a(e){for(var t,i=e.attributes,n=i.length,s=e.ownerDocument.createElement(v+":"+e.nodeName);n--;)t=i[n],t.specified&&s.setAttribute(t.nodeName,t.nodeValue);return s.style.cssText=e.style.cssText,s}function l(e){for(var t,i=e.split("{"),s=i.length,o=RegExp("(^|[\\s,>+~])("+n().join("|")+")(?=[[\\s,>+~#.:]|$)","gi"),r="$1"+v+"\\:$2";s--;)t=i[s]=i[s].split("}"),t[t.length-1]=t[t.length-1].replace(o,r),i[s]=t.join("}");return i.join("{")}function c(e){for(var t=e.length;t--;)e[t].removeNode()}function u(e){var t,n,s=e.namespaces,o=e.parentWindow;return!y||e.printShived?e:("undefined"==typeof s[v]&&s.add(v),o.attachEvent("onbeforeprint",function(){for(var s,o,a,c=e.styleSheets,u=[],d=c.length,h=Array(d);d--;)h[d]=c[d];for(;a=h.pop();)if(!a.disabled&&g.test(a.media)){for(s=a.imports,d=0,o=s.length;o>d;d++)h.push(s[d]);try{u.push(a.cssText)}catch(p){}}u=l(u.reverse().join("")),n=r(e),t=i(e,u)}),o.attachEvent("onafterprint",function(){c(n),t.removeNode(!0)}),e.printShived=!0,e)}var d,h,p=e.html5||{},f=/^<|^(?:button|form|map|select|textarea)$/i;!function(){var e=t.createElement("a");e.innerHTML="<xyz></xyz>",d="hidden"in e,h=1==e.childNodes.length||function(){try{t.createElement("a")}catch(e){return!0}var i=t.createDocumentFragment();return"undefined"==typeof i.cloneNode||"undefined"==typeof i.createDocumentFragment||"undefined"==typeof i.createElement}()}();var m={elements:p.elements||"abbr article aside audio bdi canvas data datalist details figcaption figure footer header hgroup mark meter nav output progress section summary time video",shivCSS:p.shivCSS!==!1,shivMethods:p.shivMethods!==!1,type:"default",shivDocument:o};e.html5=m,o(t);var g=/^$|\b(?:all|print)\b/,v="html5shiv",y=!h&&function(){var i=t.documentElement;return"undefined"!=typeof t.namespaces&&"undefined"!=typeof t.parentWindow&&"undefined"!=typeof i.applyElement&&"undefined"!=typeof i.removeNode&&"undefined"!=typeof e.attachEvent}();m.type+=" print",m.shivPrint=u,u(t)}(this,document),function(e,t,i){function n(e){return"[object Function]"==g.call(e)}function s(e){return"string"==typeof e}function o(){}function r(e){return!e||"loaded"==e||"complete"==e||"uninitialized"==e}function a(){var e=v.shift();y=1,e?e.t?f(function(){("c"==e.t?h.injectCss:h.injectJs)(e.s,0,e.a,e.x,e.e,1)},0):(e(),a()):y=0}function l(e,i,n,s,o,l,c){function u(t){if(!p&&r(d.readyState)&&(_.r=p=1,!y&&a(),d.onload=d.onreadystatechange=null,t)){"img"!=e&&f(function(){w.removeChild(d)},50);for(var n in S[i])S[i].hasOwnProperty(n)&&S[i][n].onload()}}var c=c||h.errorTimeout,d={},p=0,g=0,_={t:n,s:i,e:o,a:l,x:c};1===S[i]&&(g=1,S[i]=[],d=t.createElement(e)),"object"==e?d.data=i:(d.src=i,d.type=e),d.width=d.height="0",d.onerror=d.onload=d.onreadystatechange=function(){u.call(this,g)},v.splice(s,0,_),"img"!=e&&(g||2===S[i]?(w.insertBefore(d,b?null:m),f(u,c)):S[i].push(d))}function c(e,t,i,n,o){return y=0,t=t||"j",s(e)?l("c"==t?C:x,e,t,this.i++,i,n,o):(v.splice(this.i++,0,e),1==v.length&&a()),this}function u(){var e=h;return e.loader={load:c,i:0},e}var d,h,p=t.documentElement,f=e.setTimeout,m=t.getElementsByTagName("script")[0],g={}.toString,v=[],y=0,_="MozAppearance"in p.style,b=_&&!!t.createRange().compareNode,w=b?p:m.parentNode,p=e.opera&&"[object Opera]"==g.call(e.opera),p=!!t.attachEvent&&!p,x=_?"object":p?"script":"img",C=p?"script":x,k=Array.isArray||function(e){return"[object Array]"==g.call(e)},T=[],S={},A={timeout:function(e,t){return t.length&&(e.timeout=t[0]),e}};h=function(e){function t(e){var t,i,n,e=e.split("!"),s=T.length,o=e.pop(),r=e.length,o={url:o,origUrl:o,prefixes:e};for(i=0;r>i;i++)n=e[i].split("="),(t=A[n.shift()])&&(o=t(o,n));for(i=0;s>i;i++)o=T[i](o);return o}function r(e,s,o,r,l){var c=t(e),d=c.autoCallback;c.url.split(".").pop().split("?").shift(),c.bypass||(s&&(s=n(s)?s:s[e]||s[r]||s[e.split("/").pop().split("?")[0]]||a),c.instead?c.instead(e,s,o,r,l):(S[c.url]?c.noexec=!0:S[c.url]=1,o.load(c.url,c.forceCSS||!c.forceJS&&"css"==c.url.split(".").pop().split("?").shift()?"c":i,c.noexec,c.attrs,c.timeout),(n(s)||n(d))&&o.load(function(){u(),s&&s(c.origUrl,l,r),d&&d(c.origUrl,l,r),S[c.url]=2})))}function l(e,t){function i(e,i){if(e){if(s(e))i||(d=function(){var e=[].slice.call(arguments);h.apply(this,e),p()}),r(e,d,t,0,c);else if(Object(e)===e)for(l in a=function(){var t,i=0;for(t in e)e.hasOwnProperty(t)&&i++;return i}(),e)e.hasOwnProperty(l)&&(!i&&!--a&&(n(d)?d=function(){var e=[].slice.call(arguments);h.apply(this,e),p()}:d[l]=function(e){return function(){var t=[].slice.call(arguments);e&&e.apply(this,t),p()}}(h[l])),r(e[l],d,t,l,c))}else!i&&p()}var a,l,c=!!e.test,u=e.load||e.both,d=e.callback||o,h=d,p=e.complete||o;i(c?e.yep:e.nope,!!u),u&&i(u)}var c,d,p=this.yepnope.loader;if(s(e))r(e,0,p,0);else if(k(e))for(c=0;c<e.length;c++)d=e[c],s(d)?r(d,0,p,0):k(d)?h(d):Object(d)===d&&l(d,p);else Object(e)===e&&l(e,p)},h.addPrefix=function(e,t){A[e]=t},h.addFilter=function(e){T.push(e)},h.errorTimeout=1e4,null==t.readyState&&t.addEventListener&&(t.readyState="loading",t.addEventListener("DOMContentLoaded",d=function(){t.removeEventListener("DOMContentLoaded",d,0),t.readyState="complete"},0)),e.yepnope=u(),e.yepnope.executeStack=a,e.yepnope.injectJs=function(e,i,n,s,l,c){var u,d,p=t.createElement("script"),s=s||h.errorTimeout;p.src=e;for(d in n)p.setAttribute(d,n[d]);i=c?a:i||o,p.onreadystatechange=p.onload=function(){!u&&r(p.readyState)&&(u=1,i(),p.onload=p.onreadystatechange=null)},f(function(){u||(u=1,i(1))},s),l?p.onload():m.parentNode.insertBefore(p,m)},e.yepnope.injectCss=function(e,i,n,s,r,l){var c,s=t.createElement("link"),i=l?a:i||o;s.href=e,s.rel="stylesheet",s.type="text/css";for(c in n)s.setAttribute(c,n[c]);r||(m.parentNode.insertBefore(s,m),f(i,0))}}(this,document),Modernizr.load=function(){yepnope.apply(window,[].slice.call(arguments,0))};