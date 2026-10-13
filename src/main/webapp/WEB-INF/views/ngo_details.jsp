
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FoodBridge | NGO Details</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/ngo_details.css">
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
        <a href="${pageContext.request.contextPath}/my_donations">My Donations</a>
        <a href="${pageContext.request.contextPath}/pickup_requests" class="active">Pickup Requests</a>
        <a href="${pageContext.request.contextPath}/logout" class="logout-btn">Logout</a>
    </div>
</nav>

<main class="page-container">

    <section class="page-heading">
        <p class="eyebrow">DONOR PANEL</p>
        <h1>NGO Details</h1>
        <p>View the contact information of the requesting organization.</p>
    </section>

    <section class="details-section">

        <div class="details-header">
            <div class="ngo-icon">🏢</div>
            <div>
                <p class="details-label">ORGANIZATION PROFILE</p>
                <h2>${ngo.name}</h2>
            </div>
        </div>

        <div class="details-list">

            <div class="detail-row">
                <span class="detail-icon">✉</span>
                <div class="detail-content">
                    <span class="label">Email Address</span>
                    <p>${ngo.email}</p>
                </div>
            </div>

            <div class="detail-row">
                <span class="detail-icon">☎</span>
                <div class="detail-content">
                    <span class="label">Phone Number</span>
                    <p>${ngo.phone}</p>
                </div>
            </div>

            <div class="detail-row">
                <span class="detail-icon">📍</span>
                <div class="detail-content">
                    <span class="label">Address</span>
                    <p>${ngo.address}</p>
                </div>
            </div>

            <div class="detail-row">
                <span class="detail-icon">👤</span>
                <div class="detail-content">
                    <span class="label">Role</span>
                    <p>${ngo.role}</p>
                </div>
            </div>

        </div>

        <a href="${pageContext.request.contextPath}/pickup_requests"
           class="back-btn">← Back to Pickup Requests</a>

    </section>

    <footer>Share food, share hope. <span>♥</span></footer>

</main>

</body>
</html>
