<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/myvue/system/lib/vue/vue.js"></script>
<title>vue 简单路由</title>
<style>
	html,body{
		width:100%;height:100%;
	}
	div{
		width:100%;
		height:100%;
	}
</style>
</head>
<body>
<div id="app">

</div>

<script type="text/javascript">
// Vue是一个函数，函数执行时内部会创建一个VueComponent类返回
// extend创建一个VueComponent返回，返回的是一个VueComponent类
var PageNotFind = Vue.extend({template:'<div> 404 page</div>'});
var Home = Vue.extend({template:'<div> 系统首页</div>'});
var List = Vue.extend({template:'<div> 列表页面</div>'});

var routers = {
	"/" : Home,
	"/list" : List
}

var url = window.location.href;
var pageUrl = url.substring(url.indexOf("#")+1);

var vm = new Vue({
	el:"#app",
	
	render:function(createElement){
		var viewComponent = routers[pageUrl] || PageNotFind;
		//Vue提供的创建元素的方法
		//createElement可以创建VueComponent，也可以创建html原生标签，比如"div"
		return createElement(viewComponent);
	}
});
</script>
</body>
</html>