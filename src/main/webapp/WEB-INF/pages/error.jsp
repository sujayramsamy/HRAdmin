<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>AccessDenied page</title>
</head>
<body>
	An Error Occurred while processing your request, Please login and try your request again..
	<a href="<c:url value="/logout" />">Logout</a>
	
	<a href="hrModule.html">Click here to continue to HR module </a>
</body>
</html>