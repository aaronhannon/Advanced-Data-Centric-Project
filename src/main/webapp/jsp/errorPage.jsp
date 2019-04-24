<%@ page language = "java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
    <head>
        
        <title>ERROR</title>
    </head>
    <body>
        
        <h1>${exception.header}</h1>
        <h2>${exception.error}</h2>
        
       	<p><a href="index.html">Home</a> <a href="/showBooks">List Books</a> <a href="/showCustomers">List Customers</a> 
			<a href="/showLoans">List Loans</a> <a href="/newLoan">New Loan</a></p>
    </body>
</html>	


