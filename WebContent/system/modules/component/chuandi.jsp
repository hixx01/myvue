<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>组件定义</title>
<script type="text/javascript" src="/myvue/system/lib/vue/vue.js"></script>
</head>
<body>

<div id="app">
	
	<child v-bind:pmsg="msg" ref="child" @increase="onIncrease"></child>
	
</div>
<script type="text/javascript">
	/**
	**1.父类的信息传递给子类
	   1).当子类绑定父类的响应式数据时，父类的响应式数据发生改变，则信息自动传递到子类中
	   2).$refs获取子类实例，通过子类实例对子类修改
	         子类修改来自父类的绑定属性时，组件内部内容会修改，但不会传递到父类中。
	*/
	//2.子类信息传递给父类
	//
	//vm.$on 或 v-on 绑定监听事件的函数
	//vm.$emit  派发事件的函数
	//vm.$once  绑定的事件仅生效一次
	//vm.$off   解除事件绑定
	//第一种组件定义方式
	Vue.component("child",{
		props : ['pmsg'],
		template : "<div @click='childClick'>{{pmsg}}这是child组件内容{{msg}} <cdiv></cdiv></div>",
		//给组件本身提供数据，data的值必须是个函数，函数返回的数据是当前组件需要的数据
		data:function(){
			return {
				msg : '：：：：：child组件内部消息',
				index : 1
			}
		},
		//组件本身的事件函数仍然写在methods属性里面
		methods:{
			childClick:function(){
				this.index++;
				
				this.$emit("increase", this.index, this.msg);
				this.$emit("increase2", this.index, this.msg);
				this.$emit("increase3", this.index, this.msg);
			}
		},
		//可以继续定义当前组件的子组件
		components : {
			"cdiv" : {
				template : "<div>  cdivcdivcdiv  </div>"
			}
		}
	});
	
	//
	var vm = new Vue({
		el:'#app',
		data : {
			msg : "父组件消息"
		},
		methods:{
			onIncrease : function(index, cmsg){
				console.log("----vm输出----")
				console.log(index);
				console.log(cmsg);
				console.log("----vm输出----")
				
				this.$refs.child.$off("increase");
			}
		}
	});
	//事件是由子类抛出，因此绑定事件的对象应该是子类的vue实例
	vm.$refs.child.$on("increase2", function(index, cmsg){
		console.log("----vm输出   increase2----")
		console.log(index);
		console.log(cmsg);
		console.log("----vm输出  increase2----")
	})
	//事件是由子类抛出，因此绑定事件的对象应该是子类的vue实例
	vm.$refs.child.$once("increase3", function(index, cmsg){
		console.log("----vm输出   increase3----")
		console.log(index);
		console.log(cmsg);
		console.log("----vm输出  increase3----")
	})

</script>
</body>
</html>