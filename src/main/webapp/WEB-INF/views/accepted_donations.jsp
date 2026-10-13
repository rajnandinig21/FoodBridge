
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Accepted Donations | FoodBridge</title>

<link rel="stylesheet"
    href="${pageContext.request.contextPath}/css/accepted_donations.css">
</head>

<body class="accepted-page">

<nav class="main-navbar">
    <a href="${pageContext.request.contextPath}/ngo_dashboard"
       class="brand">
        <span class="brand-icon">♥</span>
        FoodBridge
    </a>

    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/ngo_dashboard">Dashboard</a>
        <a href="${pageContext.request.contextPath}/available_donations">Available Donations</a>
    </div>
</nav>

<main class="donations-container">

    <p class="eyebrow">FOODBRIDGE · NGO PORTAL</p>
    <h1>Accepted Donations</h1>
    <p class="page-description">
        View the food donations accepted by your organisation.
    </p>

    <div class="table-wrapper">
        <table class="donations-table">
            <thead>
                <tr>
                    <th>Food Name</th>
                    <th>Category</th>
                    <th>Food Type</th>
                    <th>Quantity</th>
                    <th>Expiry Date</th>
                    <th>Pickup Address</th>
                    <th>Description</th>
                    <th>Donor Name</th>
                    <th>Status</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="d" items="${donations}">
                    <tr>
                        <td class="food-name">${d.foodName}</td>
                        <td>${d.foodCategory}</td>
                        <td>${d.foodType}</td>
                        <td>${d.quantity}</td>
                        <td>${d.expiryDate}</td>
                        <td>${d.pickupAddress}</td>
                        <td>${d.description}</td>
                        <td>${d.donor.name}</td>
                        <td>
                            <span class="status-badge">${d.status}</span>
                        </td>
                    </tr>
                </c:forEach>

                <c:if test="${empty donations}">
                    <tr>
                        <td colspan="9" class="empty-message">
                            No accepted donations found.
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>

    <a class="back-link"
       href="${pageContext.request.contextPath}/ngo_dashboard">
       ← Back to Dashboard
    </a>

</main>

</body>
</html>
