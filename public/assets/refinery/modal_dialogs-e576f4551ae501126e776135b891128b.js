init_modal_dialogs=function(){$('a[href*="dialog=true"]').not("#dialog_container a").each(function(t,e){$(e).data({"dialog-width":parseInt($($(e).attr("href").match("width=([0-9]*)")).last().get(0),10)||928,"dialog-height":parseInt($($(e).attr("href").match("height=([0-9]*)")).last().get(0),10)||473,"dialog-title":$(e).attr("title")||$(e).attr("name")||$(e).html()||null}).attr("href",$(e).attr("href").replace(/(&(amp;)?|\?)(dialog=true|(width|height)=\d+)/g,"").replace(/(\/[^&\?]*)&(amp;)?/,"$1?")).click(function(t){$anchor=$(this),iframe_src=(iframe_src=$anchor.attr("href"))+(iframe_src.indexOf("?")>-1?"&":"?")+"app_dialog=true&dialog=true",iframe=$("<iframe id='dialog_iframe' frameborder='0' marginheight='0' marginwidth='0' border='0'></iframe>"),iframe.dialog({title:$anchor.data("dialog-title"),modal:!0,resizable:!1,autoOpen:!0,width:$anchor.data("dialog-width"),height:$anchor.data("dialog-height"),open:onOpenDialog,close:onCloseDialog}),iframe.attr("src",iframe_src),t.preventDefault()})})},init_sortable_menu=function(){var t=$("#menu");0!==t.length&&(t.sortable({axis:"x",cursor:"crosshair",connectWith:".nested",update:function(){$.post("/refinery/update_menu_positions",t.sortable("serialize",{key:"menu[]",expression:/plugin_([\w]*)$/}))}}).tabs(),t.sortable("disable"),t.find("#menu_reorder").click(function(t){trigger_reordering(t,!0)}),t.find("#menu_reorder_done").click(function(t){trigger_reordering(t,!1)}))},trigger_reordering=function(t,e){t.preventDefault(),$("#menu_reorder, #menu_reorder_done").toggle(),$("#site_bar, #content").fadeTo(500,e?.35:1),e?$menu.find(".tab a").click(function(t){t.preventDefault()}):$menu.find(".tab a").unbind("click"),$menu.sortable(e?"enable":"disable")},init_submit_continue=function(){$("#submit_continue_button").click(submit_and_continue),$("form").change(function(){$(this).attr("data-changes-made",!0)}),(continue_editing_button=$("#continue_editing")).length>0&&"no-prompt"!=continue_editing_button.attr("rel")&&$("#editor_switch a").click(function(t){$("form[data-changes-made]").length>0&&(confirm("translation missing: en.js.admin.confirm_changes")||t.preventDefault())})},submit_and_continue=function(t,e){$(this).hasClass("wymupdate")&&$.each(WYMeditor.INSTANCES,function(t,e){e.update()}),$("#continue_editing").val(!0),$("#flash").fadeOut(250),$(".fieldWithErrors").removeClass("fieldWithErrors").addClass("field"),$("#flash_container .errorExplanation").remove(),$.post($("#continue_editing").get(0).form.action,$($("#continue_editing").get(0).form).serialize(),function(t){($flash_container=$("#flash_container")).length>0&&($flash_container.html(t),$("#flash").css({width:"auto",visibility:null}).fadeIn(550),$(".errorExplanation").not($("#flash_container .errorExplanation")).remove(),null!=(error_fields=$("#fieldsWithErrors").val())?$.each(error_fields.split(","),function(){$("#"+this).wrap("<div class='fieldWithErrors' />")}):e&&(window.location=e),$(".fieldWithErrors:first :input:first").focus(),$("#continue_editing").val(!1),init_flash_messages())}),t.preventDefault()};