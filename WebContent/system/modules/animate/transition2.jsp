<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/myvue/system/lib/vue/vue.js"></script>
<title>transition 动画</title>
<style type="text/css">
	.cls1{
		width: 160px;
		height:100px;
		line-height:100px;
		transition: all 1s;
		border:1px solid red;
	}
	.cls2{
		height: 200px;
		line-height:200px;
	}
</style>
</head>
<body>
<div id="app">
	<button @click="cls2 = (cls2 == ''? 'cls2':'')">控制div显示</button>
	<!-- 1.多个class绑定时，使用数组方式绑定 -->
	<!-- 2.对于非隐藏性的动画，建议使用css3的动画 -->
	<div :class="[cls1, cls2]">测试div</div>
</div>

<script type="text/javascript">
	var vm = new Vue({
		el:'#app',
		data:{
			cls1:'cls1',
			cls2:''
		}
	});
</script>
</body>
</html>