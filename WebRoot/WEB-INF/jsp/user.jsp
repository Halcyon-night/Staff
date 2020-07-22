<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<input type="button" class="btn btn-success" value="新增" onclick="addUser();"/>
			<a href="#" class="btn btn-primary" data-toggle="model" data-target="#" onclick="alldel()">批量删除</a>
			<input type="button"  value="反选" class="btn btn-warning" onclick="uselectAll()">
		</div>
	<br>
	<table class="table table-bordered">
		<tr style="text-align: center;">
			<td><input type="checkbox" id="SelectAll" onclick="selectAll()"/></td>
			<td>真实姓名</td>
			<td>用户名</td>
			<td>职位</td>
			<td>上级</td>
			<td colspan="2">操作</td>
		</tr>
		<c:forEach var="user" items="${userlist }">
			<tr style="text-align: center;">
				<td><input type="checkbox"name="userId" value="${user.userId }"></td>
				<td>${user.name }</td>
				<td>${user.userName }</td>
				<td>${user.role.roleName }</td>
				<td>
					<c:if test="${user.role.roleSuperior == 1 }">董事长</c:if>
					<c:if test="${user.role.roleSuperior == 2 }">总经理</c:if>
					<c:if test="${user.role.roleSuperior == 3 }">总监</c:if>
					<c:if test="${user.role.roleSuperior == 4 }">主管</c:if>
					<c:if test="${user.role.roleSuperior == 5 }">组长</c:if>
				</td>
				<td><input type="button" class="btn btn-danger" value="删除" onclick="deleteUser(${user.userId})"/></td>
				<td><input type="button" class="btn btn-warning" value="修改" onclick="updateUser(${user.userId})"/></td>
			</tr>
		</c:forEach>
	</table>

	<script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript">
		//路径跳转
		function addUser(){
			location.href="addUser";
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
    
    
    //单个删除用户
    function deleteUser(userId){
    	alert(userId)
    	var dele = confirm("确定删除所选用户?");
    	if(dele == true){
    		$.ajax({
    			url			:		"deleteUser",
    			type		:		"post",
    			data		:		{
    				"userId"	:	userId
    			},
    			success		:		function callBack(data){
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
	
		//单个删除用户
		/* 	function dele(userId) {
				alert(userId);
				var $dele = confirm("确定要删除吗?");
				if ($dele == true) {
					$.ajax({
						url : "deleteUser",
						type : "post",
						data : {
							"userId" : userId
						},
						dataType : "json",
						success : function callBack(data) {
							var result = data[0].result;
							if (result == "1") {
								alert("删除成功!");
								location.href = "userList";
							} else {
								alert("删除失败!");
							}
						},
						error : function err() {
							alert("删除信息请求失败");
						}
					});
				}
			} */
	
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
	
	//路径跳转
	function updateUser(userId){
		window.location.href="updateUser?userId=" + userId;
	}
	
	</script>
</body>
</html>
