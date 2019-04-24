<%@ page language = "java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- SHOW CUSTOMERS PAGE-->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CUSTOMERS</title>
</head>
<body>
		<h1>List of Customers</h1>
	<table >
		<tr>
			<c:forEach items="${customers}" var="customer"> 
				
				<tr>
					<td><h2>${customer.cId} ${customer.cName}</h2></td>
				</tr>
			
				<tr>
					<td>Loan Period = ${customer.loanPeriod} days</td>
				</tr>
			
				<tr>
					<td><h3>${customer.cName} Loans:</h3></td>
				</tr>
			
				<table Border = "1">
					<tr>
						<th>Loan ID</th>
						<th>Book ID</th>	
						<th>Title</th>	
						<th>Author</th>	
					</tr>
					
					<c:forEach items="${customer.loans}" var="loan">
	
						<tr>
							<td>${loan.lid}</td>
							<td>${loan.book.bid}</td>
							<td>${loan.book.title}</td>
							<td>${loan.book.author}</td>
						</tr>
					</c:forEach>
				</table>

			</c:forEach>
		</tr>
	</table>
	<p><a href="index.html">Home</a> <a href="/showBooks">List Books</a> <a href="/addCustomer">Add Customer</a> 
		<a href="/showLoans">List Loans</a> <a href="/logout">Logout</a></p>
</body>
</html>