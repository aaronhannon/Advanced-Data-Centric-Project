<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language = "java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!-- DELETE LOAN PAGE-->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete Loan</title>
	<link href="/css/style.css" rel="stylesheet" type="text/css">
</head>
	<body>
	
		<ul>
		  <li><a href="index.html">Home</a></li>
		  <li><a href="/showBooks">List Books</a></li>
		  <li><a href="/showCustomers">List Customers</a></li>
		  <li><a href="/showLoans">List Loans</a></li>
		  <li><a href="/newLoan">New Loan</a></li>
		</ul>
	
		<div class="main">
			<h1>Delete Loan</h1>
			<form:form modelAttribute="LoanDelete">
			  <table>
			    <tr>
			      <td><h2>Loan ID:</h2></td>
			      <td><form:input path="lid"></form:input></td>
			    </tr>
			    
			    <tr>
			      <td colspan="3">
			        <input class="button" type="submit" value="Delete"/>
			      </td>
			    </tr>
			  </table>
			</form:form>
		</div>
	</body>
</html>