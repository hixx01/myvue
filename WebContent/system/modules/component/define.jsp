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
	
	<child v-bind:pmsg="msg" ref="child"></child>

</div>
<script type="text/javascript">
	//第一种组件定义方式
// 	Vue.component("child",{
// 		props : ['pmsg'],
// 		template : "<div @click='childClick'>{{pmsg}}这是child组件内容{{msg}} <cdiv></cdiv></div>",
// 		//给组件本身提供数据，data的值必须是个函数，函数返回的数据是当前组件需要的数据
// 		data:function(){
// 			return {
// 				msg : '：：：：：child组件内部消息'
// 			}
// 		},
// 		//组件本身的事件函数仍然写在methods属性里面
// 		methods:{
// 			childClick:function(){
// 				console.log(this);
// 				console.log("child元素被点击!");
// 			}
// 		},
// 		//可以继续定义当前组件的子组件
// 		components : {
// 			"cdiv" : {
// 				template : "<div>  cdivcdivcdiv  </div>"
// 			}
// 		}
// 	});
	
	//
	var vm = new Vue({
		el:'#app',
		data : {
			msg : "父组件消息"
		},
		
		components:{
			child:{
				props : ['pmsg'],
				template : "<div @click='childClick'>{{pmsg}}这是child组件内容{{msg}} <cdiv></cdiv></div>",
				//给组件本身提供数据，data的值必须是个函数，函数返回的数据是当前组件需要的数据
				data:function(){
					return {
						msg : '：：：：：child组件内部消息'
					}
				},
				//组件本身的事件函数仍然写在methods属性里面
				methods:{
					childClick:function(){
						console.log(this);
						console.log("child元素被点击!");
					}
				},
				//可以继续定义当前组件的子组件
				components : {
					"cdiv" : {
						template : "<div>  cdivcdivcdiv  </div>"
					}
				}
			}
		}
	});

</script>
</body>
</html>