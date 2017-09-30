<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>动态组件</title>
<script type="text/javascript" src="/myvue/system/lib/vue/vue.js"></script>
<link rel="stylesheet" type="text/css" href="/myvue/system/modules/component/combo/css/index.css">
<style>
	.unregister{
		width:160px;
		height:30px;
		border:1px solid green;
		margin-left:15px;
	}
</style>
</head>
<body>
<div id="app">
	<div style="margin-bottom:15px;">
		<input type="radio" value="1" name="logon" @change="onSelectionChange" ref="logon">登录
		<input type="radio" value="0" name="logon" @change="onSelectionChange">未登录
	</div>
	<!-- 提供component原生组件可以根据需求动态加载自定制组件 -->
	<div class='label float-l'>亲友：</div>
	<component v-bind:is="viewName" :names="names">
	</component>
</div>
<script type="text/javascript">
	//第一种组件定义方式
	Vue.component("register",{
		props : ['names'],
		template : "<div class='clear float-l combo-wrapper'>"
			+"<div class='combo float-l' @click='show' ref='comboInput'>{{proName}}</div>"
			+"<ul v-show='isDisplay' class='combo-list' @click='onLiClick($event)' ref='comboList'>"
				+"<li v-for='name in names' >{{name}}</li>"
			+"</ul>"
		+"</div>",
		
		data:function(){
			return {
				isDisplay:false,
				proName:''
			}
		},
		
		methods:{
			show : function(){
				this.isDisplay = !this.isDisplay;
			},
			onLiClick : function(event){
				var name = event.target.innerHTML;
				this.proName = name;
				this.show();
				
				this.$emit("selectionchange", name);
			}
		},
		//mounted 是vue构造函数或组件的一个属性
		//执行时间是template内容计算完毕并贴到页面上时触发
		mounted:function(){
			//this指针指向当前实例，函数运行时机是template内容贴入到页面的时刻
			var comboInput = this.$refs.comboInput,
				comboList = this.$refs.comboList;
			
			var left = comboInput.offsetLeft,
				top = comboInput.offsetTop,
				height = comboInput.clientHeight;
			
			comboList.style.left = left + "px";
			comboList.style.top = top + height + 5 + "px";
		}
	});
	
	//第一种组件定义方式
	Vue.component("unregister",{
		template : "<div class='clear float-l unregister' @click='onClick'></div>",
		
		methods:{
			onClick : function(event){
				alert("您需要先登录。")
			}
		}
	});
	
	var vm = new Vue({
		el:'#app',
		data : {
			viewName : 'unregister',
			names:['舒克','白塔','牛魔王']
		},
		
		methods:{
			onSelectionChange:function(){
				var isLogon = this.$refs.logon.checked;
				if(isLogon){
					this.viewName = "register";
				}else{
					this.viewName = "unregister";
				}
			}
		}
	});

</script>
</body>
</html>