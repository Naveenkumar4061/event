$(function(){$(".tree").on("click",".toggle",function(t){t.preventDefault();var e=$(this).parents("li:first"),i=e.find(".icon.toggle"),s=e.find(".nested");if(i.hasClass("expanded"))i.removeClass("expanded"),s.slideUp();else{var n=s.data("ajax-content");e.addClass("loading"),s.load(n,function(){s.find("li:last").addClass("branch_end"),i.addClass("expanded"),init_tooltips(),s.slideDown(),e.removeClass("loading")})}})});