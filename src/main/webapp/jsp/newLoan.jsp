<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language = "java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!-- ADD NEW LOAN PAGE-->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>New Loan</title>
</head>
	<body>
		<h1>New Loan</h1>
		<form:form modelAttribute="LoanAdd">
		  <table>
		    <tr>
		      <td>Customer ID:</td>
		      <td><form:input path="cust.cId"></form:input></td>
		    </tr>
		    
   		    <tr>
		      <td>Book ID:</td>
		      <td><form:input path="book.bid"></form:input></td>
		    </tr>
		    <tr>
		      <td colspan="2">
		        <input type="submit" value="Add"/>
		      </td>
		    </tr>
		  </table>
		</form:form>
		<p><a href="index.html">Home</a> <a href="/addBook">Add Book</a> <a href="/addCustomer">Add Customer</a> 
			<a href="/showLoans">List Loans</a></p>
	</body>
</html>