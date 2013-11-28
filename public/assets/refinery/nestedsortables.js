/*
 * jQuery UI Nested Sortable
 * v 1.3.4 / 28 apr 2011
 * http://mjsarfatti.com/sandbox/nestedSortable
 *
 * Depends:
 *	 jquery.ui.sortable.js 1.8+
 *
 * License CC BY-SA 3.0
 * Copyright 2010-2011, Manuele J Sarfatti
 */
!function(t){t.widget("ui.nestedSortable",t.extend({},t.ui.sortable.prototype,{options:{tabSize:20,disableNesting:"ui-nestedSortable-no-nesting",errorClass:"ui-nestedSortable-error",listType:"ol",maxLevels:0,noJumpFix:0},_create:function(){return 0==this.noJumpFix&&this.element.height(this.element.height()),this.element.data("sortable",this.element.data("nestedSortable")),t.ui.sortable.prototype._create.apply(this,arguments)},_mouseDrag:function(e){if(this.position=this._generatePosition(e),this.positionAbs=this._convertPositionTo("absolute"),this.lastPositionAbs||(this.lastPositionAbs=this.positionAbs),this.options.scroll){var i=this.options,n=!1;this.scrollParent[0]!=document&&"HTML"!=this.scrollParent[0].tagName?(this.overflowOffset.top+this.scrollParent[0].offsetHeight-e.pageY<i.scrollSensitivity?this.scrollParent[0].scrollTop=n=this.scrollParent[0].scrollTop+i.scrollSpeed:e.pageY-this.overflowOffset.top<i.scrollSensitivity&&(this.scrollParent[0].scrollTop=n=this.scrollParent[0].scrollTop-i.scrollSpeed),this.overflowOffset.left+this.scrollParent[0].offsetWidth-e.pageX<i.scrollSensitivity?this.scrollParent[0].scrollLeft=n=this.scrollParent[0].scrollLeft+i.scrollSpeed:e.pageX-this.overflowOffset.left<i.scrollSensitivity&&(this.scrollParent[0].scrollLeft=n=this.scrollParent[0].scrollLeft-i.scrollSpeed)):(e.pageY-t(document).scrollTop()<i.scrollSensitivity?n=t(document).scrollTop(t(document).scrollTop()-i.scrollSpeed):t(window).height()-(e.pageY-t(document).scrollTop())<i.scrollSensitivity&&(n=t(document).scrollTop(t(document).scrollTop()+i.scrollSpeed)),e.pageX-t(document).scrollLeft()<i.scrollSensitivity?n=t(document).scrollLeft(t(document).scrollLeft()-i.scrollSpeed):t(window).width()-(e.pageX-t(document).scrollLeft())<i.scrollSensitivity&&(n=t(document).scrollLeft(t(document).scrollLeft()+i.scrollSpeed))),n!==!1&&t.ui.ddmanager&&!i.dropBehaviour&&t.ui.ddmanager.prepareOffsets(this,e)}this.positionAbs=this._convertPositionTo("absolute"),this.options.axis&&"y"==this.options.axis||(this.helper[0].style.left=this.position.left+"px"),this.options.axis&&"x"==this.options.axis||(this.helper[0].style.top=this.position.top+"px");for(var s=this.items.length-1;s>=0;s--){var o=this.items[s],r=o.item[0],a=this._intersectsWithPointer(o);if(a&&r!=this.currentItem[0]&&this.placeholder[1==a?"next":"prev"]()[0]!=r&&!t.contains(this.placeholder[0],r)&&("semi-dynamic"==this.options.type?!t.contains(this.element[0],r):!0)){if(this.direction=1==a?"down":"up","pointer"!=this.options.tolerance&&!this._intersectsWithSides(o))break;this._rearrange(e,o),this._clearEmpty(r),this._trigger("change",e,this._uiHash());break}}var l=this.placeholder[0].parentNode.parentNode&&t(this.placeholder[0].parentNode.parentNode).closest(".ui-sortable").length?t(this.placeholder[0].parentNode.parentNode):null,c=this._getLevel(this.placeholder),u=this._getChildLevels(this.helper),h=this.placeholder[0].previousSibling?t(this.placeholder[0].previousSibling):null;if(null!=h)for(;"li"!=h[0].nodeName.toLowerCase()||h[0]==this.currentItem[0];){if(!h[0].previousSibling){h=null;break}h=t(h[0].previousSibling)}return newList=document.createElement(i.listType),this.beyondMaxLevels=0,null!=l&&this.positionAbs.left<l.offset().left?(l.after(this.placeholder[0]),this._clearEmpty(l[0]),this._trigger("change",e,this._uiHash())):null!=h&&this.positionAbs.left>h.offset().left+i.tabSize?(this._isAllowed(h,c+u+1),h.children(i.listType).length||h[0].appendChild(newList),h.children(i.listType)[0].appendChild(this.placeholder[0]),this._trigger("change",e,this._uiHash())):this._isAllowed(l,c+u),this._contactContainers(e),t.ui.ddmanager&&t.ui.ddmanager.drag(this,e),this._trigger("sort",e,this._uiHash()),this.lastPositionAbs=this.positionAbs,!1},_mouseStop:function(e){if(this.beyondMaxLevels){for(var i=this.placeholder.parent().closest(this.options.items),n=this.beyondMaxLevels-1;n>0;n--)i=i.parent().closest(this.options.items);this.placeholder.removeClass(this.options.errorClass),i.after(this.placeholder),this._trigger("change",e,this._uiHash())}t.ui.sortable.prototype._mouseStop.apply(this,arguments)},serialize:function(e){var i=this._getItemsAsjQuery(e&&e.connected),n=[];return e=e||{},t(i).each(function(){var i=(t(e.item||this).attr(e.attribute||"id")||"").match(e.expression||/(.+)[-=_](.+)/),s=(t(e.item||this).parent(e.listType).parent("li").attr(e.attribute||"id")||"").match(e.expression||/(.+)[-=_](.+)/);i&&n.push((e.key||i[1]+"["+(e.key&&e.expression?i[1]:i[2])+"]")+"="+(s?e.key&&e.expression?s[1]:s[2]:"root"))}),!n.length&&e.key&&n.push(e.key+"="),n.join("&")},toHierarchy:function(e){function i(n){var s=(t(n).attr(e.attribute||"id")||"").match(e.expression||/(.+)[-=_](.+)/);if(null!=s){var o={id:s[2]};return t(n).children(e.listType).children("li").length>0&&(o.children=[],t(n).children(e.listType).children("li").each(function(){var e=i(t(this));o.children.push(e)})),o}}e=e||{};var n=(e.startDepthCount||0,[]);return t(this.element).children("li").each(function(){var e=i(t(this));n.push(e)}),n},toArray:function(e){function i(t,e){return t.left-e.left}function n(i,r,a){return right=a+1,t(i).children(e.listType).children("li").length>0&&(r++,t(i).children(e.listType).children("li").each(function(){right=n(t(this),r,right)}),r--),id=t(i).attr(e.attribute||"id").match(e.expression||/(.+)[-=_](.+)/),r===s+1?pid="root":(parentItem=t(i).parent(e.listType).parent("li").attr("id").match(e.expression||/(.+)[-=_](.+)/),pid=parentItem[2]),null!=id&&o.push({item_id:id[2],parent_id:pid,depth:r,left:a,right:right}),a=right+1}e=e||{};var s=e.startDepthCount||0,o=[],r=2;return o.push({item_id:"root",parent_id:"none",depth:s,left:"1",right:2*(t("li",this.element).length+1)}),t(this.element).children("li").each(function(){r=n(this,s+1,r)}),o=o.sort(i)},_clear:function(){t.ui.sortable.prototype._clear.apply(this,arguments);for(var e=this.items.length-1;e>=0;e--){var i=this.items[e].item[0];this._clearEmpty(i)}return!0},_clearEmpty:function(t){t.children[1]&&0==t.children[1].children.length&&t.removeChild(t.children[1])},_getLevel:function(t){var e=1;if(this.options.listType)for(var i=t.closest(this.options.listType);!i.is(".ui-sortable");)e++,i=i.parent().closest(this.options.listType);return e},_getChildLevels:function(e,i){var n=this,s=this.options,o=0;return i=i||0,t(e).children(s.listType).children(s.items).each(function(t,e){o=Math.max(n._getChildLevels(e,i+1),o)}),i?o+1:o},_isAllowed:function(t,e){var i=this.options;null!=t&&t.hasClass(i.disableNesting)?(this.placeholder.addClass(i.errorClass),this.beyondMaxLevels=i.maxLevels<e&&0!=i.maxLevels?e-i.maxLevels:1):i.maxLevels<e&&0!=i.maxLevels?(this.placeholder.addClass(i.errorClass),this.beyondMaxLevels=e-i.maxLevels):(this.placeholder.removeClass(i.errorClass),this.beyondMaxLevels=0)}})),t.ui.nestedSortable.prototype.options=t.extend({},t.ui.sortable.prototype.options,t.ui.nestedSortable.prototype.options)}(jQuery);