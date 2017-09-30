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
	<!-- 当前实例的子元素 ，即vm的子元素-->
	<div v-for="person in persons" >{{person.name}}</div>

</div>
<script type="text/javascript">
	//用于标记虚拟node唯一键值，对于普通情况使用没有什么变化，对动画效果计算时有很大作用；而且会影响虚拟node到实体node的更新算法
	var vm = new Vue({
		el : "#app",
		data : {
			persons:[{id:1,name:'123'},{id:2,name:'456'}]
		}
	});
</script>

</body>
</html>