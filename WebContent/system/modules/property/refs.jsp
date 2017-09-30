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
	<div ref="div">{{name1}}</div>
	<div ref="sex">{{sex1}}</div>

</div>
<script type="text/javascript">

	var vm = new Vue({
		el : "#app",
		data : {
			name1:'nilaoshi',
			sex1:'M'
		}
	});
	//ref和$refs配对使用，帮助父组件获取任意一个子元素
	console.log(vm.$refs.div)
	console.log(vm.$refs.sex)
</script>

</body>
</html>