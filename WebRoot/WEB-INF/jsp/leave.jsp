<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>医生管理</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="static/layui/css/layui.css" media="all">
<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
<style type="text/css">
.layui-table {
	width: 50%;
	margin-left: 25%;
}
 .blank2{
            margin-top: 15px;
            margin-left: 100px;
        }

</style>

<link href="static/css/bootstrap.min.css" rel="stylesheet" />
<script src="static/js/jquery-1.8.2.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script type="text/javascript"
	th:src="@{https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js}"></script>
<link
	th:href="@{https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css}"
	rel="stylesheet" />
<link th:href="@{/css/default.css}" rel="stylesheet" />
<style type="text/css">
		.layui-form{
			width: 50%;
			margin-left: 10%;
			margin-top: 5%;
		}
		.layui-input-block{
			margin-top: 50px;
		}
		
	</style>
</head>
<body>
	<br>
	
		<div style="margin-left:15px; ">
			<input type="button" class="btn btn-success" value="新增" onclick="addLeave();"/>
			<a href="#" class="btn btn-primary" data-toggle="model" data-target="#" onclick="alldel()">批量删除</a>
			<input type="button"  value="反选" class="btn btn-warning" onclick="uselectAll()">
		</div>
	<br>
	<table class="table table-bordered">
		<tr style="text-align: center;">
			<td ><input type="checkbox" id="SelectAll" onclick="selectAll()"/></td>
			<td>请假姓名</td>
			<td>职位</td>
			<td>上级</td>
			<td>请假原因</td>
			<td>请假时间</td>
			<td>请假天数</td>
			<td colspan="2">审核</td>
		</tr>
		<c:forEach var="leave" items="${leavelist }">
		<c:if test="${sessionScope.user.roleId == 1 || leave.role.roleSuperior == sessionScope.user.roleId+1}">
			<tr style="text-align: center;">
				<td><input type="checkbox"name="userId" value="${leave.leaveId }"></td>
				<td>${leave.user.name }</td>
				<td>${leave.role.roleName }</td>
				<td><c:if test="${leave.role.roleSuperior == 1 }">董事长</c:if>
					<c:if test="${leave.role.roleSuperior == 2 }">总经理</c:if>
					<c:if test="${leave.role.roleSuperior == 3 }">总监</c:if>
					<c:if test="${leave.role.roleSuperior == 4 }">主管</c:if>
					<c:if test="${leave.role.roleSuperior == 5 }">组长</c:if>
				</td>
				<td>
					<c:if test="${leave.leaveState == 1 }">出差</c:if>
					<c:if test="${leave.leaveState == 2 }">事假</c:if>
					<c:if test="${leave.leaveState == 3 }">病假</c:if>
					<c:if test="${leave.leaveState == 4 }">年休假</c:if>
					<c:if test="${leave.leaveState == 5 }">丧假</c:if>
				</td>
				<td><fmt:formatDate value="${leave.leaveTime }" pattern="yyyy年MM月dd日"/></td>
				<td>${leave.leaveDays }天</td>
				<td>
					${leave.leaveAdopt ==0 ?'待审核':''}
					${leave.leaveAdopt ==1 ?'审核通过':''}
					${leave.leaveAdopt ==2 ?'审核拒绝':''}
				</td>
				<td>
					<c:if test="${leave.leaveAdopt ==0 }">
						<a href="javascript:void(0)" onclick="ok('1','${leave.leaveId}')" class="btn btn-info">同意</a>&nbsp;&nbsp;
        				<a href="javascript:void(0)" onclick="ok('2','${leave.leaveId}')" class="btn btn-danger">拒绝</a>
					</c:if>
					<c:if test="${leave.leaveAdopt !=0 }">
						您已审核完成
					</c:if>
					
				</td>
			</tr>
			</c:if>
		</c:forEach>
	</table>

	<script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript">
		//路径跳转
		function addLeave(){
			location.href="addleave";
		}
		
		//审批请假信息
		function ok(leaveAdopt,leaveId){
			$.ajax({
				url			:		"updateleave",
				type		:		"post",
				data		:		{
					"leaveAdopt"	:	leaveAdopt,
					"leaveId"		:	leaveId
				},
				success		:		function callBack(data) {
					var json = eval('(' + data + ')');
					if (json.status == 1) {
						alert(json.message);
						location.href = "leave";
					}
				},
				error : function() {
					alert("修改出现异常!");
				}
			});
		}
		
		
		//全选的功能
		function selectAll(){
			var ck =document.getElementsByName("userId");//得到一组checkbox  相当于数组
        	var cak =document.getElementById("SelectAll");
			if(cak.checked==true){
            	//循环这一组checkbox让每一个checkbox选中
            	for(var i=0;i<ck.length;i++){
                	var c=ck[i];//得到一个checkbox
                	c.checked=true;//false代表不选
            	}
			}else{
				for(var i=0;i<ck.length;i++){
                	var c=ck[i];//得到一个checkbox
               		c.checked=false;//false代表不选
            	}
			}
		}
		//反选
		function uselectAll(){//先得到所有的checkbox
        var ck=document.getElementsByName("userId");//得到一组checkbox  相当于数组
        var cak=document.getElementById("SelectAll");
        if(cak.checked==true)
            cak.checked=false;
        for(var i=0;i<ck.length;i++){
            var c=ck[i];//得到一个checkbox
            if(c.checked==true){//如果当前的checkbox是选中的则不让其选中
                ck[i].checked=false;
            }else{
                ck[i].checked=true;
            }
        }
    }
    
    
	
		//批量删除
		function alldel(){
		var checkedNum = $("input[name='userId']:checked").length;
		if(checkedNum == 0){
			alert("请至少选择一项");
			return false;
		}
		if(confirm("确定删除所选用户?")){
            var checkedList = new Array();
            $("input[name='userId']:checked").each(function(){
                checkedList.push($(this).val());
            });
            $.ajax({
                type:"POST",
                url:"deleteall",
                data:{"delitems":checkedList.toString()},
                datatype:"json",
                success:function(data){
                    var json = eval('(' + data + ')');
					if (json.status == 1) {
						alert(json.message);
						window.location.reload();
					}
                },
                error:function(data){
                    alert("删除失败！");
                    window.location.reload();
                }
            });
        }
	}
	
	
	</script>
</body>
</html>
