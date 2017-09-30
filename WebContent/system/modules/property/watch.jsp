<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>属性watch</title>
<script type="text/javascript" src="/myvue/system/lib/vue/vue.js"></script>
</head>
<body>

<script type="text/javascript">
	//可以直接在属性后面定义监听函数
	//属性后面指定监听函数名称，函数实现在methods方法中
	//监听函数都会得到新值和旧值
	//vue提供了两种监听数据的方法，watch和$watch
	var vm = new Vue({
		props:["1","2"],
		data:{
			a : 123,
			b : 'abc',
			c : {type:'up',msg:'老师好'},
			d : 1
		},
		watch : {
			a : function(val,oldValue){
				console.log("a发生变化，从"+oldValue+"变化到了"+val);
			},
			b : 'readBChange',
			
			c :{//深度检查数据变化，当c属性内部数据发生改变时，依然触发handler函数
				handler : function(val,oldValue){
					console.log(val.type+"   "+val.msg);
					console.log(oldValue.type+"   "+oldValue.msg);
				},
				deep:true
			}
		},
		methods : {
			readBChange : function(val,oldValue){
				console.log("b发生变化，从"+oldValue+"变化到了"+val);
			}
		}
	});
	
	//$watch
	vm.$watch("d", function(value, oldValue){
		console.log("d发生变化，从"+oldValue+"变化到了"+value);
	});
	
	//vm.$set  vm.$delete
	//$set用于绑定初始化完成后在data上继续添加可监控属性的方法
	//$set 不要添加属性到Vue实例（及vm对象）上或$data上
	vm.$set(vm.c,"name","123");//会自动创建name属性到vm.c上，且值为123
	//$delete方法移除属性时，无论是响应数据（active data）还是非响应数据（reactive data），都会触发属性变化事件
	vm.$delete(vm.c, "sex");//输出up   老师好 up   老师好
	vm.$delete(vm.c, "name");//输出up   老师好 up   老师好
	
	//vm.$set 对应 Vue下面的set
	Vue.set(vm.c,"name","123");
	//vm.$delete 对应 Vue.delete
	Vue.delete(vm.c,"name");
	
</script>

</body>
</html>