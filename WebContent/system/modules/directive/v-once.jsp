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
	<!-- 仅绑定一次数据，后续数据发生修改时，也不修改dom显示 -->
	<div v-text="message" v-once></div>
	<div v-text="message"></div>
</div>

<script type="text/javascript">
	var vm = new Vue({
		el : '#container',//css选择器语法
		data : {
			//data里面的所有属性在 el容器内是可读的
			message : 'v-text语法。'
		}
	});

</script>
</body>
</html>