<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Employee List</title>
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.0/css/jquery.dataTables.css">
    <script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="//cdn.datatables.net/1.10.0/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src=".././js/jFormvalidator.js"></script>


    <script type="text/javascript">

        $(document).ready(function () {

            $("#example").dataTable({
                "bProcessing": false,
                "bServerSide": false,
                "sort": "position",
                "sAjaxSource": "list",
                "aoColumns": [
                    { "mData": "empId" },
                    { "mData": "firstName" },
                    { "mData": "lastName" },
                    { "mData": "phone" },
                    { "mData": "city" },
                    { "mData": "state" },
                    { "mData": "dateOfBirth" },
                    { "mData": "zip" },
                    
                    {     // fifth column (Edit link)
                        "mData": "Id",
                        "bSearchable": false,
                        "bSortable": false,
                        "mRender": function (data, type, full) {
                            var id = full[0]; //row id in the first column
                            return "<a href='edit?id=" + data + "'>Edit</a> ";
                            
                            
                        }
                        
                    }

                ]


            });

        });

    </script>


</head>
<body bgcolor="#CECEFF">

<table style="width: 100%">
    <tr bgcolor="#FFFFE1">
        <td style="height: 27px"></td>
        <td class="auto-style2" style="width: 642px; height: 27px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="auto-style7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Employee
			List </span></td>
        <td class="auto-style6" style="height: 27px">&nbsp;<span class="auto-style7"> <a href="/HRAdmin/add">
			New Employee </a></span>&nbsp;</td>
    </tr>
</table>

<form:form id="registerForm" modelAttribute="employee" method="post"
           action="">


    <h2>Employee Records<br><br></h2>
    <table width="70%" style="border: 3px;background: rgb(243, 244, 248);">
        <tr>
            <td>
                <table id="example" class="display" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th>Employee ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Phone</th>
                        <th>City</th>
                        <th>State</th>
                        <th>DOB</th>
                        <th>Zip</th>
                        <th>Edit</th>
                    </tr>
                    </thead>
                </table>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>