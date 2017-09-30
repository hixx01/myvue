<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>构造参数和实例属性总结</title>
<script type="text/javascript" src="/myvue/system/lib/vue/vue.js"></script>
</head>
<body>

<script type="text/javascript">
	//可以直接在属性后面定义监听函数
	//属性后面指定监听函数名称，函数实现在methods方法中
	//监听函数都会得到新值和旧值
	//vue提供了两种监听数据的方法，watch和$watch
	var vm = new Vue({
		myName:'jim green',//自定义属性，只要不是Vue关键词的key都可以做自定义属性
		el:'#app',
		props:["1","2"],
		propsData:{
			
		},
		template:'',//模板
		render:function(){},//js渲染
		computed:{},//计算属性
		data:{
			a : 123,
			b : 'abc',
			c : {type:'up',msg:'老师好'},
			d : 1
		},
		watch : {
			a : function(val,oldValue){
				console.log("a发生变化，从"+oldValue+"变化到了"+val);
			}
		},
		methods:{
			readBChange : function(val,oldValue){
				console.log("b发生变化，从"+oldValue+"变化到了"+val);
			}
		},
		//定义组件的属性
		components:{
			
		},
		
		beforeCreate:function(){
	  	},
	  	created:function(){
	  	},
	  	beforeMount:function(){
	  	},
	  	mounted:function(){
	  	},
	  	beforeUpdate:function(){
	  	},
	  	updated:function(){
	  	},
	  	beforeDestroy:function(){
	  	},
	  	destroyed:function(){
	  	}
	});
	//key, ref, slot 不需要定义在Vue构造中
	
	vm.$el//读取根节点 el对应的节点
	vm.$data //读取Vue里面的data对象
	vm[data和computed]所有属性
	vm.$watch//监控数据是否发生修改
	vm.$set
	vm.$delete
	
	vm.$options.myName//读取自定义参数的关键词
	
	vm.$refs//读取相应子元素的关键词
	vm.$slots//读取slot对象
	
	vm.$on //绑定事件
	vm.$emit //派发事件
	vm.$once //事件仅触发一次
	vm.$off //取消事件绑定
</script>

</body>
</html>