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
!function(t){t.fn.serializelist=function(e){var i,n,s,o,r={attributes:["id"],allow_nest:!0,prepend:"ul",att_regex:!1,is_child:!1},a=t.extend(r,e),l=a.attributes,c="",u=function(t,e){if(!a.att_regex)return e;for(n in a.att_regex)if(a.att_regex[n].att===t)return e.replace(a.att_regex[n].regex,"")};return a.is_child||(a.prepend="&"+a.prepend),this.each(function(e,n){t(n).children().each(function(n,r){if(a.allow_nest||l.length>1)for(s in l)i=u(l[s],t(r).attr(l[s])),c+=a.prepend+"["+e+"]["+n+"]["+l[s]+"]="+i;else i=u(l[0],t(r).attr(l[0])),c+=a.prepend+"["+e+"]["+n+"]="+i;a.allow_nest&&(o=a.prepend+"["+e+"]["+n+"][children]",t(r).children().each(function(){("UL"==this.tagName||"OL"==this.tagName)&&(c+=t(this).serializelist({prepend:o,is_child:!0}))})),n++})}),c}}(jQuery);