<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!--截取项目的名称  -->
<c:set var="path" value="${pageContext.request.contextPath}" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>修改</title>
	<link rel="stylesheet" type="text/css" href="static/layui/css/layui.css">
	<style type="text/css">
		.layui-form{
			width: 50%;
			margin-left: 10%;
			margin-top: 5%;
		}
		.layui-input-block{
			margin-top: 50px;
		}
		.blank{
			margin-left: 50%;
		}
	</style>
</head>
<body>
	<form class="layui-form">
	  <div class="layui-form-item">
	    <label class="layui-form-label">真实姓名</label>
	    <div class="layui-input-block">
	      <input type="text" id="name" name="name" required  lay-verify="required" value="${user.name }" placeholder="请输入真实姓名" autocomplete="off" class="layui-input">
		</div>
	 </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">用户名</label>
	    <div class="layui-input-block">
	      <input type="text" id="userName" name="userName" required lay-verify="required" value="${user.userName }" placeholder="请输入用户名" autocomplete="off" class="layui-input">
	   	</div>
	  </div>
		<div class="layui-form-item">
			<label class="layui-form-label">职位</label>
			<div class="layui-input-block">
				<select id="roleId" name="roleId">
					<option value="0">--请选择职位--</option>	
					<c:forEach var="role" items="${roleList }">
						<option value="${role.roleId }" ${role.roleId == user.roleId ? 'selected':'' }>${role.roleName }</option>
					</c:forEach>				
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<h5 id="liandong">选择职业后，选择上级</h5>
			</div>
		</div>
		<div style="text-align: center;  font-size: 16px;" ><span id="spanId"></span></div>
		<div class="layui-form-item">
	    <div class="layui-input-block">
	      <input type="button" class="layui-btn" lay-submit lay-filter="formDemo"  value="立即提交" onclick="check();">
	      <span class="blank"></span>
	      <input type="button" class="layui-btn" lay-submit lay-filter="formDemo" value="回退" onclick="javascript:history.go(-1);">
	      <input type="reset" class="layui-btn" lay-submit lay-filter="formDemo" onclick="" value="重置">
	    </div>
	  </div>
	</form>
<script type="text/javascript" src="static/layui/layui.js"></script>
<script>
//Demo
layui.use('form', function(){
  var form = layui.form;
});
</script>
<script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">		
	
	
	//真实姓名
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
	//用户名
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
				url : "checkUserName",
				type : "post",
				data : "userName=" + userName,
				dataType : "json",
				success : function callBack(data) {
					var result = data[0].result;
					if (result == "true") {
						$("#spanId").css("color", "red");
						$("#spanId").html("×,此用户名不可用");
						$("#userName").focus();
						return false;
					} else {
						$("#spanId").css("color", "green");
						$("#spanId").html("√");
						return true;
					}
				},
				error : function() {
					alert("判断有误");
				}
			});
		}
	});

	//注册
	function check() {
		var name = $("#name").val();
		var userName = $("#userName").val();
		var password = $("#password").val();
		var roleId = $("#roleId").val();
		if (name == null || name == "") {
			alert("真实姓名不能为空");
			return false;
		} else if (userName == null || userName == "") {
			alert("用户名不能为空");
			return false;
		}  else if (roleId == "0") {
			alert("请选择一种职位");
			return false;
		} else {
			//ajax验证
			$.ajax({
				url : "updateUser2",
				type : "post",
				data : {
					"userId": ${user.userId},
					"name" : name,
					"userName" : userName,
					"roleId" : roleId
				},
				success : function callBack(data) {
					var json = eval('(' + data + ')');
					if (json.status == 1) {
						alert(json.message);
						location.href = "userList";
					}
				},
				error : function() {
					alert("修改出现异常!");
				}
			});
		}
	}
</script>
</body>