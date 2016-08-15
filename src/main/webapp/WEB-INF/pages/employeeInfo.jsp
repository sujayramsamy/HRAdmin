<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%@ taglib uri="http://www.springframework.org/tags/form"
	prefix="springForm"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<head>
<meta content="en-us" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>HR Admin</title>
<style type="text/css">
.auto-style1 {
	border-style: solid;
	border-width: 1px;
}

.auto-style2 {
	text-align: center;
}

.auto-style3 {
	font-family: Verdana, Geneva, Tahoma, sans-serif;
}

.auto-style4 {
	text-align: center;
	font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
}

.auto-style5 {
	color: #FF0000;
}

.auto-style6 {
	text-align: right;
}

.auto-style7 {
	font-family: "Trebuchet MS", "Lucida Sans Unicode", "Lucida Grande",
		"Lucida Sans", Arial, sans-serif;
}

.auto-style8 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: xx-small;
}

.auto-style9 {
	font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
}

.auto-style12 {
	font-family: Verdana, Geneva, Tahoma, sans-serif;
	text-align: right;
}

.auto-style13 {
	font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
}
</style>
<style>
.error {
	color: #ff0000;
	font-style: italic;
	font-weight: bold;
}

a.LinkButton {
	border-style: solid;
	border-width: 1px 1px 1px 1px;
	text-decoration: none;
	padding: 4px;
	border-color: #000000;
}
</style>
<script type="text/javascript" src=".././js/jFormvalidator.js"></script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
<script
	src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>
<!--  <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js"></script>
  -->



<script type="text/javascript">
        $(document).ready(function () {
            $("#number_filters a").click(function () {
                $("#number").val(${'hrModule/getList'});
                return false;
            });
        });




    </script>



<script>
      //Configuration
          
      $(document).ready(function() {
         $("#myForm").validate({
            rules: {
               empId: {
                  required: true,
               },
                firstName: {
                  required: true,
                  letters : true
               },
               lastName: {
               required: true,
                  required: true,
               },
                ssn: {
                  required: true,
                  SocialSecurity:true
               },
                phone: {
                  required: true,
                  phoneUS : true,
            		
           	    },
                address: {
                  required: true,
               },
               zip: {
                  required: true,
                  zipcodeUS:true
               },
               
                city: {
                  required: true,
                  letters:true
               },
                 state: {
                  required: true,
                  letters:true
               },
               dateOfBirth:{
                 required: true,
                 AccurateDate:true
               }
               
              
            },
            messages: {
               empId: {
                  required: "Employee ID is required",
               },
                firstName: {
                  required: "First Name is required",
                  letters : 'Please enter letters only',
               },
                lastName: {
                  required: "Last Name is required",
               },
                address: {
                  required: "Address is required",
               },
                ssn: {
                  required: "SSN is required",
                  SocialSecurity:"Please enter a valid SSN valid formats are 333-33-333 or 333333333",
               },
                zip: {
                  required: "zipcode is required",
                  zipcodeUS:"The specified US ZIP Code is invalid",
               },
                phone: {
                  required: "Phone is required",
                  phoneUS:"Please specify a valid phone US number fromat",
               },
               city: {
                  required: "City Name is required",
                  letters : 'Please enter letters only',
               },
               state: {
                  required: "State Name is required",
                  letters : 'Please enter letters only',
               },
              dateOfBirth:{
               required: "State Name is required",
               AccurateDate:"Please enter valid date valid patten MM/DD/YYYY"
              }  
               
               
            }
         });
 
      });
   
    
   </script>


<script>
   
   $.validator.addMethod('letters', function(value) {
    return value.match(/^[- a-zA-Z]+$/);
});

$.validator.addMethod("phoneUS", function(phone_number, element) {
    phone_number = phone_number.replace(/\s+/g, "");
    return this.optional(element) || phone_number.length > 9 && 
    phone_number.match(/^(\+?1-?)?(\([2-9]\d{2}\)|[2-9]\d{2})-?[2-9]\d{2}-?\d{4}$/);
});
  
  $.validator.addMethod("zipcodeUS", function(value, element) {
    return this.optional(element) || /\d{5}-\d{4}$|^\d{5}$/.test(value)
});
  
  $.validator.addMethod('SocialSecurity',
    function (value) { 
        return validSSN(value) || value == "";
    }
);

$.validator.addMethod("AccurateDate", function(value) {
  var checkdate = $("#dob").val();
  var rawmonth = checkdate.substr(0,2);
  var rawday   = checkdate.substr(3,2);
  var rawyear  = checkdate.substr(6,4);
  var checkdate = new Date( $("#dob").val());
  return ( (rawmonth == checkdate.getMonth()+1) &&
         (rawday == checkdate.getDate()) &&
         (rawyear == checkdate.getFullYear())
        );
 });

function validSSN(value) {
    var regex = /^([0-6]\d{2}|7[0-6]\d|77[0-2])([ \-]?)(\d{2})\2(\d{4})$/;
    if (!regex.test(value)) {
        return false;
    }
    var temp = value;
    if (value.indexOf("-") != -1) {
        temp = (value.split("-")).join("");
    }
    if (value.indexOf(" ") != -1) {
        temp = (value.split(" ")).join("");
    }
    if (temp.substring(0, 3) == "000") {
        return false;
    }
    if (temp.substring(3, 5) == "00") {
        return false;
    }
    if (temp.substring(5, 9) == "0000") {
        return false;
    }
    return true;
}//end validSSN function
   </script>

</head>

<body bgcolor="#EAEBF7">

	<springForm:form id="myForm" method="POST" commandName="employee"
		action="save">
		<br />
		<table style="width: 100%">
			<tr bgcolor="#FFFFE1">
				<td style="height: 27px"></td>
				<td class="auto-style2" style="width: 642px; height: 27px"><span
					class="auto-style7">Employee Information</span>&nbsp;</td>
				<td class="auto-style6" style="height: 27px">&nbsp;
					<div id="number_filters">
						<a href="/HRAdmin/getList">Click Here to see list of Employees
						</a>

					</div>
				</td>
			</tr>
		</table>
		<br />
		<br />
		<br />
		<br />
		<fieldset>
			<table class="auto-style1" style="width: 100%">

				<tr>
					<td class="auto-style2" style="width: 485px"><span
						class="auto-style3"> </span>
						<p class="auto-style12" style="width: 544px">
							&nbsp;&nbsp;&nbsp;&nbsp;<span class="auto-style13"> Emp ID</span>
						</p></td>
					<td><springForm:input id="empId" path="empId"
							value="${employee.empId}" tabindex="1" /> <span
						class="auto-style5">*</span>
					<springForm:errors path="empId" cssClass="error" /></td>
				</tr>
				<tr>
					<td class="auto-style2" style="width: 485px"><span
						class="auto-style3"> </span>

						<p class="auto-style12" style="width: 544px">
							&nbsp;&nbsp;&nbsp;&nbsp;<span class="auto-style13">
								FirstName</span>
						</p></td>
					<td><springForm:input id="firstName" path="firstName"
							value="${employee.firstName}" tabindex="1" /> <span
						class="auto-style5">*</span>
					<springForm:errors path="firstName" cssClass="error" /></td>
				</tr>
				<tr>
					<td class="auto-style2" style="width: 485px"><span
						class="auto-style3"> </span>

						<p class="auto-style12" style="width: 544px">
							&nbsp;&nbsp;&nbsp;&nbsp;<span class="auto-style13"> Last
								Name</span>
						</p></td>
					<td style="height: 23px"><springForm:input id="lastName"
							path="lastName" value="${employee.lastName}" tabindex="2"
							 /><span
						class="auto-style5">*</span> <springForm:errors path="lastName"
							cssClass="error" /></td>
				</tr>
				<tr>
					<td class="auto-style2" style="width: 485px"><span
						class="auto-style3"> </span>

						<p class="auto-style12" style="width: 544px">
							&nbsp;&nbsp;&nbsp;&nbsp;<span class="auto-style13">
								Address</span>
						</p></td>
					<td><springForm:input id="address" path="address"
							value="${employee.address}" tabindex="3" /> <span
						class="auto-style5">*</span> <springForm:errors path="address"
							cssClass="error" /></td>
				</tr>
				<tr>
					<td class="auto-style2" style="width: 485px"><span
						class="auto-style3"> </span>

						<p class="auto-style12" style="width: 544px">
							&nbsp;&nbsp;&nbsp;&nbsp;<span class="auto-style13"> SSN</span>
						</p></td>
					<td><springForm:input id="ssn" path="ssn"
							value="${employee.ssn}" tabindex="5" maxlength="11" /><span
						class="auto-style5">*</span>
					<springForm:errors path="ssn" cssClass="error" /></td>
				</tr>
				<tr>
					<td class="auto-style2" style="width: 485px"><span
						class="auto-style3"> </span>

						<p class="auto-style12" style="width: 544px">
							&nbsp;&nbsp;&nbsp;&nbsp;<span class="auto-style13"> City</span>
						</p></td>
					<td><springForm:input id="city" path="city"
							value="${employee.city}"
							
							tabindex="5" maxlength="20" /><span class="auto-style5">*</span>
					<springForm:errors path="city" cssClass="error" /></td>
				</tr>
				<tr>
					<td class="auto-style2" style="width: 485px"><span
						class="auto-style3"> </span>

						<p class="auto-style12" style="width: 544px">
							&nbsp;&nbsp;&nbsp;&nbsp;<span class="auto-style13"> State</span>
						</p></td>
					<td><springForm:input id="state" path="state"
							value="${employee.state}" tabindex="6"
							 /> <span
						class="auto-style5">*</span>
					<springForm:errors path="state" cssClass="error" /></td>
				</tr>
				<tr>
					<td class="auto-style2" style="width: 485px"><span
						class="auto-style3"> </span>

						<p class="auto-style12" style="width: 544px">
							&nbsp;&nbsp;&nbsp;&nbsp;<span class="auto-style13"> Zip</span>
						</p></td>
					<td><springForm:input id="zip" path="zip"
							value="${employee.zip}" /><span class="auto-style5">*</span> <springForm:errors
							path="zip" cssClass="error" /></td>
				</tr>
				<tr>
					<td class="auto-style2" style="width: 485px"><span
						class="auto-style3"> </span>

						<p class="auto-style12" style="width: 544px">
							&nbsp;&nbsp;&nbsp;&nbsp;<span class="auto-style13"> Phone</span>
						</p></td>
					<td><springForm:input id="phone" path="phone"
							value="${employee.phone}" tabindex="7" maxlength="11" /><span
						class="auto-style5">*</span>
					<springForm:errors path="phone" cssClass="error" /></td>
				</tr>

				<tr>
					

							<td class="auto-style2" style="width: 485px"><span
								class="auto-style3"> </span>

								<p class="auto-style12" style="width: 544px">
									&nbsp;&nbsp;&nbsp;&nbsp;<span class="auto-style13"> Date
										of Birth</span>
								</p></td>
							<td><springForm:input id="DOB" path="dateOfBirth"
									placeholder="MM/dd/yyyy" tabindex="7" /> Ex:MM/dd/yyyy <span
								class="auto-style5">*</span> <springForm:errors
									path="dateOfBirth" cssClass="error" /></td>


							
				</tr>


				<tr>
					<td style="width: 458px"><br /></td>
					<td><input id="reset" type="reset" tabindex="9" /> <input
						id="submit" class="submit" type="submit" tabindex="10"
						value="Register" /> &nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
			</table>
		</fieldset>
	</springForm:form>
	<p>&nbsp;</p>

	<p>&nbsp;</p>

</body>

</html>
