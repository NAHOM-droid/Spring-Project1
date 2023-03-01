<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<html>
<head>
<title>List Customers</title>

<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<h2>CRM - Customer Relationship Manager</h2>
		</div>
	</div>

	<div id="container">
		<div id="content">

			<input type="button" value="Add Customer"
				onclick="window.location.href='showFormForAdd'; return false;"
				class="add-button" />

			<!--  add a search box -->
			<form:form action="search" method="GET">
                Search customer: <input type="text" name="theSearchName" />

				<input type="submit" value="Search" class="add-button" />
			</form:form>

			<!-- Adding link to sort by name, email -->
			<c:url var="sortByFN" value="/customer/list">
				<c:param name="criteria" value="1" />
			</c:url>
			<c:url var="sortByLN" value="/customer/list">
				<c:param name="criteria" value="2" />
			</c:url>
			<c:url var="sortByEmail" value="/customer/list">
				<c:param name="criteria" value="3" />
			</c:url>

			<table>
				<tr>
					<th><a href="${sortByFN }">First Name</a></th>
					<th><a href="${sortByLN }">Last Name</a></th>
					<th><a href="${sortByEmail }">Email</a></th>
					<th>Action</th>
				</tr>
				<c:forEach var="tempCustomer" items="${customers}">
					<c:url var="updatelink" value="/customer/showFormForUpdate">
						<c:param name="customerId" value="${tempCustomer.id}" />
					</c:url>
					<c:url var="deletelink" value="/customer/delete">
						<c:param name="customerId" value="${tempCustomer.id}" />
					</c:url>

					<tr>
						<td>${tempCustomer.firstName}</td>
						<td>${tempCustomer.lastName }</td>
						<td>${tempCustomer.email }</td>
						<td><a href="${updatelink}">Update</a> | <a
							href="${deletelink}"
							onclick="if(!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
						</td>
					</tr>
				</c:forEach>

			</table>
		</div>

	</div>
</body>
</html>