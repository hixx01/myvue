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
	<div>{{message}}</div>
	<!-- v-on用于绑定事件，click称作参数，btnClick称作表达式，表达式指向vue实例的methods属性中的内容 -->
	<input v-model="message">
</div>
<script type="text/javascript">
	var vm = new Vue({
		el : '#container',//css选择器语法
		data : {
			message:'12345'
		}
	});
</script>
</body>
</html>