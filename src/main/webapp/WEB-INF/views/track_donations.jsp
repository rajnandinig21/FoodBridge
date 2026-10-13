
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Track My Donations | FoodBridge</title>
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/css/track_donations.css">
</head>
<body>

<nav class="main-navbar">
    <a href="${pageContext.request.contextPath}/ngo_dashboard" class="brand">
        <span class="brand-icon">♥</span> FoodBridge
    </a>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/ngo_dashboard">Dashboard</a>
        <a href="${pageContext.request.contextPath}/available_donations">Find Food</a>
    </div>
</nav>

<main class="container">
    <p class="eyebrow">FOODBRIDGE · NGO PORTAL</p>
    <h1>Track My Donations</h1>
    <p class="page-description">
        Follow your pickup requests from submission to completion.
    </p>

    <c:forEach var="r" items="${requests}">
        <section class="donation-item">
            <div class="donation-header">
                <div>
                    <h2 class="food-name">${r.donation.foodName}</h2>
                    <div class="donation-details">
                        <span><strong>Quantity:</strong> ${r.donation.quantity}</span>
                        <span><strong>Donor:</strong> ${r.donation.donor.name}</span>
                    </div>
                </div>
                <span class="status-badge
                    ${r.status == 'PENDING' ? 'pending' :
                      r.status == 'REJECTED' ? 'rejected' :
                      r.status == 'COMPLETED' ? 'completed' : ''}">
                    ${r.status}
                </span>
            </div>

            <c:if test="${not empty r.scheduledPickupTime}">
                <div class="pickup-schedule">
                    <h3>Confirmed Pickup Schedule</h3>
                    <p>
                        <strong>Date &amp; Time:</strong>
                        ${fn:replace(r.scheduledPickupTime.toString(), 'T', ' ')}
                    </p>
                    <p><strong>Pickup Address:</strong>
                        ${r.donation.pickupAddress}</p>
                    <c:if test="${r.status == 'ACCEPTED'}">
                        <p class="reminder">
                            Reminder: Please collect the donation at the scheduled time.
                        </p>
                    </c:if>
                </div>
            </c:if>

            <div class="tracking-wrapper">
                <div class="tracking">
                    <div class="step">
                        <div class="circle completed">✓</div>
                        <div class="step-label active">Request Sent</div>
                    </div>

                    <div class="line
                        ${r.status == 'ACCEPTED' || r.status == 'COMPLETED'
                          ? 'completed-line' :
                          r.status == 'REJECTED' ? 'rejected-line' : ''}">
                    </div>

                    <div class="step">
                        <c:choose>
                            <c:when test="${r.status == 'ACCEPTED' || r.status == 'COMPLETED'}">
                                <div class="circle completed">✓</div>
                            </c:when>
                            <c:when test="${r.status == 'REJECTED'}">
                                <div class="circle rejected">✕</div>
                            </c:when>
                            <c:otherwise><div class="circle">2</div></c:otherwise>
                        </c:choose>
                        <div class="step-label ${r.status != 'PENDING' ? 'active' : ''}">
                            <c:choose>
                                <c:when test="${r.status == 'REJECTED'}">Request Rejected</c:when>
                                <c:otherwise>Donor Approval</c:otherwise>
                            </c:choose>
                        </div>
                    </div>

                    <c:if test="${r.status != 'REJECTED'}">
                        <div class="line ${r.status == 'COMPLETED' ? 'completed-line' : ''}"></div>
                        <div class="step">
                            <c:choose>
                                <c:when test="${r.status == 'COMPLETED'}">
                                    <div class="circle completed">✓</div>
                                </c:when>
                                <c:otherwise><div class="circle">3</div></c:otherwise>
                            </c:choose>
                            <div class="step-label ${r.status == 'COMPLETED' ? 'active' : ''}">
                                Donation Completed
                            </div>

                            <c:if test="${r.status == 'ACCEPTED'}">
                                <form action="${pageContext.request.contextPath}/complete_pickup"
                                      method="get"
                                      onsubmit="return confirm('Mark this pickup as completed?');">
                                    <input type="hidden" name="id" value="${r.id}">
                                    <button type="submit" class="complete-button">
                                        Mark as Completed
                                    </button>
                                </form>
                            </c:if>
                        </div>
                    </c:if>
                </div>
            </div>
        </section>
    </c:forEach>

    <c:if test="${empty requests}">
        <div class="empty-state">
            <h3>No Pickup Requests Yet</h3>
            <p>Your tracking details will appear here once you request food.</p>
        </div>
    </c:if>

    <a class="back-link"
       href="${pageContext.request.contextPath}/ngo_dashboard">
        ← Back to Dashboard
    </a>
</main>
</body>
</html>
