
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FoodBridge | Pickup Requests</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/pickup_requests.css">
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
        <h1>Pickup Requests</h1>
        <p>Review NGO requests and schedule food pickups.</p>
    </section>

    <section class="table-container">
        <div class="table-heading">
            <h2>Request Records</h2>
            <span class="record-label">NGO Requests</span>
        </div>

        <div class="table-scroll">
            <table>
                <thead>
                    <tr>
                        <th>Food Name</th>
                        <th>Quantity</th>
                        <th>NGO</th>
                        <th>Status</th>
                        <th>Pickup Schedule</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="r" items="${requests}">
                        <tr>
                            <td class="food-name">${r.donation.foodName}</td>
                            <td>${r.donation.quantity}</td>
                            <td>
                                <a class="ngo-link"
                                   href="${pageContext.request.contextPath}/ngo_details?id=${r.ngo.id}">
                                    ${r.ngo.name}
                                </a>
                            </td>
                            <td>
                                <span class="status ${r.status == 'PENDING' ? 'pending' :
                                    r.status == 'ACCEPTED' ? 'accepted' :
                                    r.status == 'REJECTED' ? 'rejected' : 'completed'}">
                                    ${r.status}
                                </span>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty r.scheduledPickupTime}">
                                        ${r.scheduledPickupTime.toString().replace('T', ' ')}
                                    </c:when>
                                    <c:otherwise>Not scheduled</c:otherwise>
                                </c:choose>
                            </td>
                            <td class="actions">
                                <c:if test="${r.status == 'PENDING'}">
                                    <form action="${pageContext.request.contextPath}/accept_request"
                                          method="post">
                                        <input type="hidden" name="id" value="${r.id}">
                                        <label>Pickup date and time</label>
                                        <input type="datetime-local"
                                               name="scheduledPickupTime"
                                               required
                                               min="${minPickupDateTime}">
                                        <button type="submit" class="accept-btn">
                                            Accept &amp; Schedule
                                        </button>
                                    </form>
                                    <a class="reject-btn"
                                       href="${pageContext.request.contextPath}/reject_request?id=${r.id}"
                                       onclick="return confirm('Reject this request?');">
                                        Reject
                                    </a>
                                </c:if>
                                <c:if test="${r.status == 'ACCEPTED'}">
                                    <span class="action-note">Scheduled ✓</span>
                                </c:if>
                                <c:if test="${r.status == 'REJECTED'}">
                                    <span class="action-note rejected-note">Rejected ✕</span>
                                </c:if>
                                <c:if test="${r.status == 'COMPLETED'}">
                                    <span class="action-note completed-note">Completed ✓</span>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty requests}">
                        <tr>
                            <td colspan="6" class="empty-state">
                                <strong>No pickup requests found</strong>
                                <p>NGO pickup requests will appear here.</p>
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
