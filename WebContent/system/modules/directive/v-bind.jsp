<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>v-for directive</title>
<!-- 引入vue的类库 -->
<script type="text/javascript" src="/myvue/system/lib/vue/vue.js"></script>
</head>
<body>
<!-- 定义id为container容器，用于设定新建Vue对象的最外层容器 -->
<div id="container">
	<!-- 标签属性数据绑定，必须使用v-bind指令 ，v-bind声明的属性会随着绑定数据的改变而更新-->
	<img src="imgUrl">
	<img src="{{imgUrl}}">
	<img v-bind:src="imgUrl">
	<!-- v-bind简写指令 -->
	<img :src="imgUrl">
	
	<button v-on:click="btnClick">按钮点击</button>
</div>
<script type="text/javascript">
	var vm = new Vue({
		el : '#container',//css选择器语法
		data : {
			imgUrl:'a.png'
		},
		methods:{
			btnClick : function(){
				//this指向vue实例本身，该出即是指vm对象
				this.imgUrl = "/myvue/system/modules/directive/images/xijing.jpg";
			}
		}
	});
</script>
</body>
</html>