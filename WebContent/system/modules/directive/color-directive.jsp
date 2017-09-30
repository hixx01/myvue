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
	<div v-directcolor:helloworld.border.background="color">{{message}}</div>
</div>
<script type="text/javascript">

	Vue.directive('directcolor',{
		inserted:function(el, binding){
			console.log(JSON.stringify(binding))
			//binding的输出内容
			/*{
				"name":"directcolor",
				"rawName":"v-directcolor:helloworld.border.background",
				"value":"red",
				"expression":"color",
				"arg":"helloworld",
				"modifiers":{"border":true,"background":true}
			}*/
			el.style.color = binding.value;
			if(binding.modifiers.border){
				el.style.border = '1px solid '+binding.value;
			}
			if(binding.modifiers.background){
				el.style.background = binding.value;
			}
		},
		update:function(el, binding){
			el.style.color = binding.value;
			if(binding.modifiers.border){
				el.style.border = '1px solid '+binding.value;
			}
			if(binding.modifiers.background){
				el.style.background = binding.value;
			}
		}
	});
	
	var vm = new Vue({
		el : '#container',//css选择器语法
		data : {
			message:'12345',
			color:'red'
		}
	});
</script>
</body>
</html>