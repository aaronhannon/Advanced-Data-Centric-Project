<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language = "java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!-- DELETE LOAN PAGE-->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete Loan</title>

</head>
	<body>
		<h1>Delete Loan</h1>
		<form:form modelAttribute="LoanDelete">
		  <table>
		    <tr>
		      <td>Loan ID:</td>
		      <td><form:input path="lid"></form:input></td>
		    </tr>
		    
		    <tr>
		      <td colspan="2">
		        <input type="submit" value="Delete"/>
		      </td>
		    </tr>
		  </table>
		</form:form>
		<p><a href="index.html">Home</a> <a href="/showBooks">List Books</a> <a href="/showCustomers">List Customers</a> 
			<a href="/showLoans">List Loans</a> <a href="/newLoan">New Loan</a></p>
	</body>
</html>