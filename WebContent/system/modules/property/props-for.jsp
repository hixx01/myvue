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

	<person v-for="item in persons" v-bind:person="item"></person>

</div>
<script type="text/javascript">

	Vue.component("person",{
		props : ["person"],
		template : "<ul><li>姓名:{{person.name1}}</li><li>性别:{{person.sex1}}</li><li>家庭地址:{{person.address1}}</li></ul>"
	});
	
	
	var vm = new Vue({
		el : "#app",
		data : {
			persons:[{name1:'nilaoshi',
				sex1 :"M",
				address1 :'高新'},{
					name1:'nilaoshi2',
					sex1 :"M2",
					address1 :'高新2'
				}]
			
		}
	})
</script>

</body>
</html>