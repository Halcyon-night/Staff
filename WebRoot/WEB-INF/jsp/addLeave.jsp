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
	<title>增加</title>
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
			<label class="layui-form-label">请假人</label>
			<div class="layui-input-block">
				<select id="leave_userId" name="leave_userId">
					<option value="0">--请选择请假人--</option>	
					<c:forEach var="user" items="${userlist }">
						<option value="${user.userId }">${user.name }</option>
					</c:forEach>				
				</select>
			</div>
		</div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">职位</label>
			<div class="layui-input-block">
				<select id="leave_roleId" name="leave_roleId">
					<option value="0">--请选择职位--</option>
					<c:forEach var="role" items="${rolelist }">
						<option value="${role.roleId }">${role.roleName }</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
	    <label class="layui-form-label">请假原因</label>
			<div class="layui-input-block">
				<select id="leaveState" name="leaveState">
					<option value="0">--请选择原因--</option>
					<option value="1">出差</option>
					<option value="2">事假</option>
					<option value="3">病假</option>
					<option value="4">年休假</option>
					<option value="5">丧假</option>
				</select>
			</div>
		</div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">请假时间</label>
	    <div class="layui-input-block">
	      <input type="text" id="leaveTime" name="leaveTime" required  lay-verify="required" value="" placeholder="请输入请假时间" autocomplete="off" class="layui-input">
	    </div>
	  </div>
		<div class="layui-form-item">
			<label class="layui-form-label">请假天数</label>
			<div class="layui-input-block">
				<input type="text" id="leaveDays" name="leaveDays" required  lay-verify="required" value="" placeholder="请输入请假天数" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">审核</label>
			<div class="layui-input-block">
				<select id="leaveAdopt" name="leaveAdopt">
					<option value="0">待审核</option>
				</select>
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
	
	function check() {
		var leave_userId = $("#leave_userId").val();
		var leave_roleId = $("#leave_roleId").val();
		var leaveState = $("#leaveState").val();
		var leaveTime = $("#leaveTime").val();
		var leaveDays = $("#leaveDays").val();
		var leaveAdopt = $("#leaveAdopt").val();
		if (leave_userId == "0") {
			alert("请假人不能为空");
			return false;
		} else if (leave_roleId == "0") {
			alert("请选择上级");
			return false;
		} else if (leaveState == "0") {
			alert("请选择请假原因");
			return false;
		} else if (leaveTime == null || leaveTime == "") {
			alert("请假时间不能为空");
			return false;
		} else if(leaveDays == null || leaveDays == ""){
			alert("请假天数不能为空");
			return false;
		}else {
			//ajax验证
			$.ajax({
				url : "addleave2",
				type : "post",
				data : {
					"leave_userId" : leave_userId,
					"leave_roleId" : leave_roleId,
					"leaveState" : leaveState,
					"leaveTime" : leaveTime,
					"leaveDays"	: leaveDays,
					"leaveAdopt":leaveAdopt
				},
				success : function callBack(data) {
					var json = eval('(' + data + ')');
					if (json.status == 1) {
						alert(json.message);
						location.href = "leave";
					}
				},
				error : function() {
					alert("添加出现异常!");
				}
			});
		}
	}
	
	
	
</script>
</body>