
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FoodBridge | My Donations</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/my_donations.css">
</head>

<body>

<nav class="navbar">
    <a href="${pageContext.request.contextPath}/donor_dashboard" class="brand">
        <span class="brand-icon">F</span>
        <span>Food<span class="brand-accent">Bridge</span></span>
    </a>

    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/donor_dashboard">Dashboard</a>
        <a href="${pageContext.request.contextPath}/profile">My Profile</a>
        <a href="${pageContext.request.contextPath}/add_donation">Add Donation</a>
        <a href="${pageContext.request.contextPath}/my_donations" class="active">My Donations</a>
        <a href="${pageContext.request.contextPath}/pickup_requests">Pickup Requests</a>
        <a href="${pageContext.request.contextPath}/logout" class="logout-btn">Logout</a>
    </div>
</nav>

<main class="page-container">

    <section class="page-heading">
        <p class="eyebrow">DONOR PANEL</p>
        <h1>My Donations</h1>
        <p>View your food donations and track their current status.</p>
    </section>

    <section class="table-container">

        <div class="table-heading">
            <h2>Donation Records</h2>
            <a href="${pageContext.request.contextPath}/add_donation"
               class="add-btn">+ Add Donation</a>
        </div>

        <div class="table-scroll">
            <table>
                <thead>
                    <tr>
                        <th>Food Name</th>
                        <th>Category</th>
                        <th>Food Type</th>
                        <th>Donor Type</th>
                        <th>Quantity</th>
                        <th>Expiry Date</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="d" items="${donations}">
                        <tr>
                            <td class="food-name">${d.foodName}</td>
                            <td>${d.foodCategory}</td>
                            <td>${d.foodType}</td>
                            <td>${d.donorType}</td>
                            <td>${d.quantity}</td>
                            <td>${d.expiryDate}</td>

                            <td>
                                <c:choose>
                                    <c:when test="${d.status == 'AVAILABLE'}">
                                        <span class="status available">AVAILABLE</span>
                                    </c:when>
                                    <c:when test="${d.status == 'ACCEPTED'}">
                                        <span class="status accepted">ACCEPTED</span>
                                    </c:when>
                                    <c:when test="${d.status == 'COMPLETED'}">
                                        <span class="status completed">COMPLETED</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="status other">${d.status}</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>

                            <td class="actions">
                                <c:if test="${d.status == 'AVAILABLE'}">
                                    <a class="edit-link"
                                       href="${pageContext.request.contextPath}/edit_donation?id=${d.id}">Edit</a>
                                    <a class="delete-link"
                                       href="${pageContext.request.contextPath}/delete_donation?id=${d.id}"
                                       onclick="return confirm('Are you sure you want to delete this donation?');">Delete</a>
                                </c:if>

                                <c:if test="${d.status == 'ACCEPTED'}">
                                    <span class="action-note">Pickup Approved</span>
                                </c:if>

                                <c:if test="${d.status == 'COMPLETED'}">
                                    <span class="action-note completed-note">Donation Completed ✓</span>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty donations}">
                        <tr>
                            <td colspan="8" class="empty-state">
                                <span>🥗</span>
                                <strong>No donations yet</strong>
                                <p>Your food donations will appear here.</p>
                                <a href="${pageContext.request.contextPath}/add_donation"
                                   class="add-btn">Add Your First Donation</a>
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>

    </section>

    <footer>Share food, share hope. <span>♥</span></footer>

</main>

</body>
</html>
