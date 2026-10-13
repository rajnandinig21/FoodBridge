
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Donation Details | FoodBridge</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/donation_details.css">
</head>

<body>

<nav class="navbar">
    <a href="${pageContext.request.contextPath}/donor_dashboard"
       class="brand">
        <span class="brand-icon">F</span>
        <span>Food<span class="brand-accent">Bridge</span></span>
    </a>

    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/logout" class="logout-btn">Logout</a>
    </div>
</nav>

<main class="page-container">

    <div class="page-heading">
        <p class="eyebrow">FOOD DONATION</p>
        <h1>Donation Details</h1>
        <p>Learn more about this donation before requesting a pickup.</p>
    </div>

    <section class="details-layout">

        <div class="photo-section">
            <c:choose>
                <c:when test="${not empty donation.photoPath}">
                    <img class="food-photo"
                         src="${pageContext.request.contextPath}/uploads/${donation.photoPath}"
                         alt="${donation.foodName}">
                </c:when>
                <c:otherwise>
                    <div class="photo-placeholder">
                        <span>Food Donation</span>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="details-section">
            <span class="section-label">DONATION INFORMATION</span>
            <h2>${donation.foodName}</h2>

            <div class="info-row">
                <span>Food Type</span>
                <strong>${donation.foodType}</strong>
            </div>

            <div class="info-row">
                <span>Food Category</span>
                <strong>${donation.foodCategory}</strong>
            </div>

            <div class="info-row">
                <span>Quantity</span>
                <strong>${donation.quantity}</strong>
            </div>

            <div class="info-row">
                <span>Expiry Date</span>
                <strong>${donation.expiryDate}</strong>
            </div>

            <div class="info-row">
                <span>Donor Type</span>
                <strong>${donation.donorType}</strong>
            </div>

            <div class="description">
                <h3>Description</h3>
                <p>
                    <c:choose>
                        <c:when test="${not empty donation.description}">
                            ${donation.description}
                        </c:when>
                        <c:otherwise>
                            No description provided.
                        </c:otherwise>
                    </c:choose>
                </p>
            </div>

            <div class="address-section">
                <h3>Pickup Address</h3>
                <p>${donation.pickupAddress}</p>
            </div>

            <a class="request-btn"
               href="${pageContext.request.contextPath}/request_donation?id=${donation.id}">
                Request Pickup
            </a>
        </div>

    </section>

    <section class="donor-section">
        <h2>Donor Information</h2>
        <p class="donor-intro">Contact details provided by the food donor.</p>

        <div class="donor-details">
            <div>
                <span>Name</span>
                <strong>${donation.donor.name}</strong>
            </div>

            <div>
                <span>Email</span>
                <strong>${donation.donor.email}</strong>
            </div>

            <div>
                <span>Phone</span>
                <strong>${donation.donor.phone}</strong>
            </div>

            <div>
                <span>Address</span>
                <strong>${donation.donor.address}</strong>
            </div>
        </div>
    </section>

    <a class="back-link"
       href="${pageContext.request.contextPath}/available_donations">
        ← Back to Available Donations
    </a>

    <footer>Share food, share hope. <span>♥</span></footer>

</main>

</body>
</html>
