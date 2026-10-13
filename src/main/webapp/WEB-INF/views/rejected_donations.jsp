
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Rejected Donations | FoodBridge</title>

<link rel="stylesheet"
    href="${pageContext.request.contextPath}/css/rejected_donations.css">
</head>

<body>

<nav class="main-navbar">
    <a href="${pageContext.request.contextPath}/ngo_dashboard" class="brand">
        <span class="brand-icon">♥</span>
        FoodBridge
    </a>

    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/ngo_dashboard">Dashboard</a>
        <a href="${pageContext.request.contextPath}/available_donations">Find Food</a>
        <a href="${pageContext.request.contextPath}/track_donations">Track Donations</a>
    </div>
</nav>

<main class="container">

    <p class="eyebrow">FOODBRIDGE · NGO PORTAL</p>
    <h1>Rejected Donations</h1>
    <p class="page-description">
        View the pickup requests that were rejected by donors.
    </p>

    <c:choose>
        <c:when test="${not empty requests}">

            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th>Food Name</th>
                            <th>Quantity</th>
                            <th>Donor Name</th>
                            <th>Pickup Address</th>
                            <th>Status</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach var="r" items="${requests}">
                            <tr>
                                <td class="food-name">${r.donation.foodName}</td>
                                <td>${r.donation.quantity}</td>
                                <td>${r.donation.donor.name}</td>
                                <td>${r.donation.pickupAddress}</td>
                                <td>
                                    <span class="rejected-badge">${r.status}</span>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

        </c:when>

        <c:otherwise>
            <div class="empty-state">
                <h3>No Rejected Donations</h3>
                <p>There are currently no rejected pickup requests.</p>
            </div>
        </c:otherwise>
    </c:choose>

    <a class="back-link"
       href="${pageContext.request.contextPath}/ngo_dashboard">
        ← Back to Dashboard
    </a>

</main>

</body>
</html>
