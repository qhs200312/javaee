<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.example.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.model.Item" %>
<html>
<head>
    <title>Items</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container">
<%
User user = (User) session.getAttribute("user");
if(user == null){
    response.sendRedirect("login.jsp");
    return;
}
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light mb-3">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Management</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="items">Items</a></li>
                <li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>
<h2>Items</h2>
<%
List<Item> list = (List<Item>) request.getAttribute("list");
if(list == null){
    list = new java.util.ArrayList<>();
}
String role = user.getRole();
%>
<% if("admin".equals(role)){ %>
<form action="items" method="post" class="mb-3">
    <input type="hidden" name="action" value="add">
    <div class="row g-2">
        <div class="col">
            <input type="text" name="name" class="form-control" placeholder="Name" required>
        </div>
        <div class="col">
            <input type="number" name="quantity" class="form-control" placeholder="Quantity" required>
        </div>
        <div class="col-auto">
            <button type="submit" class="btn btn-primary">Add</button>
        </div>
    </div>
</form>
<% } %>
<table class="table table-bordered">
    <thead>
        <tr><th>ID</th><th>Name</th><th>Quantity</th><% if("admin".equals(role)){ %><th>Actions</th><% } %></tr>
    </thead>
    <tbody>
    <% for(Item item: list){ %>
        <tr>
            <td><%= item.getId() %></td>
            <td><%= item.getName() %></td>
            <td><%= item.getQuantity() %></td>
            <% if("admin".equals(role)){ %>
            <td>
                <form action="items" method="post" style="display:inline">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= item.getId() %>">
                    <button class="btn btn-danger btn-sm">Delete</button>
                </form>
            </td>
            <% } %>
        </tr>
    <% } %>
    </tbody>
</table>
</body>
</html>
