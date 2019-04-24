<%@ page language = "java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- SHOW LOANS PAGE -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>LOANS</title>
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
		<h1>List of Loans</h1>
		<table>
			<tr>
				<th>Loan ID</th>
				<th>Customer ID</th>	
				<th>Customer Name</th>	
				<th>Title</th>
				<th>Author</th>
				<th>Due Date</th>	
			</tr>
			
			<c:forEach items="${loans}" var="loan"> 
				<tr>
					<td>${loan.lid}</td>
					<td>${loan.cust.cId}</td>
					<td>${loan.cust.cName}</td>
					<td>${loan.book.title}</td>
					<td>${loan.book.author}</td>
					<td>${loan.dueDate}</td>
				</tr>
			</c:forEach>
			
		</table>
	</div>
	

</body>
</html>