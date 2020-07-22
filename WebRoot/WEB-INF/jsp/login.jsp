<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<form action="index" method="get" id="from">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title text-center" id="myModalLabel">demo简易登录</h4>
			</div>
			<div class="modal-body" id="model-body">
				<div class="form-group">

					<input type="text" class="form-control" placeholder="用户名" autocomplete="off" id="userName" name="userName" >
				</div>
				<div class="form-group">

					<input type="password" class="form-control" placeholder="密码" autocomplete="off" id="password" name="password">
				</div>
			</div>
			<div style="text-align: center;  font-size: 16px;" ><span id="spanId1"></span></div>
			<div style="text-align: center;  font-size: 16px;" ><span id="spanId2"></span></div>
			<div class="modal-footer">
				<div class="form-group">
					<!-- <button type="submit" class="btn btn-primary form-control" id="btnlogin" onclick="check();">登录</button> -->
					<button type="button" class="btn btn-primary form-control" id="btnlogin" onclick="login();">登录</button>
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
		var flag = false;
		$("#userName").blur(function() {
			var userName = $("#userName").val();
			if (userName == null || userName == "") {
				$("#spanId1").css("color", "red");
				$("#spanId1").html("×,用户名不能为空");
				$("#userName").focus();
				flag = false;
			} else {
				$("#spanId1").css("color", "green");
				$("#spanId1").html("√");
				flag = true;
			}
		});
		var flag = false;
		$("#password").blur(function() {
			var password = $("#password").val();
			if (password == null || password == "") {
				$("#spanId2").css("color", "red");
				$("#spanId2").html("×,密码不能为空");
				$("#password").focus();
				flag = false;
			} else {
				$("#spanId2").css("color", "green");
				$("#spanId2").html("√");
				flag = true;
			}
		}); 
	
		//保存点击事件	
		$("#btnlogin").click(function(){
			if(flag== true){
				$("#form").submit();
			}else{
  				alert("您还有信息没填写完成");
  			}	
		});
		
		//登录
		function login(){
			var userName = $("#userName").val();
			var password = $("#password").val();
			location.href="index?userName=" + userName + "&password=" + password;
		}
		
		
		//注册
		function register(){
			location.href="register";
		}
	
	
		/* function check() {
			var userName = $("#userName").val();
			var password = $("#password").val();
			if (userName == "" || userName == null) {
				alert("用户名不能为空");
				return false;
			} else if (password == null || password == "") {
				alert("密码不能为空");
				return false;
			} else {
				//ajax验证
				$.ajax({
					url : "index2",
					type : "get",
					data : {
						"userName" : userName,
						"password" : password
					},
					success : function(jsonStr) {
						var result = eval("(" + jsonStr + ")");
						if (result.status == 1) {
							location.href = "index";
						} else {
							alert('操作提醒', result.message);
						}
					},
					error : function() {
						alert("登录发生错误!");
					}
				});
			}
		} */
			
	
	
		/* $("#userName").blur(function() {
			var userName = $("#userName").val();
			if (userName == null || userName == "") {
				$("#spanId").css("color", "red");
				$("#spanId").html("×,用户名不能为空");
				$("#userName").focus();
				return false;
			} else {
				$("#spanId").css("color", "green");
				$("#spanId").html("√");
				return true;
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
		}); */
		/* function check() {
			var userName = $("#userName").val();
			var password = $("#password").val();
			//ajax验证
			$.ajax({
				url						:		"index",
				type					:		"post",
				data					:		{
					"userName"			:		userName,
					"password"			:		password
				},
				dataType				:		"json",
				success					:		function(jsonStr) {
						var result = eval("(" + jsonStr + ")");
						if (result.status == 1) {
							document.location= "register"
						}else{
							alert('操作提醒', result.message);
						}
				},
				error					:		function(){
					alert("登录发生错误!");
				}	
			});
		} */
			
		
	</script>
</body>
</html>
