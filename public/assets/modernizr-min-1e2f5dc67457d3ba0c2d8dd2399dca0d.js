window.Modernizr=function(t,e,i){function s(t){b.cssText=t}function n(t,e){return s(k.join(t+";")+(e||""))}function o(t,e){return typeof t===e}function a(t,e){return!!~(""+t).indexOf(e)}function r(t,e){for(var s in t)if(b[t[s]]!==i)return"pfx"==e?t[s]:!0;return!1}function l(t,e,s){for(var n in t){var a=e[t[n]];if(a!==i)return s===!1?t[n]:o(a,"function")?a.bind(s||e):a}return!1}function h(t,e,i){var s=t.charAt(0).toUpperCase()+t.substr(1),n=(t+" "+T.join(s+" ")+s).split(" ");return o(e,"string")||o(e,"undefined")?r(n,e):(n=(t+" "+S.join(s+" ")+s).split(" "),l(n,e,i))}function c(){f.input=function(i){for(var s=0,n=i.length;n>s;s++)P[i[s]]=i[s]in y;return P.list&&(P.list=!!e.createElement("datalist")&&!!t.HTMLDataListElement),P}("autocomplete autofocus list placeholder max min multiple pattern required step".split(" ")),f.inputtypes=function(t){for(var s,n,o,a=0,r=t.length;r>a;a++)y.setAttribute("type",n=t[a]),s="text"!==y.type,s&&(y.value=w,y.style.cssText="position:absolute;visibility:hidden;",/^range$/.test(n)&&y.style.WebkitAppearance!==i?(g.appendChild(y),o=e.defaultView,s=o.getComputedStyle&&"textfield"!==o.getComputedStyle(y,null).WebkitAppearance&&0!==y.offsetHeight,g.removeChild(y)):/^(search|tel)$/.test(n)||(/^(url|email)$/.test(n)?s=y.checkValidity&&y.checkValidity()===!1:/^color$/.test(n)?(g.appendChild(y),g.offsetWidth,s=y.value!=w,g.removeChild(y)):s=y.value!=w)),I[t[a]]=!!s;return I}("search tel url email datetime date month week time datetime-local number range color".split(" "))}var u,d,p="2.5.3",f={},m=!0,g=e.documentElement,v="modernizr",_=e.createElement(v),b=_.style,y=e.createElement("input"),w=":)",x={}.toString,k=" -webkit- -moz- -o- -ms- ".split(" "),C="Webkit Moz O ms",T=C.split(" "),S=C.toLowerCase().split(" "),D={svg:"http://www.w3.org/2000/svg"},M={},I={},P={},E=[],N=E.slice,A=function(t,i,s,n){var o,a,r,l=e.createElement("div"),h=e.body,c=h?h:e.createElement("body");if(parseInt(s,10))for(;s--;)r=e.createElement("div"),r.id=n?n[s]:v+(s+1),l.appendChild(r);return o=["&#173;","<style>",t,"</style>"].join(""),l.id=v,c.innerHTML+=o,c.appendChild(l),h||(c.style.background="",g.appendChild(c)),a=i(l,t),h?l.parentNode.removeChild(l):c.parentNode.removeChild(c),!!a},W=function(){function t(t,n){n=n||e.createElement(s[t]||"div"),t="on"+t;var a=t in n;return a||(n.setAttribute||(n=e.createElement("div")),n.setAttribute&&n.removeAttribute&&(n.setAttribute(t,""),a=o(n[t],"function"),o(n[t],"undefined")||(n[t]=i),n.removeAttribute(t))),n=null,a}var s={select:"input",change:"input",submit:"form",reset:"form",error:"img",load:"img",abort:"img"};return t}(),H={}.hasOwnProperty;d=o(H,"undefined")||o(H.call,"undefined")?function(t,e){return e in t&&o(t.constructor.prototype[e],"undefined")}:function(t,e){return H.call(t,e)},Function.prototype.bind||(Function.prototype.bind=function(t){var e=this;if("function"!=typeof e)throw new TypeError;var i=N.call(arguments,1),s=function(){if(this instanceof s){var n=function(){};n.prototype=e.prototype;var o=new n,a=e.apply(o,i.concat(N.call(arguments)));return Object(a)===a?a:o}return e.apply(t,i.concat(N.call(arguments)))};return s});!function(i,s){var n=i.join(""),o=s.length;A(n,function(i,s){for(var n=e.styleSheets[e.styleSheets.length-1],a=n?n.cssRules&&n.cssRules[0]?n.cssRules[0].cssText:n.cssText||"":"",r=i.childNodes,l={};o--;)l[r[o].id]=r[o];f.touch="ontouchstart"in t||t.DocumentTouch&&e instanceof DocumentTouch||9===(l.touch&&l.touch.offsetTop),f.csstransforms3d=9===(l.csstransforms3d&&l.csstransforms3d.offsetLeft)&&3===l.csstransforms3d.offsetHeight,f.generatedcontent=(l.generatedcontent&&l.generatedcontent.offsetHeight)>=1,f.fontface=/src/i.test(a)&&0===a.indexOf(s.split(" ")[0])},o,s)}(['@font-face {font-family:"font";src:url("https://")}',["@media (",k.join("touch-enabled),("),v,")","{#touch{top:9px;position:absolute}}"].join(""),["@media (",k.join("transform-3d),("),v,")","{#csstransforms3d{left:9px;position:absolute;height:3px;}}"].join(""),['#generatedcontent:after{content:"',w,'";visibility:hidden}'].join("")],["fontface","touch","csstransforms3d","generatedcontent"]);M.flexbox=function(){return h("flexOrder")},M.canvas=function(){var t=e.createElement("canvas");return!!t.getContext&&!!t.getContext("2d")},M.canvastext=function(){return!!f.canvas&&!!o(e.createElement("canvas").getContext("2d").fillText,"function")},M.webgl=function(){try{var s,n=e.createElement("canvas");s=!(!t.WebGLRenderingContext||!n.getContext("experimental-webgl")&&!n.getContext("webgl")),n=i}catch(o){s=!1}return s},M.touch=function(){return f.touch},M.geolocation=function(){return!!navigator.geolocation},M.postmessage=function(){return!!t.postMessage},M.websqldatabase=function(){return!!t.openDatabase},M.indexedDB=function(){return!!h("indexedDB",t)},M.hashchange=function(){return W("hashchange",t)&&(e.documentMode===i||e.documentMode>7)},M.history=function(){return!!t.history&&!!history.pushState},M.draganddrop=function(){var t=e.createElement("div");return"draggable"in t||"ondragstart"in t&&"ondrop"in t},M.websockets=function(){for(var e=-1,i=T.length;++e<i;)if(t[T[e]+"WebSocket"])return!0;return"WebSocket"in t},M.rgba=function(){return s("background-color:rgba(150,255,150,.5)"),a(b.backgroundColor,"rgba")},M.hsla=function(){return s("background-color:hsla(120,40%,100%,.5)"),a(b.backgroundColor,"rgba")||a(b.backgroundColor,"hsla")},M.multiplebgs=function(){return s("background:url(https://),url(https://),red url(https://)"),/(url\s*\(.*?){3}/.test(b.background)},M.backgroundsize=function(){return h("backgroundSize")},M.borderimage=function(){return h("borderImage")},M.borderradius=function(){return h("borderRadius")},M.boxshadow=function(){return h("boxShadow")},M.textshadow=function(){return""===e.createElement("div").style.textShadow},M.opacity=function(){return n("opacity:.55"),/^0.55$/.test(b.opacity)},M.cssanimations=function(){return h("animationName")},M.csscolumns=function(){return h("columnCount")},M.cssgradients=function(){var t="background-image:",e="gradient(linear,left top,right bottom,from(#9f9),to(white));",i="linear-gradient(left top,#9f9, white);";return s((t+"-webkit- ".split(" ").join(e+t)+k.join(i+t)).slice(0,-t.length)),a(b.backgroundImage,"gradient")},M.cssreflections=function(){return h("boxReflect")},M.csstransforms=function(){return!!h("transform")},M.csstransforms3d=function(){var t=!!h("perspective");return t&&"webkitPerspective"in g.style&&(t=f.csstransforms3d),t},M.csstransitions=function(){return h("transition")},M.fontface=function(){return f.fontface},M.generatedcontent=function(){return f.generatedcontent},M.video=function(){var t=e.createElement("video"),i=!1;try{(i=!!t.canPlayType)&&(i=new Boolean(i),i.ogg=t.canPlayType('video/ogg; codecs="theora"').replace(/^no$/,""),i.h264=t.canPlayType('video/mp4; codecs="avc1.42E01E"').replace(/^no$/,""),i.webm=t.canPlayType('video/webm; codecs="vp8, vorbis"').replace(/^no$/,""))}catch(s){}return i},M.audio=function(){var t=e.createElement("audio"),i=!1;try{(i=!!t.canPlayType)&&(i=new Boolean(i),i.ogg=t.canPlayType('audio/ogg; codecs="vorbis"').replace(/^no$/,""),i.mp3=t.canPlayType("audio/mpeg;").replace(/^no$/,""),i.wav=t.canPlayType('audio/wav; codecs="1"').replace(/^no$/,""),i.m4a=(t.canPlayType("audio/x-m4a;")||t.canPlayType("audio/aac;")).replace(/^no$/,""))}catch(s){}return i},M.localstorage=function(){try{return localStorage.setItem(v,v),localStorage.removeItem(v),!0}catch(t){return!1}},M.sessionstorage=function(){try{return sessionStorage.setItem(v,v),sessionStorage.removeItem(v),!0}catch(t){return!1}},M.webworkers=function(){return!!t.Worker},M.applicationcache=function(){return!!t.applicationCache},M.svg=function(){return!!e.createElementNS&&!!e.createElementNS(D.svg,"svg").createSVGRect},M.inlinesvg=function(){var t=e.createElement("div");return t.innerHTML="<svg/>",(t.firstChild&&t.firstChild.namespaceURI)==D.svg},M.smil=function(){return!!e.createElementNS&&/SVGAnimate/.test(x.call(e.createElementNS(D.svg,"animate")))},M.svgclippaths=function(){return!!e.createElementNS&&/SVGClipPath/.test(x.call(e.createElementNS(D.svg,"clipPath")))};for(var $ in M)d(M,$)&&(u=$.toLowerCase(),f[u]=M[$](),E.push((f[u]?"":"no-")+u));return f.input||c(),s(""),_=y=null,f._version=p,f._prefixes=k,f._domPrefixes=S,f._cssomPrefixes=T,f.hasEvent=W,f.testProp=function(t){return r([t])},f.testAllProps=h,f.testStyles=A,g.className=g.className.replace(/(^|\s)no-js(\s|$)/,"$1$2")+(m?" js "+E.join(" "):""),f}(this,this.document),function(t,e){function i(t,e){var i=t.createElement("p"),s=t.getElementsByTagName("head")[0]||t.documentElement;return i.innerHTML="x<style>"+e+"</style>",s.insertBefore(i.lastChild,s.firstChild)}function s(){var t=m.elements;return"string"==typeof t?t.split(" "):t}function n(t){var e={},i=t.createElement,n=t.createDocumentFragment,o=n();t.createElement=function(t){var s=(e[t]||(e[t]=i(t))).cloneNode();return m.shivMethods&&s.canHaveChildren&&!f.test(t)?o.appendChild(s):s},t.createDocumentFragment=Function("h,f","return function(){var n=f.cloneNode(),c=n.createElement;h.shivMethods&&("+s().join().replace(/\w+/g,function(t){return e[t]=i(t),o.createElement(t),'c("'+t+'")'})+");return n}")(m,o)}function o(t){var e;return t.documentShived?t:(m.shivCSS&&!u&&(e=!!i(t,"article,aside,details,figcaption,figure,footer,header,hgroup,nav,section{display:block}audio{display:none}canvas,video{display:inline-block;*display:inline;*zoom:1}[hidden]{display:none}audio[controls]{display:inline-block;*display:inline;*zoom:1}mark{background:#FF0;color:#000}")),d||(e=!n(t)),e&&(t.documentShived=e),t)}function a(t){for(var e,i=t.getElementsByTagName("*"),n=i.length,o=RegExp("^(?:"+s().join("|")+")$","i"),a=[];n--;)e=i[n],o.test(e.nodeName)&&a.push(e.applyElement(r(e)));return a}function r(t){for(var e,i=t.attributes,s=i.length,n=t.ownerDocument.createElement(v+":"+t.nodeName);s--;)e=i[s],e.specified&&n.setAttribute(e.nodeName,e.nodeValue);return n.style.cssText=t.style.cssText,n}function l(t){for(var e,i=t.split("{"),n=i.length,o=RegExp("(^|[\\s,>+~])("+s().join("|")+")(?=[[\\s,>+~#.:]|$)","gi"),a="$1"+v+"\\:$2";n--;)e=i[n]=i[n].split("}"),e[e.length-1]=e[e.length-1].replace(o,a),i[n]=e.join("}");return i.join("{")}function h(t){for(var e=t.length;e--;)t[e].removeNode()}function c(t){var e,s,n=t.namespaces,o=t.parentWindow;return!_||t.printShived?t:("undefined"==typeof n[v]&&n.add(v),o.attachEvent("onbeforeprint",function(){for(var n,o,r,h=t.styleSheets,c=[],u=h.length,d=Array(u);u--;)d[u]=h[u];for(;r=d.pop();)if(!r.disabled&&g.test(r.media)){for(n=r.imports,u=0,o=n.length;o>u;u++)d.push(n[u]);try{c.push(r.cssText)}catch(p){}}c=l(c.reverse().join("")),s=a(t),e=i(t,c)}),o.attachEvent("onafterprint",function(){h(s),e.removeNode(!0)}),t.printShived=!0,t)}var u,d,p=t.html5||{},f=/^<|^(?:button|form|map|select|textarea)$/i;!function(){var t=e.createElement("a");t.innerHTML="<xyz></xyz>",u="hidden"in t,d=1==t.childNodes.length||function(){try{e.createElement("a")}catch(t){return!0}var i=e.createDocumentFragment();return"undefined"==typeof i.cloneNode||"undefined"==typeof i.createDocumentFragment||"undefined"==typeof i.createElement}()}();var m={elements:p.elements||"abbr article aside audio bdi canvas data datalist details figcaption figure footer header hgroup mark meter nav output progress section summary time video",shivCSS:p.shivCSS!==!1,shivMethods:p.shivMethods!==!1,type:"default",shivDocument:o};t.html5=m,o(e);var g=/^$|\b(?:all|print)\b/,v="html5shiv",_=!d&&function(){var i=e.documentElement;return"undefined"!=typeof e.namespaces&&"undefined"!=typeof e.parentWindow&&"undefined"!=typeof i.applyElement&&"undefined"!=typeof i.removeNode&&"undefined"!=typeof t.attachEvent}();m.type+=" print",m.shivPrint=c,c(e)}(this,document),function(t,e,i){function s(t){return"[object Function]"==g.call(t)}function n(t){return"string"==typeof t}function o(){}function a(t){return!t||"loaded"==t||"complete"==t||"uninitialized"==t}function r(){var t=v.shift();_=1,t?t.t?f(function(){("c"==t.t?d.injectCss:d.injectJs)(t.s,0,t.a,t.x,t.e,1)},0):(t(),r()):_=0}function l(t,i,s,n,o,l,h){function c(e){if(!p&&a(u.readyState)&&(b.r=p=1,!_&&r(),u.onload=u.onreadystatechange=null,e)){"img"!=t&&f(function(){w.removeChild(u)},50);for(var s in S[i])S[i].hasOwnProperty(s)&&S[i][s].onload()}}var h=h||d.errorTimeout,u={},p=0,g=0,b={t:s,s:i,e:o,a:l,x:h};1===S[i]&&(g=1,S[i]=[],u=e.createElement(t)),"object"==t?u.data=i:(u.src=i,u.type=t),u.width=u.height="0",u.onerror=u.onload=u.onreadystatechange=function(){c.call(this,g)},v.splice(n,0,b),"img"!=t&&(g||2===S[i]?(w.insertBefore(u,y?null:m),f(c,h)):S[i].push(u))}function h(t,e,i,s,o){return _=0,e=e||"j",n(t)?l("c"==e?k:x,t,e,this.i++,i,s,o):(v.splice(this.i++,0,t),1==v.length&&r()),this}function c(){var t=d;return t.loader={load:h,i:0},t}var u,d,p=e.documentElement,f=t.setTimeout,m=e.getElementsByTagName("script")[0],g={}.toString,v=[],_=0,b="MozAppearance"in p.style,y=b&&!!e.createRange().compareNode,w=y?p:m.parentNode,p=t.opera&&"[object Opera]"==g.call(t.opera),p=!!e.attachEvent&&!p,x=b?"object":p?"script":"img",k=p?"script":x,C=Array.isArray||function(t){return"[object Array]"==g.call(t)},T=[],S={},D={timeout:function(t,e){return e.length&&(t.timeout=e[0]),t}};d=function(t){function e(t){var e,i,s,t=t.split("!"),n=T.length,o=t.pop(),a=t.length,o={url:o,origUrl:o,prefixes:t};for(i=0;a>i;i++)s=t[i].split("="),(e=D[s.shift()])&&(o=e(o,s));for(i=0;n>i;i++)o=T[i](o);return o}function a(t,n,o,a,l){var h=e(t),u=h.autoCallback;h.url.split(".").pop().split("?").shift(),h.bypass||(n&&(n=s(n)?n:n[t]||n[a]||n[t.split("/").pop().split("?")[0]]||r),h.instead?h.instead(t,n,o,a,l):(S[h.url]?h.noexec=!0:S[h.url]=1,o.load(h.url,h.forceCSS||!h.forceJS&&"css"==h.url.split(".").pop().split("?").shift()?"c":i,h.noexec,h.attrs,h.timeout),(s(n)||s(u))&&o.load(function(){c(),n&&n(h.origUrl,l,a),u&&u(h.origUrl,l,a),S[h.url]=2})))}function l(t,e){function i(t,i){if(t){if(n(t))i||(u=function(){var t=[].slice.call(arguments);d.apply(this,t),p()}),a(t,u,e,0,h);else if(Object(t)===t)for(l in r=function(){var e,i=0;for(e in t)t.hasOwnProperty(e)&&i++;return i}(),t)t.hasOwnProperty(l)&&(!i&&!--r&&(s(u)?u=function(){var t=[].slice.call(arguments);d.apply(this,t),p()}:u[l]=function(t){return function(){var e=[].slice.call(arguments);t&&t.apply(this,e),p()}}(d[l])),a(t[l],u,e,l,h))}else!i&&p()}var r,l,h=!!t.test,c=t.load||t.both,u=t.callback||o,d=u,p=t.complete||o;i(h?t.yep:t.nope,!!c),c&&i(c)}var h,u,p=this.yepnope.loader;if(n(t))a(t,0,p,0);else if(C(t))for(h=0;h<t.length;h++)u=t[h],n(u)?a(u,0,p,0):C(u)?d(u):Object(u)===u&&l(u,p);else Object(t)===t&&l(t,p)},d.addPrefix=function(t,e){D[t]=e},d.addFilter=function(t){T.push(t)},d.errorTimeout=1e4,null==e.readyState&&e.addEventListener&&(e.readyState="loading",e.addEventListener("DOMContentLoaded",u=function(){e.removeEventListener("DOMContentLoaded",u,0),e.readyState="complete"},0)),t.yepnope=c(),t.yepnope.executeStack=r,t.yepnope.injectJs=function(t,i,s,n,l,h){var c,u,p=e.createElement("script"),n=n||d.errorTimeout;p.src=t;for(u in s)p.setAttribute(u,s[u]);i=h?r:i||o,p.onreadystatechange=p.onload=function(){!c&&a(p.readyState)&&(c=1,i(),p.onload=p.onreadystatechange=null)},f(function(){c||(c=1,i(1))},n),l?p.onload():m.parentNode.insertBefore(p,m)},t.yepnope.injectCss=function(t,i,s,n,a,l){var h,n=e.createElement("link"),i=l?r:i||o;n.href=t,n.rel="stylesheet",n.type="text/css";for(h in s)n.setAttribute(h,s[h]);a||(m.parentNode.insertBefore(n,m),f(i,0))}}(this,document),Modernizr.load=function(){yepnope.apply(window,[].slice.call(arguments,0))};