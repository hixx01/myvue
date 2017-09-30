<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/myvue/system/lib/vue/vue.js"></script>
<script type="text/javascript" src="/myvue/system/lib/vue/vue-router.js"></script>
<title>vue router</title>
<style>
	html, body{
		width:100%;height:100%;
	}
	.left-bar{
		float:left;
		width:20%;
		height:100%;
	}
	.main{
		float:left;
		width:80%;
		height:100%;
		background:red;
	}
	#app{
		width:100%;
		height:100%;
	}
</style>
</head>
<body>
<div id="app">
	<div class="left-bar">
		<h1>Vue router 示例</h1>
		<div>
			<router-link to="/home">首页</router-link>
		</div>
		<div>
			<router-link to="/about">关于页面</router-link>
		</div>
	</div>
	<div class="main">
		<router-view></router-view>
	</div>
</div>

<script type="text/javascript">
	var Home = Vue.extend({template:'<div><h1>首页</h1><p>这是系统首页</p><p><router-link to="/home/index">索引页面</router-link><router-link to="/home/detail">明细页面</router-link></p><router-view></router-view></div>'});
	var About = Vue.extend({template:'<div><h1>关于页面</h1><p>这是关于页面</p></div>'});
	var Index = Vue.extend({template:'<div><p>这是首页下面的索引页面</p></div>'});
	var Detail = Vue.extend({template:'<div><p>这是首页下面的明细页面</p></div>'});
	
	var routes = [{
		path:'/home', component: Home, children:[{
			path:'/home/index', component: Index
		},{
			path:'/home/detail', component: Detail
		}]
	},{
		path:'/about', component: About
	}];
	
	var router = new VueRouter({
		routes : routes
	});
	
	var vm = new Vue({
		el:'#app',
		router: router
	});
</script>
</body>
</html>