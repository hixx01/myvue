<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>templateRender</title>
<script type="text/javascript" src="/myvue/system/lib/vue/vue.js"></script>
</head>
<body>
<div id="app">

	<div>{{name}}</div>
	<div v-text="name"></div>

</div>
<script type="text/javascript">
	var vm = new Vue({
		el : "#app",
		//简言之：将根元素下的所有内容替换为模板属性对应的内容，优先级教原内容高
		//vue提供了三种级别的数据渲染,render > template > data
		//dom结构固定，数据容易发生改变时，使用data声明响应式数据即可
		//变化较多时，使用template声明
		//对于js要求较多时，使用render即可
		template:"<p>{{name}}</p>",
		data : {
			name : "这是一个响应属性name"
		},
		
		render : function(createElement){
			var a = Math.random()*100;
			var result = this.name+a;
			return createElement("div",result);
		}
	})
</script>

</body>
</html>