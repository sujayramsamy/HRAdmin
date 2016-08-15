	
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<html lang="en">
<head>
   <meta charset="utf-8">
   
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <meta name="viewport" content="width=device-width"/>
   <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
   <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js"></script>
   
   <script>
      //Configuration
          
      $(document).ready(function() {
         $("#loginForm").validate({
            rules: {
               username: {
                  required: true,
            
               },
               password: {
                  required: true,
           
               },
            },
            messages: {
               username: {
                  required: "Username is required",
               },
               password: {
                  required: "Password is required",
                }
            }
         });
      });
   </script>
   </head>
<body bgcolor="#EAEBF7">
  <%
 
String errorString = (String)request.getAttribute("error");
if(errorString != null && errorString.trim().equals("true")){
out.println("<span class=\"dark\">Incorrect login name or password. Please try again");
}
%>
<form id ="loginForm" action="login" method='POST'>
   
      <fieldset>
         <legend>Admin Login</legend>
         <p>
            <label for="username">Username</label>
            <input id="username" name="username" type="text">
         </p>
         <p>
            <label for="password">Password</label>
            <input id="password" name="password" type="password">
         </p>
         <p>
            <input class="submit" type="submit" value="Submit">
         </p>
      </fieldset>
   </form>
</html></body>
