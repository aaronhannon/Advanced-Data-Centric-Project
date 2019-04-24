<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language = "java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!-- ADD BOOK PAGE -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ADD BOOK</title>
    
</head>
	<body>
		<h1>Add Book</h1>
		<form:form modelAttribute="BookAdd">
		  <table>
		    <tr>
		      <td>Title:</td>
		      <td><form:input path="title"></form:input></td>
		      <!-- where error us outputed -->
		      <td><form:errors path="title"></form:errors></td>
		    </tr>
		    
   		    <tr>
		      <td>Author:</td>
		      <td><form:input path="author"></form:input></td>
		      <!-- where error us outputed -->
		      <td><form:errors path="author"></form:errors></td>
		    </tr>
		    <tr>
		      <td colspan="2">
		        <input type="submit" value="Add"/>
		      </td>
		    </tr>
		  </table>
		</form:form>
		<p><a href="index.html">Home</a> <a href="showBooks">List Book</a> <a href="/addCustomer">Add Customer</a> 
		<a href="/newLoan">new Loans</a></p>
	</body>
</html>