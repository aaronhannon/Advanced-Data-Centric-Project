<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language = "java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!-- ADD CUSTOMER PAGE -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ADD CUSTOMER</title>

</head>
	<body>
		<h1>Add Customer</h1>
		<form:form modelAttribute="CustAdd">
		  <table>
		    <tr>
		      <td>Cust Name:</td>
		      <td><form:input path="cName"></form:input></td>
		      <td><form:errors path="cName"></form:errors></td>
		    </tr>
		    
   		    <tr>
		      <td>Load Period (days):</td>
		      <td><form:input path="loanPeriod"></form:input></td>
		      <td><form:errors path="loanPeriod"></form:errors></td>
		    </tr>
		    <tr>
		      <td colspan="2">
		        <input type="submit" value="Add"/>
		      </td>
		    </tr>
		  </table>
		</form:form>
		<p><a href="index.html">Home</a> <a href="/addBook">Add Book</a> <a href="/showCustomers">List Customers</a> 
			<a href="/newLoan">new Loans</a></p>
	</body>
</html>