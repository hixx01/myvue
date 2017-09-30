<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>v-text directive</title>
<!-- 引入vue的类库 -->
<script type="text/javascript" src="/myvue/system/lib/vue/vue.js"></script>
</head>
<body>
<!-- 定义id为container容器，用于设定新建Vue对象的最外层容器 -->
<div id="container">
<!-- 	指令后面通过冒号分割字符被称为参数，参数后面使用.分割的元素是被修改数据，=号填充的字符被称作表达式 -->
<!-- 	<input v-focus:hello.a.b="message"> -->
<!-- 		1.on对应binding里的name, -->
<!-- 		2.v-on对应binding里的rawName, -->
<!-- 		3.:click对应binding里的arg, -->
<!-- 		4..stop|.prefault|.one代表binding里的modifiers里的数据，且每个属性的值都为true, -->
<!-- 		5.btnClick对应binding里的expression, -->
<!-- 		6.btnClick对应的值会对应到binding里的value上 -->
<!-- 	<button v-on:(click/dblclick).stop.prefault.one="btnClick"> -->
	
	<div v-color.border.background="color">{{message}}</div>
	<div v-color.border="color2">{{message2}}</div>
	<button v-on:click.one.stop.prefault.a="btnClick">点击button</button>
	//binding是指令的上下文对象，存储着指令关键信息，我们使用这些关键信息对当前的dom元素进行相应的修改操作
	//on  binding.name
	//v-on binding.rawName
	//click binding.arg
	//.one.stop.prefault binding.modifires  {one:true,stop:true,prefault:true,a:true}
	//btnClick  binding.expression
	//function btnClick(){}  //binding.value
	//function btnClick1(){}	//binding.oldValue
	<button v-on:click="btnClick">点击button1</button>
	<button v-on:mouseover.stop.prefault.one="btnClick">点击button</button>
</div>

<script type="text/javascript">
	//定义自定义指令的方法
	Vue.directive('focus',{
		//当指令在元素上开始解析时触发事件
		bind:function(el, binding, vnode){
			console.log("1：bind");
		},
		//当指令被解析完毕，然后当前元素贴入父元素时触发的事件
		inserted:function(el, binding, vnode){
			console.log("2:inserted");
			el.focus();
			console.log(arguments);
		},
		//当指令侦听的值发生改变时，触发的事件
		update:function(el, binding, vnode, oldNode){
			console.log("侦听内容发生改变时触发");
		},
		//当前元素更细完成后触发事件
		componentUpdated:function(el, binding, vnode, oldNode){
			console.log("dom更新完成后触发");
		},
		//销毁元素时触发的事件，input
		unbind:function(el, binding, vnode){
			console.log("销毁时触发");
		}
	});
	
	Vue.directive('color',{
		//当指令被解析完毕，然后当前元素贴入父元素时触发的事件
		inserted:function(el, binding, vnode){
			el.style.color = binding.value;
			if(binding.modifiers.border){
				el.style.border = "1px solid "+binding.value;
			}
			if(binding.modifiers.background){
				el.style.background = binding.value;
			}
		},
		//当指令侦听的值发生改变时，触发的事件
		update:function(el, binding, vnode, oldNode){
			el.style.color = binding.value;
			if(binding.modifiers.border){
				el.style.border = "1px solid "+binding.value;
			}
			if(binding.modifiers.background){
				el.style.background = binding.value;
			}
		}
	});
	
	var vm = new Vue({
		el : '#container',//css选择器语法
		data : {
			message :'v-color示例',
			color:"red",
			color2:'#FF00FF',
			message2 :'v-color示例2'
		},
		methods:{
			btnClick:function(){
				///......
			}
		}
		
	});

</script>
</body>
</html>