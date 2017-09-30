<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/myvue/system/lib/vue/vue.js"></script>
</head>
<body>

<script type="text/javascript">
	
	var vm = new Vue({
		data:{
			a : 123,
			b : 'abc'
		},
		computed : {
			/**
			**  computed内部属性可以定义get和set方法用于读取计算后的data属性里的数据
			**  访问aDouble属性即是调用内部的get和set方法，而不需要直接访问get和set方法
			**  computed内部属性直接挂载在vm实例上，和data里的数据一样 
			**  当不声明set方法时，指定数据只能读取，不能覆盖
			**/
			aDouble : {
				get : function(){
					return this.a * 2;
				},
				set : function( v ){
					this.a = v * 2;
				}
			},
			
			bPlus : function(){
				return this.b + "def";
			}
		}
	});

</script>

</body>
</html>