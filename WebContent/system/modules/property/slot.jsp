<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>props</title>
<script type="text/javascript" src="/myvue/system/lib/vue/vue.js"></script>
</head>
<body>
<div id="app">
	<span>123123123</span>
	<!-- 当前实例的子元素 ，即vm的子元素
	  child中的内容仍然属于父元素的作用范围，需要获取的响应式数据依然从父元素中读取
	-->
	<child>
		<span slot="pre">xyzopq</span>
		<span slot="suffix">{{message}}</span>
	</child>

</div>
<script type="text/javascript">
	//slot用途
	//单个slot会将父元素中的相关代码嵌入到子元素中
	//slot支持具名定义，可以对每一个slot进行定位
	Vue.component("child",{
		template:"<button><slot name='pre'></slot>这是一个按钮<slot name='suffix'></slot></button>"
	});
	
	//用于标记虚拟node唯一键值，对于普通情况使用没有什么变化，对动画效果计算时有很大作用；而且会影响虚拟node到实体node的更新算法
	var vm = new Vue({
		el : "#app",
		data:{
			message:'123123abc'
		}
	});
</script>

</body>
</html>