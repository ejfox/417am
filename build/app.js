var $,GenArt,d3,example2,example3,example4,section1,section2,section3,section4;d3=require("d3"),$=require("jquery"),GenArt=require("./GenArt"),example2=require("./10-8-4"),example3=require("./10-3-2"),example4=require("./10-7-2"),section1=new Waypoint({element:document.getElementById("example-1"),offset:"55%",handler:function(e){return new GenArt(+new Date,{elementSelector:"#example-1",numTicks:1e3,limitTicks:!0,bgColor:"white"}).init()}}),section2=new Waypoint({element:document.getElementById("example-2"),offset:"55%",handler:function(e){return example2.init({elementSelector:"#example-2",numTicks:1e3,limitTicks:!0,bgColor:"white"})}}),section3=new Waypoint({element:document.getElementById("example-3"),offset:"55%",handler:function(e){return example3.init({elementSelector:"#example-3",numTicks:1e3,limitTicks:!0,bgColor:"white"})}}),section4=new Waypoint({element:document.getElementById("example-4"),offset:"55%",handler:function(e){return example4.init({elementSelector:"#example-4",numTicks:1e3,limitTicks:!0,bgColor:"white"})}});