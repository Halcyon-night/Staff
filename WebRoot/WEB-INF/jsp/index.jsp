<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!doctype html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>demo测试</title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <meta http-equiv="Cache-Control" content="no-siteapp" />
		<link rel="stylesheet" href="static/layui/css/layui.css">
		<link rel="stylesheet" href="static/css/font.css">
        <link rel="stylesheet" href="static/css/xadmin.css">
        <script src="static/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="static/js/xadmin.js"></script>
        <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
        <!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script>
             //是否开启刷新记忆tab功能
             var is_remember = false;
        </script>
    </head>
    <body class="index">
        <!-- 顶部开始 -->
        <div class="container">
            <div class="logo">
                <a href="">demo</a></div>
            <div class="left_open">
                <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
            </div>
            <ul class="layui-nav right" lay-filter="">
                <li class="layui-nav-item" style="margin-right: 30px;">
                 	<span>欢迎您</span>	<span style="color:red;">${user.name }</span>
                </li>
                <li class="layui-nav-item to-index">
                    <a href="login">退出</a>
                </li>
            </ul>
        </div>
        <!-- 顶部结束 -->
        <!-- 中部开始 -->
        <!-- 左侧菜单开始 -->
		<div class="left-nav">
            <div id="side-nav">
				<ul id="nav">
					<li>
						<a href="javascript:;"> 
							<i class="iconfont left-nav-li" lay-tips="用户管理">&#xe6b8;</i> 
								<cite>用户管理</cite>
							<i class="iconfont nav_right">&#xe697;</i>
						</a>
						<ul class="sub-menu">
							<li>
								<a onclick="xadmin.add_tab('增加用户','addUser')"> 
									<i class="iconfont">&#xe6a7;</i> 
										<cite>增加用户</cite>
								</a>
							</li>
							<li>
								<a onclick="xadmin.add_tab('用户信息','userList')">
									<i class="iconfont">&#xe6a7;</i> 
									<cite>管理用户</cite>
								</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="javascript:;"> 
							<i class="iconfont left-nav-li" lay-tips="请假管理">&#xe723;</i> 
								<cite>请假管理</cite> 
							<i class="iconfont nav_right">&#xe697;</i>
						</a>
						<ul class="sub-menu">
							<li>
								<a onclick="xadmin.add_tab('增加请假','addleave')"> 
									<i class="iconfont">&#xe6a7;</i> 
										<cite>增加请假</cite>
								</a>
							</li>
							<li>
								<a onclick="xadmin.add_tab('请假信息','leave')">
									<i class="iconfont">&#xe6a7;</i> 
										<cite>管理请假</cite>
								</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
        </div>
	<div class="x-slide_left"></div>
        <!-- 左侧菜单结束 -->
        <!-- 右侧主体开始 -->
	<div class="page-content">
		<div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
			<ul class="layui-tab-title">
				<li class="home">
					<i class="layui-icon">&#xe68e;</i>我的桌面
				</li>
			</ul>
			<div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
				<dl>
					<dd data-type="this">关闭当前</dd>
					<dd data-type="other">关闭其它</dd>
					<dd data-type="all">关闭全部</dd>
				</dl>
			</div>
			<div class="layui-tab-content">
				<div class="layui-tab-item layui-show">
					<!-- 路径跳转,显示首页信息 -->
					<iframe src='welcome' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
				</div>
			</div>
			<div id="tab_show"></div>
		</div>
	</div>
	<div class="page-content-bg"></div>
        <!-- 右侧主体结束 -->
        <!-- 中部结束 -->
	<script type="text/javascript">
	</script>
    </body>
</html>