
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FoodBridge | Add Donation</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/add_donation.css">
</head>

<body>

<div class="page-container">

	
	<nav class="navbar">
	    <a href="${pageContext.request.contextPath}/donor_dashboard" class="brand">
	        <span class="brand-icon">F</span>
	        <span>Food<span class="brand-accent">Bridge</span></span>
	    </a>

	    <div class="nav-links">
	        <a href="${pageContext.request.contextPath}/donor_dashboard">Dashboard</a>
	        <a href="${pageContext.request.contextPath}/profile">My Profile</a>
	        <a href="${pageContext.request.contextPath}/my_donations">My Donations</a>
	        <a href="${pageContext.request.contextPath}/pickup_requests">Pickup Requests</a>
	        <a href="${pageContext.request.contextPath}/logout" class="logout-btn">Logout</a>
	    </div>
	</nav>
	

    <main class="form-container">

        <div class="page-heading">
            <p class="eyebrow">MAKE A DIFFERENCE</p>
            <h1>Add a Food Donation</h1>
            <p>Share surplus food and help provide meals to people in need.</p>
        </div>

        <form action="${pageContext.request.contextPath}/add_donation"
              method="post" enctype="multipart/form-data">

            <div class="form-group">
                <label for="foodName">Food Name <span>*</span></label>
                <input type="text" id="foodName" name="foodName"
                       placeholder="Enter food name" required>
            </div>

            <div class="form-group">
                <label>Food Type</label>
                <div class="radio-group">
                    <label class="radio-option">
                        <input type="radio" name="foodType" value="Veg">
                        <span>🥬 Vegetarian</span>
                    </label>
                    <label class="radio-option">
                        <input type="radio" name="foodType" value="Non-Veg">
                        <span>🍗 Non-Vegetarian</span>
                    </label>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="foodCategory">Food Category</label>
                    <select id="foodCategory" name="foodCategory">
                        <option value="">Select category</option>
                        <option value="Cooked Food">Cooked Food</option>
                        <option value="Raw Food">Raw Food</option>
                        <option value="Packaged Food">Packaged Food</option>
                        <option value="Beverages">Beverages</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="donorType">Donor Type <span>*</span></label>
                    <select id="donorType" name="donorType" required>
                        <option value="">Select donor type</option>
                        <option value="Individual">Individual</option>
                        <option value="Restaurant">Restaurant</option>
                        <option value="Hotel">Hotel</option>
                        <option value="Organization">Organization</option>
                        <option value="Other">Other</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label for="quantity">Quantity <span>*</span></label>
                <input type="text" id="quantity" name="quantity"
                       placeholder="e.g. 5 plates or 2 kg" required>
            </div>

            <div class="form-group">
                <label for="pickupAddress">Pickup Address</label>
                <textarea id="pickupAddress" name="pickupAddress" rows="3"
                          placeholder="Enter the complete pickup address"></textarea>
            </div>

            <div class="form-group">
                <label for="expiryDate">Expiry Date</label>
                <input type="date" id="expiryDate" name="expiryDate">
            </div>

            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" rows="3"
                          placeholder="Add details about the food, packaging, etc."></textarea>
            </div>

            <div class="form-group">
                <label for="photo">Food Photo</label>
                <input type="file" id="photo" name="photo" accept="image/*"
                       class="file-input">
                <small>Upload a clear photo of the donated food, if available.</small>
            </div>

            <button type="submit" class="submit-btn">Submit Donation →</button>

            <p class="message">${message}</p>

        </form>

    </main>

    <footer>Share food, share hope. <span>♥</span></footer>

</div>

</body>
</html>
