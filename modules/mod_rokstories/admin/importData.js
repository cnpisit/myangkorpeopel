var RID={path:"",init:function(){RID.path=window.RokStoriesAdminPath+"&import=true";RID.wrapper=document.id("rokstories-admin-wrapper");RID.container=RID.wrapper.getFirst();
RID.button=RID.wrapper.getElement("button");RID.events().xhr();},events:function(){RID.button.addEvent("click",function(a){a.stop();this.set("disabled","disabled").addClass("disabled");
RID.wrapper.addClass("loading");RID.wrapper.focus();RID.ajax.send();});return RID;},xhr:function(){RID.ajax=new Request({url:RID.path,method:"get",onComplete:function(g){var f=g.trim().match(/success.(\d+)/i);
var e=g.trim().match(/please.confirm$/i);RID.ajax.options.url=RID.ajax.options.url.replace("&duplicate=true","");if(f){f=f.splice(1);RID.populate(f);RID.wrapper.removeClass("loading").addClass("success");
}else{if(e){var i="Sample Data appears to be already been imported previously. By continuing you're going to duplicate the content.\nDo you want to Continue?";
var h=window.confirm(i);if(h){RID.ajax.cancel();RID.ajax.options.url+="&duplicate=true";RID.ajax.send();}else{RID.wrapper.removeClass("loading");RID.button.removeProperty("disabled").removeClass("disabled");
}}else{RID.wrapper.removeClass("loading").addClass("warning");new Element("p").set("html","<strong>ERROR:</strong> "+g).inject(RID.button,"after");}}}});
},populate:function(e){var d=e[0];category=document.id("jform_params_catid");var f=category.getChildren().length;new Element("option",{value:d}).set("text","RokStories Samples").inject(category);
category.selectedIndex=f;}};window.addEvent("domready",RID.init);