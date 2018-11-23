<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="basePath">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录页面</title>
</head>
<body>
	<h3>登录页面</h3>
	<form action="${basePath}demo/doLogin.action" method="post">
		用户名:<input type="text" name="uname"/><br/>
		密码:<input type="password" name="upwd"/><br/>
		<input type="submit" value="登录"/><span style="color:red">${msg }</span>
	</form>
</body>
</html>
