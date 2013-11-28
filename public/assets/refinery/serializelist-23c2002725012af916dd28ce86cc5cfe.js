/**
 * jQuery Serialize List
 * Copyright (c) 2009 Mike Botsko, Botsko.net LLC
 * Licensed under the MIT (http://www.opensource.org/licenses/mit-license.php)
 * Copyright notice and license must remain intact for legal use
 * Version .2
 *
 * Serialize an unordered or ordered list item. Optional ability
 * to determine which attributes are included. The serialization
 * will be read by PHP as a multidimensional array which you may
 * use for saving state.
 *
 * http://github.com/botskonet/jquery.serialize-list
 */
!function(t){t.fn.serializelist=function(e){var i,n,s,o,a={attributes:["id"],allow_nest:!0,prepend:"ul",att_regex:!1,is_child:!1},r=t.extend(a,e),l=r.attributes,h="",c=function(t,e){if(!r.att_regex)return e;for(n in r.att_regex)if(r.att_regex[n].att===t)return e.replace(r.att_regex[n].regex,"")};return r.is_child||(r.prepend="&"+r.prepend),this.each(function(e,n){t(n).children().each(function(n,a){if(r.allow_nest||l.length>1)for(s in l)i=c(l[s],t(a).attr(l[s])),h+=r.prepend+"["+e+"]["+n+"]["+l[s]+"]="+i;else i=c(l[0],t(a).attr(l[0])),h+=r.prepend+"["+e+"]["+n+"]="+i;r.allow_nest&&(o=r.prepend+"["+e+"]["+n+"][children]",t(a).children().each(function(){("UL"==this.tagName||"OL"==this.tagName)&&(h+=t(this).serializelist({prepend:o,is_child:!0}))})),n++})}),h}}(jQuery);