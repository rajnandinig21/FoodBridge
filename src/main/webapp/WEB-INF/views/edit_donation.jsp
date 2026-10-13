
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Donation | FoodBridge</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/edit_donation.css">
</head>
<body>

<nav class="navbar">
    <a href="${pageContext.request.contextPath}/donor_dashboard"
       class="brand">Food<span>Bridge</span></a>

    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/donor_dashboard">Dashboard</a>
        <a href="${pageContext.request.contextPath}/profile">My Profile</a>
        <a href="${pageContext.request.contextPath}/my_donations">My Donations</a>
        <a href="${pageContext.request.contextPath}/pickup_requests">Pickup Requests</a>
        <a href="${pageContext.request.contextPath}/logout" class="logout">Logout</a>
    </div>
</nav>

<main class="page-container">
    <div class="page-heading">
        <p class="eyebrow">FOODBRIDGE DONOR</p>
        <h1>Edit Donation</h1>
        <p>Update the details of your food donation.</p>
    </div>

    <form action="${pageContext.request.contextPath}/update_donation"
          method="post" class="donation-form">

        <input type="hidden" name="id" value="${donation.id}">

        <div class="form-group">
            <label for="foodName">Food Name</label>
            <input type="text" id="foodName" name="foodName"
                   value="${donation.foodName}" required>
        </div>

        <div class="form-group">
            <label>Food Type</label>
            <div class="radio-options">
                <label class="radio-label">
                    <input type="radio" name="foodType" value="Veg"
                        ${donation.foodType == 'Veg' ? 'checked' : ''} required>
                    Veg
                </label>

                <label class="radio-label">
                    <input type="radio" name="foodType" value="Non-Veg"
                        ${donation.foodType == 'Non-Veg' ? 'checked' : ''}>
                    Non-Veg
                </label>
            </div>
        </div>

        <div class="form-group">
            <label for="foodCategory">Food Category</label>
            <select id="foodCategory" name="foodCategory" required>
                <option value="">-- Select Food Category --</option>
                <option value="Cooked Food"
                    ${donation.foodCategory == 'Cooked Food' ? 'selected' : ''}>
                    Cooked Food
                </option>
                <option value="Raw Food"
                    ${donation.foodCategory == 'Raw Food' ? 'selected' : ''}>
                    Raw Food
                </option>
                <option value="Packaged Food"
                    ${donation.foodCategory == 'Packaged Food' ? 'selected' : ''}>
                    Packaged Food
                </option>
                <option value="Beverages"
                    ${donation.foodCategory == 'Beverages' ? 'selected' : ''}>
                    Beverages
                </option>
            </select>
        </div>

        <div class="form-group">
            <label for="quantity">Quantity</label>
            <input type="text" id="quantity" name="quantity"
                   value="${donation.quantity}" required>
        </div>

        <div class="form-group">
            <label for="pickupAddress">Pickup Address</label>
            <textarea id="pickupAddress" name="pickupAddress"
                      rows="3" required>${donation.pickupAddress}</textarea>
        </div>

        <div class="form-group">
            <label for="expiryDate">Expiry Date</label>
            <input type="date" id="expiryDate" name="expiryDate"
                   value="${donation.expiryDate}" required>
        </div>

        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description"
                      rows="4">${donation.description}</textarea>
        </div>

        <div class="form-actions">
            <a href="${pageContext.request.contextPath}/my_donations"
               class="cancel-btn">Cancel</a>
            <button type="submit" class="update-btn">Update Donation</button>
        </div>

        <p class="message">${message}</p>
    </form>
</main>

</body>
</html>
