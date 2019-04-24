<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language = "java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!-- ADD BOOK PAGE -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ADD BOOK</title>
    <link href="/css/style.css" rel="stylesheet" type="text/css">
</head>
	<body>
	
	<ul>
	  <li><a href="index.html">Home</a></li>
	  <li><a href="/showBooks">List Book</a></li>
	  <li><a href="/addCustomer">Add Customer</a></li>
	  <li><a href="/newLoan">New Loan</a></li>
	</ul>
	
	<div class="main">
		<h1>Add Book</h1>
		<form:form modelAttribute="BookAdd">
		  <table>
		    <tr>
		      <td><h2>Title:</h2></td>
		      <td><form:input path="title"></form:input></td>
		      <!-- where error is outputted -->
		      <td class="error"><form:errors path="title"></form:errors></td>
		    </tr>
		    
		    <tr></tr>
		    
   		    <tr>
		      <td><h2>Author:</h2></td>
		      <td><form:input path="author"></form:input></td>
		      <!-- where error is outputted -->
		      <td class="error"><form:errors path="author"></form:errors></td>
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