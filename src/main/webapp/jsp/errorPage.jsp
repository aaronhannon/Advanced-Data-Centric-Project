<%@ page language = "java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
    <head>
        <title>LOAN ERROR</title>
        <link href="/css/style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        
   	<ul>
	  <li><a href="index.html">Home</a></li>
	  <li><a href="/showBooks">List Books</a></li>
	  <li><a href="/showCustomers">List Customers</a></li>
	  <li><a href="/newLoan">New Loan</a></li>
	  <li><a href="/deleteLoan">Delete Loan</a></li>
	  <li style="float:right"><a href="/logout">Logout</a></li>
	</ul>    
    
	<div class="main">
        <h1>${exception.header}</h1>
        <h2>${exception.error}</h2>
	</div>
    </body>
</html>	


