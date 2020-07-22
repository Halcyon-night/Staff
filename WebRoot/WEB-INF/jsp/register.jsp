<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- <title>love</title> -->
<title>love</title>
<link href="favicon.ico" rel="shortcut icon" />
<link href="static/css/bootstrap.min.css" rel="stylesheet">
</head>
<!-- <body style=" background: url(static/img/3DB3B3E17F23702750E1894B8AFC3478.jpg) no-repeat center center fixed; background-size: 100%;"> -->
<body style=" background: url(static/img/7CA0C065BFFF3CF1A717FB7F222CE5D1.jpg) no-repeat center center fixed; background-size: 100%;">
	<!-- http://global.bing.com/az/hprichbg/rb/RavenWolf_EN-US4433795745_1920x1080.jpg -->
	<div class="modal-dialog" style="margin-top: 10%;">
	<!-- 登录action -->
	<form action="" method="get">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title text-center" id="myModalLabel">demo简易注册</h4>
			</div>
			<div class="modal-body" id="model-body">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="真实姓名" autocomplete="off" id="name" name="name">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="用户名" autocomplete="off" id="userName" name="userName" >
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="密码" autocomplete="off" id="password" name="password">
				</div>
				<div class="form-group">
					<select class="form-control" id="roleId" name="roleId" onchange="linkage();">
						<option value="0">--请选择职位--</option>	
						<c:forEach var="role" items="${roleList }">
							<option value="${role.roleId }">${role.roleName }</option>
						</c:forEach>				
					</select>
				</div>
				<div class="form-group">
					<h5 id="liandong">选择职业后，选择上级</h5>
					<div></div>
				</div>
			</div>
			<div style="text-align: center;  font-size: 16px;" ><span id="spanId"></span></div>
			<div class="modal-footer">
				<div class="form-group">
					<button type="button" class="btn btn-primary form-control" onclick="check();">登录</button>
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-default form-control" onclick="register();">注册</button>
				</div>

			</div>
		</div>
		<!-- /.modal-content -->
		</form>
	</div>
	<!-- /.modal -->
<script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript">
		//二级联动
		function linkage(){
			var roleId = $("#roleId").val();
			if(roleId == "0"){
				$("#liandong").html("上级名称:暂无上级");
			}else{
				$.ajax({
					url				:		"linkage",
					type			:		"post",
					data			:		"roleId="+ roleId,
					success			:		function callBack(data){
						var json = eval('('+data+')');
						if(json.status == 1){
							$("#liandong").html(json.message);
						}else{
							$("#liandong").html(json.message);
						}
					},
					error 			:		function(){
						$("#liandong").html(json.message);
					}
				});
			}
		}
	
		$("#name").blur(function() {
			var name = $("#name").val();
			if (name == null || name == "") {
				$("#spanId").css("color", "red");
				$("#spanId").html("×,真实姓名不能为空");
				$("#name").focus();
				return false;
			} else {
				$("#spanId").css("color", "green");
				$("#spanId").html("√");
				return true;
			}
		}); 
	
	
	
		$("#userName").blur(function() {
			var userName = $("#userName").val();
			if (userName == null || userName == "") {
				$("#spanId").css("color", "red");
				$("#spanId").html("×,用户名不能为空");
				$("#userName").focus();
				return false;
			} else {
				//使用ajax验证用户名是否存在
				$.ajax({
					url				:				"checkUserName",
					type			:				"post",
					data			:				"userName=" + userName,
					dataType		:				"json",
					success			:				function callBack(data){
						var result = data[0].result;
						if(result == "true"){
							$("#spanId").css("color", "red");
							$("#spanId").html("×,此用户名不可用");
							$("#userName").focus();
							return false;
						}else {
							$("#spanId").css("color", "green");
							$("#spanId").html("√");
							return true;
						}
					},
					error			:				function(){
						alert("判断有误");
					}
				});
			}
		});
		
		$("#password").blur(function() {
			var password = $("#password").val();
			if (password == null || password == "") {
				$("#spanId").css("color", "red");
				$("#spanId").html("×,密码不能为空");
				$("#password").focus();
				return false;
			} else {
				$("#spanId").css("color", "green");
				$("#spanId").html("√");
				return true;
			}
		}); 
		
		/* $("#roleId").blur(function() {
			var roleId = $("#roleId").val();
			if (roleId == "0") {
				$("#spanId").css("color", "red");
				$("#spanId").html("×,请选择一种职位");
				$("#roleId").focus();
				return false;
			} else {
				$("#spanId").css("color", "green");
				$("#spanId").html("√");
				return true;
			}
		});  */
		
		//注册
		function check(){
			var name = $("#name").val();
			var userName = $("#userName").val();
			var password = $("#password").val();
			var roleId = $("#roleId").val();
			if(name == null || name == ""){
				alert("真实姓名不能为空");
				return false;
			}else if(userName == null || userName == ""){
				alert("用户名不能为空");
				return false;
			}else if(password == null || password == ""){
				alert("用户名密码不能为空");
				return false;
			}else if(roleId == "0"){
				alert("请选择一种职位");
				return false;
			}else{
				//ajax验证
				$.ajax({
					url  				:		"addregister",
					type				:		"post",
					data				:		{
						"name"			:		name,
						"userName"		:		userName,
						"password"		:		password,
						"roleId"		:		roleId
					},
					dataType			:		"json",
					success				:		function(data){
						var result = data[0].result;
						if (result == "1") {
							alert("注册信息成功!");
							document.location= "login"
						}else{
							alert("注册信息失败!");
						}
					},
					error : function() {
						alert("注册信息发生错误!");
					}
				})
			}
		}	
		//注册
		function register(){
			location.href="register";
		}
		
	</script>
</body>
</html>
