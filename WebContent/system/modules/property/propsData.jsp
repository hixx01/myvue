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

</div>
<script type="text/javascript">

	var vm = new Vue({
// 		props:["name","sex","address"],
		el : "#app",
		template:"<ul><li>姓名:{{name}}</li><li>性别:{{sex}}</li><li>家庭地址:{{address}}</li></ul>",
// 		propsData:{
// 			name:'propsData-nilaoshi',
// 			sex :"propsData-M",
// 			address :'propsData-高新'
// 		}
		data : {
			name:'nilaoshi',
			sex :"M",
			address :'高新'
		}
	})
</script>

</body>
</html>