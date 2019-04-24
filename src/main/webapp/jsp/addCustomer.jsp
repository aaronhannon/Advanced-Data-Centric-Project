<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language = "java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!-- ADD CUSTOMER PAGE -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ADD CUSTOMER</title>
	<link href="/css/style.css" rel="stylesheet" type="text/css">
</head>
	<body>
		<ul>
		  <li><a href="index.html">Home</a></li>
		  <li><a href="/addBook">Add Book</a></li>
		  <li><a href="/showCustomers">List Customers</a></li>
		  <li><a href="/newLoan">New Loan</a></li>
		</ul>
	
	<div class="main">
		<h1>Add Customer</h1>
		<form:form modelAttribute="CustAdd">
		  <table>
		    <tr>
		      <td><h2>Cust Name:</h2></td>
		      <td><form:input path="cName"></form:input></td>
		      <td class="error"><form:errors path="cName"></form:errors></td>
		    </tr>
		    
		    <tr></tr>
		    
   		    <tr>
		      <td><h2>Load Period (days):</h2></td>
		      <td><form:input path="loanPeriod"></form:input></td>
		      <td class="error"><form:errors path="loanPeriod"></form:errors></td>
		    </tr>
		    <tr>
		      <td colspan="3">
		        <input class="button" type="submit" value="Add"/>
		      </td>
		    </tr>
		  </table>
		</form:form>
		</div>
	</body>
</html>