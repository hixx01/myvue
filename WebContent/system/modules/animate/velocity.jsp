<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/myvue/system/lib/vue/vue.js"></script>
<script type="text/javascript" src="/myvue/system/lib/vue/velocity.js"></script>
<title>transition 动画</title>
</head>
<body>
<div id="app">
	<button @click="isDisplay = !isDisplay">控制div显示</button>
	
	<!-- 声明css属性为false，即禁止css动画 -->
	<transition v-bind:css="false"
		@before-enter="beforeEnter" 
		@enter="enter" 
		@leave="leave"
	>
		<div v-show="isDisplay">transition 动画</div>
	</transition>
</div>

<script type="text/javascript">
	var vm = new Vue({
		el:'#app',
		data : {
			isDisplay : false
		},
		methods:{
			beforeEnter:function(el, done){
				el.style.opacity = 0;
			},
			enter:function(el, done){
				Velocity(el, {opacity:1, fontSize:'1.4em'}, {duration: 500});
				Velocity(el, {fontSize:'1em'}, {complete: done});
			},
			leave:function(el, done){
				Velocity(el, {marginLeft:'100px'}, {duration: 500});
				Velocity(el, {marginTop:'100px'}, {duration: 500});
				Velocity(el, {marginLeft:'0px'}, {duration: 500});
				Velocity(el, {marginTop:'0px'}, {duration: 500});
				Velocity(el, {opacity:0}, {complete: done});
			}
		}
	});
</script>
</body>
</html>