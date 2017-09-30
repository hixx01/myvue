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
	<div v-for="(name,index) in names">{{index+1}}. 我是{{name}}</div>
	
	<div v-for="pro in provices">{{pro.name}}</div>
</div>
<script type="text/javascript">
	var vm = new Vue({
		el : '#container',//css选择器语法
		data : {
			names:['李老师','张老师','季老师'],
			provices:[{code:'shanxi',name:'陕西'},{code:'hebei',name:'河北'}]
		}
	});
</script>
</body>
</html>