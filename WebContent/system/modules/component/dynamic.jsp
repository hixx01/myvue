<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>动态组件</title>
<script type="text/javascript" src="/myvue/system/lib/vue/vue.js"></script>
</head>
<body>
<div id="app">
	<!-- 提供component原生组件可以根据需求动态加载自定制组件 -->
	<component v-bind:is="viewName">
	</component>
</div>
<script type="text/javascript">
	var vm = new Vue({
		el:'#app',
		data : {
			viewName : 'home'
		},
		
		components : {
			home : {
				template:'<div>this is home page</div>'
			},
			list : {
				template:'<div>this is list page</div>'
			},
			detail : {
				template:'<div>this is detail page</div>'
			}
		}
	});

</script>
</body>
</html>