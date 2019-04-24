<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language = "java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!-- ADD NEW LOAN PAGE-->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>New Loan</title>
    <link href="/css/style.css" rel="stylesheet" type="text/css">
</head>
	<body>
	
	<ul>
	  <li><a href="index.html">Home</a></li>
	  <li><a href="/addBook">Add Book</a></li>
	  <li><a href="/addCustomer">Add Customer</a></li>
	  <li><a href="/showLoans">List Loans</a></li>
	</ul>
	
	<div class="main">
		<h1>New Loan</h1>
		<form:form modelAttribute="LoanAdd">
		  <table>
		    <tr>
		      <td><h2>Customer ID:</h2></td>
		      <td><form:input path="cust.cId"></form:input></td>
		    </tr>
		    
		    <tr></tr>
		    
   		    <tr>
		      <td><h2>Book ID:</h2></td>
		      <td><form:input path="book.bid"></form:input></td>
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