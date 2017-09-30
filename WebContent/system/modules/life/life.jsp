
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">

<script type="text/javascript" src="/myvue/system/lib/vue/vue.js"></script>
<title>生命周期</title>
</head>
<body>
<div id="app">
<keep-alive>
  <comp-a v-if="a > 1"></comp-a>
  <comp-b v-else></comp-b>
</keep-alive>
</div>
<script>
	//vue对于整个生命周期，提供了很多节点，让我们有机会对实例进行相应修改
	var vm = new Vue({
	  el:'#app',
	  data: {
	    a: 1
	  },
	  components:{
		  'comp-a':{template:"<div>123123123</div>",/**
				  **使用<keep-alive>声明的组件
				  **/
				  activated:function(){
					  console.log("comp-a : keep-alive 组件激活时调用。")
					  console.log(this);
					  console.log(arguments);
				  },
				  /**
				  **使用keep-alive声明的组件
				  **/
				  deactivated:function(){
					  console.log("comp-a : keep-alive 组件停用时调用。")
					  console.log(this);
					  console.log(arguments);
				  },},
		  'comp-b':{template:"<div>abcacbacb</div>"},
	  },
	  
	  beforeCreate:function(){
		  console.log("1.创建之前")
		  console.log(this);
		  console.log(arguments);
	  },
	  created:function(){
		  console.log("2.实例已经创建完成之后被调用")
		  console.log(this);
		  console.log(arguments);
	  },
	  beforeMount:function(){
		  console.log("3.在挂载开始之前被调用：相关的 render 函数首次被调用。")
		  console.log(this);
		  console.log(arguments);
	  },
	  mounted:function(){
		  console.log("4.el 被新创建的 vm.$el 替换，并挂载到实例上去之后调用该钩子")
		  console.log(this);
		  console.log(arguments);
	  },
	  beforeUpdate:function(){
		  console.log("5.数据更新时调用，发生在虚拟 DOM 重新渲染和打补丁之前")
		  console.log(this);
		  console.log(arguments);
	  },
	  updated:function(){
		  console.log("6.由于数据更改导致的虚拟 DOM 重新渲染和打补丁，在这之后会调用该钩子")
		  console.log(this);
		  console.log(arguments);
	  },
	  
	  beforeDestroy:function(){
		  console.log("7.实例销毁之前调用。在这一步，实例仍然完全可用。")
		  console.log(this);
		  console.log(arguments);
	  },
	  destroyed:function(){
		  console.log("8.Vue 实例销毁后调用。调用后，Vue 实例指示的所有东西都会解绑定，所有的事件监听器会被移除，所有的子实例也会被销毁。")
		  console.log(this);
		  console.log(arguments);
	  }
	})
	
</script>
</body>
</html>