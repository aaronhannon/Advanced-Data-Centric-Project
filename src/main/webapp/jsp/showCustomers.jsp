<%@ page language = "java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- SHOW CUSTOMERS PAGE-->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CUSTOMERS</title>
    <link href="/css/customersStyle.css" rel="stylesheet" type="text/css">
</head>
<body>

	<ul>
	  <li><a href="index.html">Home</a></li>
	  <li><a href="/showBooks">List Books</a></li>
	  <li><a href="/addCustomer">Add Customer</a></li>
	  <li><a href="/showLoans">List Loans</a></li>
	  <li style="float:right"><a href="/logout">Logout</a></li>
	</ul>

<div>
<h1>List of Customers</h1>
	<table>
		<c:forEach items="${customers}" var="customer"> 
			
			<tr>
				<td><h2>${customer.cId} ${customer.cName}</h2></td>
			</tr>
		
			<tr>
				<td><h4>Loan Period = ${customer.loanPeriod} days</h4></td>
			</tr>
		
			<tr>
				<td><h3>${customer.cName} Loans:</h3></td>
			</tr>
		
			<table class="c">
				<tr class="c">
					<th>Loan ID</th>
					<th>Book ID</th>	
					<th>Title</th>	
					<th>Author</th>	
				</tr>
				
				<c:forEach items="${customer.loans}" var="loan">

					<tr class="c">
						<td class="c">${loan.lid}</td>
						<td class="c">${loan.book.bid}</td>
						<td class="c">${loan.book.title}</td>
						<td class="c">${loan.book.author}</td>
					</tr>
				</c:forEach>
			</table>
			<hr>
		</c:forEach>
	</table>
	
</div>


</body>
</html>