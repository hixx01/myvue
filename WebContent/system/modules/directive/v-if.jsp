<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>v-if directive</title>
<!-- 引入vue的类库 -->
<script type="text/javascript" src="/myvue/system/lib/vue/vue.js"></script>
</head>
<body>
<!-- 定义id为container容器，用于设定新建Vue对象的最外层容器 -->
<div id="container">
	<!-- 显示或隐藏指定标签  隐藏的实现原理是修改元素的display属性为none
		动态修改绑定属性值时，会动态隐藏或显示元素
	-->
	<div v-if="isDisplay">v-if指令</div>
	
	<div v-if="level == 0">level {{level}}</div>
	<div v-else-if="level == 1">level {{level}}</div>
	<div v-else>level {{level}}</div>
</div>

<script type="text/javascript">
	var vm = new Vue({
		el : '#container',//css选择器语法
		data : {
			//data里面的所有属性在 el容器内是可读的
			isDisplay :false,
			level : 0
		}
	});

</script>
</body>
</html>