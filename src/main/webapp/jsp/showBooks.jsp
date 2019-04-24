<%@ page language = "java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- SHOW BOOKS PAGE -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>BOOKS</title>
    <link href="/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<ul>
	  <li><a href="index.html">Home</a></li>
	  <li><a href="/addBook">Add Book</a></li>
	  <li><a href="/showCustomers">List Customers</a></li>
	  <li><a href="/showLoans">List Loans</a></li>
	  <li style="float:right"><a href="/logout">Logout</a></li>
	</ul>

<div class="main">
	<h1>List of Books</h1>
	<table>
		<tr>
			<th>Book ID</th>	
			<th>Title</th>	
			<th>Author</th>	
		</tr>
		
		<c:forEach items="${books}" var="book"> 
			<tr class="data">
				<td>${book.bid}</td>
				<td>${book.title}</td>
				<td>${book.author}</td>
			</tr>
		</c:forEach>
				
	</table>
</div>

</body>
</html>