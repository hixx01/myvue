<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>组件定义</title>
<script type="text/javascript" src="/myvue/system/lib/vue/vue.js"></script>
<link rel="stylesheet" type="text/css" href="/myvue/system/modules/component/spinner/css/index.css">
</head>
<body>
<div id="app">
	<!-- max指向的值是固定值，因为他没有使用v-bind指令 
		defalut-value 属性是多个单词时，使用-分隔，但是在组件中定义时，需要写成驼峰写法-->
	<spinner max="40" min="-30" step="10" label="数值组件" default-value="10"></spinner>
	
	<spinner max="100" min="-30" step="20" label="数值组件2" default-value="40"></spinner>
</div>
<script type="text/javascript">
	Vue.component("spinner",{
		props:['max','min','step','label','defaultValue'],
		template : "<div>"
			+"<label class='spinner-label float-l'>{{label}}</label>"
			+"<input class='spinner-input float-l' v-model='inputValue'>"
			+"<div class='plus btn float-l' @click='addStep'>+</div>"
			+"<div class='reduce btn float-l' @click='reduceStep'>-</div>"
			+"</div>",
			
		data:function(){
			return {
				inputValue : 0
			}
		},
		//data数据和props数据整理完成后调用的事件
		created:function(){
			var defaultValue = this.$options.propsData.defaultValue;
			this.inputValue = parseInt(defaultValue);
	  	},
		methods : {
			addStep : function(){
				var step = this.$options.propsData.step;
				step = parseInt(step);
				var max = this.$options.propsData.max;
				max = parseInt(max);
				var min = this.$options.propsData.min;
				min = parseInt(min);
				
				var number = parseInt(this.inputValue) + step;
				if(number > max){
					alert("已经到最大值:"+max);return;
				}
				this.inputValue = number;
			},
			
			reduceStep : function(){
				var step = this.$options.propsData.step;
				step = parseInt(step);
				var max = this.$options.propsData.max;
				max = parseInt(max);
				var min = this.$options.propsData.min;
				min = parseInt(min);
				
				var number = parseInt(this.inputValue) - step;
				if(number < min){
					alert("已经到最小值:"+min);return;
				}
				this.inputValue = number;
			}
		}
	});
	
	var vm = new Vue({
		el:'#app'
	})
</script>
</body>
</html>