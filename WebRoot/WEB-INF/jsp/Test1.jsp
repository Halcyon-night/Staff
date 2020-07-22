<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>主页面</title>
        <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <!-- <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" /> -->
        <meta http-equiv="Cache-Control" content="no-siteapp" />
		<link rel="stylesheet" href="static/layui/css/layui.css">
		<link rel="stylesheet" href="static/css/font.css">
        <link rel="stylesheet" href="static/css/xadmin.css">
   
        <script src="static/layui/layui.js" charset="utf-8"></script> 
        <script type="text/javascript" src="static/js/xadmin.js"></script>
      
      
        <script>
            //是否开启刷新记忆tab功能
             var is_remember = false;
        </script>
        	<style type="text/css">
         tr{
         	height: 30px;
         	align:center;
         }
         td{
         	width: 80px;
         	text-align:center;
         }
        </style>
    </head>
    <body class="index">
        <!-- 顶部开始 -->
        <div class="container">
            <div class="logo">
                <a>联系</a></div>
            <div class="left_open">
                <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
            </div>
            <ul class="layui-nav right" lay-filter="">
                <li class="layui-nav-item" style="margin-right: 30px;">
                 	欢迎您!  ${sessionScope.userc.name }
                </li>
                <li class="layui-nav-item to-index">
                    <a href="index">退出</a></li>
            </ul>
        </div>
       
        <!-- 左侧菜单开始 -->
        <div class="left-nav">
            <div id="side-nav">
                <ul id="nav">
                <c:forEach var="list" items="${list }">
                    <li>
                        <a href="javascript:;" id="${list.menu_id }" class="${list.menu_id }">
                            <i class="iconfont left-nav-li" lay-tips="">&#xe6b8;</i>
                            <cite onclick="${list.menu_id }()" >${list.menu_name }</cite>
              
                         </a>
                    </li>
                   </c:forEach>
                  </ul>
            </div>
        </div>
        
         <div align="center" id="user" style="margin-top:50px">
         <h1 class="page-contents">
	         <c:forEach var="role" items="${rolelist }" >
				${role.roleName }
			</c:forEach>
		</h1>
         	<input type="button" class="layui-btn" lay-submit lay-filter="formDemo"  value="立即提交" onclick="adduser();">
         </div>
         
         <div class="qing" align="center" id="qing" style="margin-top:50px">
        </div>
    </body>
     <script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
     <script>
     //跳转添加页面
     function adduser(){
     		$(".page-contents").removeClass();
     		$("#user").load("Test3 .page-contents");
      }
      
     </script>
</html>