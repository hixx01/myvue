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
<div id="app">
	<select @change="onSelectChange" ref="select">
		<option value="0">--请选择--</option>
		<option value="1">上课</option>
		<option value="2">下课</option>
	</select>
	<div>
		<label>学生A：</label><span v-course.up="message"></span>
	</div>
	<div>
		<label>学生B：</label><span v-course.up.down="message"></span>
	</div>
	<div>
		<label>学生C：</label><span v-course.down="message"></span>
	</div>
</div>
<script type="text/javascript">

	Vue.directive("course", {
// 		bind:function(){},//vue读取到标签定义时触发
// 		inserted:function(){},//指令被翻译完成并添加到页面中时触发的函数
// 		update:function(){},//表达式内容发生修改时触发的事件
// 		componentUpdate:function(){},//修改内容贴到页面时触发的事件
// 		unbind:function(){}//移除指令时触发的事件
		
		update:function(el, binding){
			var value = binding.value;
			console.log(value);
			var mod = binding.modifiers;
			if(value.type == "up"){
				if(mod.up){
					el.innerHTML = value.msg;
				}else{
					el.innerHTML = "";
				}
			}else if(value.type == "down"){
				if(mod.down){
					el.innerHTML = value.msg;
				}else{
					el.innerHTML = "";
				}
			}
		}
	});
	var vm = new Vue({
		el:'#app',
		data : {
			message : {type:'',msg:''}
		},
		methods:{
			onSelectChange:function(){
				//this指针指向的是Vue实例本身，即vm对象
// 				var sel = document.getElementById("select");
				var sel = this.$refs.select;//ref与$refs配合使用
				if(sel.value == '1'){//发出了一次上课的提示
					this.message = {type:'up',msg:'老师好'};
				}else if(sel.value == '2'){//下课的指令
					this.message = {type:'down',msg:'老师再见'}
				}
			}
		}
	});
</script>
</body>
</html>