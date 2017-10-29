var GenArt,_,art,clColors,d3,deg2rad,options,pdistance,pointInCircle,seed;Math.radians=function(t){return t*Math.PI/180},Math.degrees=function(t){return 180*t/Math.PI},d3=require("d3"),_=require("lodash"),seed=Date.now(),clColors=require("nice-color-palettes/500"),GenArt=require("./GenArt"),deg2rad=Math.PI/180,pointInCircle=function(t,i,n,a,e){return(t-n)*(t-n)+(i-a)*(i-a)<=e*e},pdistance=function(t,i,n,a){var e,c;return e=t-n,c=i-a,Math.sqrt(e*e+c*c)},(art=new GenArt(seed,options={numTicks:1111,count:32,randomizeTicks:!1,randomizeCount:!1,bgColor:"white",constrainEdges:!1})).makeParticles=function(){var t,i,n,a,e,c,s,h,r,o;for(console.log("Making "+this.count+" particles"),this.colors=this.chance.pickone(clColors),this.ctx.fillStyle=this.colors[this.colors.length-1],this.colors.pop(),this.ctx.fillRect(0,0,this.width,this.height),this.chance.bool({likelihood:30})&&(n=this.chance.pickone(["multiply","screen"]),console.log(n),this.ctx.globalCompositeOperation=n,this.opacity=.25),h=r=this.chance.integer({min:5,max:180}),o=this.chance.integer({min:5,max:100}),c=this.chance.integer({min:42,max:192}),e=this.chance.integer({min:42,max:192}),this.maxRadius=this.chance.integer({min:1,max:19}),this.data=[],s=0,a=0,t=this.colors.length>2?d3.hsl(this.chance.pickone(this.colors)):d3.hsl("#000");s<this.count/2;){for(i=0,t.opacity=this.opacity;i<this.count/2;)this.data.push({i:a,x:h,y:o,angleStep:this.chance.floating({min:.01,max:1}),targetx:h+this.chance.integer({min:25,max:this.width}),targety:o+this.chance.integer({min:25,max:this.width}),xStepAmount:this.chance.floating({min:.01,max:1}),yStepAmount:this.chance.floating({min:.01,max:1}),radius:this.chance.integer({min:1,max:8}),sinRadius:this.chance.integer({min:10,max:this.width}),color:t.toString(),angle:this.chance.integer({min:0,max:359})}),a++,h+=c,i++;h=r,o+=e,s++}return this.data},art.tick=function(){return this.ticks||(this.ticks=0),this.ticks++,this.data.forEach(function(t){return function(i,n){var a,e,c,s,h;return e=t.simplex.noise2D(i.x,i.y)*t.chance.floating({min:.1,max:.7}),i.radius+=e,i.radius=_.clamp(i.radius,0,t.maxRadius),s=i.xStepAmount*t.chance.floating({min:.1,max:.7}),h=i.xStepAmount*t.chance.floating({min:.1,max:.7}),i.distance=pdistance(i.x,i.y,i.targetx,i.targety),i.x<i.targetx&&(i.x+=s),i.x>i.targetx&&(i.x-=s),i.y<i.targety&&(i.y+=h),i.y>i.targety&&(i.y-=h),_.find(t.data,function(t){return pointInCircle(i.x,i.y,t.x,t.y,t.radius+i.radius)})&&(i.x+=4*s,i.y+=4*h),t.chance.bool({likelihood:8})&&(c=t.chance.pickone(t.data),i.targetx=c.x,i.targety=c.y),t.chance.bool()&&(i.angle+=t.chance.floating({min:-s/2,max:s/2})),i.x=i.x+Math.cos(i.angle*deg2rad),i.y=i.y+Math.sin(i.angle*deg2rad),i.angle+=i.angleStep,t.chance.bool()&&(i.angle>360&&(i.angle=0),i.angle<0&&(i.angle=360)),a=d3.hsl(i.color),a.h+=t.chance.floating({min:-.01,max:.05}),a.h=.01*i.distance+t.chance.floating({min:.1,max:.6}+e),i.color=a.toString(),t.constrainEdges&&(i.x=_.clamp(i.x,0+i.radius,t.width-i.radius),i.y=_.clamp(i.y,0+i.radius,t.height-i.radius)),t.ctx.beginPath(),t.ctx.arc(i.x,i.y,i.radius,0,2*Math.PI),t.ctx.fillStyle=i.color,t.ctx.fill()}}(this)),this.limitTicks?this.ticks<this.numTicks?requestAnimationFrame(this.tick.bind(this)):this.limitTicks&&this.ticks===this.numTicks?cancelAnimationFrame(this.rafAnimation):void 0:requestAnimationFrame(this.tick.bind(this))},module.exports=art;