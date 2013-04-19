var RokSlider=new Class({options:{onTick:function(b){if(this.options.snap){b=this.toPosition(this.step);}if(isNaN(b)){b=this.options.offset;}this.knob.setStyle(this.property,b);
},snap:false,offset:0,range:false,wheel:false,steps:100,mode:"horizontal"},initialize:function(g,e,j){this.setOptions(j);this.element=document.id(g);this.knob=document.id(e);
this.previousChange=this.previousEnd=this.step=-1;if(this.options.initialize){this.options.initialize.call(this);}this.element.addEvent("mousedown",this.clickedElement.bind(this));
if(this.options.wheel){this.element.addEvent("mousewheel",this.scrolledElement.bindWithEvent(this));}var i,f={},h={x:false,y:false};switch(this.options.mode){case"vertical":this.axis="y";
this.property="top";i="offsetHeight";break;case"horizontal":this.axis="x";this.property="left";i="offsetWidth";}this.half=this.knob[i]/2;this.full=this.element[i]-this.knob[i]+(this.options.offset*2);
this.min=(this.options.range[0]!=null)?this.options.range[0]:0;this.max=(this.options.range[1]!=null)?this.options.range[1]:this.options.steps;this.range=this.max-this.min;
this.steps=this.options.steps||this.full;this.stepSize=Math.abs(this.range)/this.steps;this.stepWidth=Number((this.stepSize*this.full/Math.abs(this.range)).toFixed(4));
if(isNaN(this.stepWidth)){this.stepWidth=this.full;}this.knob.setStyle("position","relative").setStyle(this.property,-this.options.offset);h[this.axis]=this.property;
f[this.axis]=[-this.options.offset,this.full+this.options.offset];this.drag=new Drag(this.knob,{snap:0,limit:f,modifiers:h,onDrag:function(){this.draggedKnob();
this.fireEvent("onDrag",[this.drag.value.now.x]);}.bind(this),onComplete:function(){this.draggedKnob();this.end();}.bind(this)});if(this.options.snap){this.drag.options.grid=(this.stepWidth);
this.drag.options.limit[this.axis][1]=this.full;}},set:function(b){if(!((this.range>0)^(b<this.min))){b=this.min;}if(!((this.range>0)^(b>this.max))){b=this.max;
}this.step=(b);this.checkStep();this.end(true);this.fireEvent("onTick",this.toPosition(this.step));return this;},clickedElement:function(e){e=new Event(e);
var d=this.range<0?-1:1;var f=e.page[this.axis]-this.element.getPosition()[this.axis]-this.half;f=f.limit(-this.options.offset,this.full-this.options.offset);
this.step=(this.min+d*this.toStep(f));if(document.body.getStyle("direction")=="rtl"){this.step=this.steps-this.step;}this.checkStep();this.end();this.fireEvent("onTick",f);
},scrolledElement:function(d){var c=(this.options.mode=="horizontal")?(d.wheel<0):(d.wheel>0);this.set(c?this.step-this.stepSize:this.step+this.stepSize);
d.stop();},draggedKnob:function(){var d=this.range<0?-1:1;var c=this.drag.value.now[this.axis];c=c.limit(-this.options.offset,this.full-this.options.offset);
this.step=(this.min+d*this.toStep(c));this.checkStep();},checkStep:function(){this.previousChange=this.step;this.fireEvent("onChange",this.step);},end:function(b){if(this.previousEnd!==this.step){this.previousEnd=this.step;
}if(!b){this.fireEvent("onComplete",this.step+"");}},toStep:function(d){var c=(d+this.options.offset)*this.stepSize/this.full*this.steps;return this.options.steps?Math.round(c):c;
},toPosition:function(b){return(this.full*Math.abs(this.min-b))/(this.steps*this.stepSize)-this.options.offset;}});RokSlider.implement(new Events);RokSlider.implement(new Options);
Drag.implement({drag:function(e){this.out=false;this.mouse.now=e.page;for(var f in this.options.modifiers){if(!this.options.modifiers[f]){continue;}this.value.now[f]=this.mouse.now[f]-this.mouse.pos[f];
if(this.limit[f]){if((this.limit[f][1]!=null)&&(this.value.now[f]>this.limit[f][1])){this.value.now[f]=this.limit[f][1];this.out=true;}else{if((this.limit[f][0]!=null)&&(this.value.now[f]<this.limit[f][0])){this.value.now[f]=this.limit[f][0];
this.out=true;}}}var d=(this.value.now[f]-(this.limit[f][0]||0))%this.options.grid[f];var g=(d>this.options.grid[f]/2);if(this.options.grid[f]){this.value.now[f]=(g)?this.value.now[f]-d+this.options.grid[f]:this.value.now[f]-d;
}this.element.setStyle(this.options.modifiers[f],this.value.now[f]+this.options.unit);}this.fireEvent("onDrag",this.element);e.stop();}});