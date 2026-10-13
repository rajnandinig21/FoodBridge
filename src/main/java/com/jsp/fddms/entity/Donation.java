package com.jsp.fddms.entity;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "donations")
public class Donation {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String foodName;
	
	private String foodType;
	
	private String foodCategory;
	
	private String quantity;

	private String pickupAddress;
	
	private LocalDate expiryDate;
	
	private String description;
	
	private String donorType;
	
	private String photoPath;

	private String status="AVAILABLE";

	@ManyToOne
	@JoinColumn(name = "donor_id")
	private User donor;
	
	@ManyToOne
	@JoinColumn(name = "ngo_id")
	private User ngo;

	public Donation() {
		// TODO Auto-generated constructor stub
	}

     
	public Donation( String foodName, String foodType, String foodCategory, String quantity,
			String pickupAddress, LocalDate expiryDate, String description, String donorType,String photoPath, String status, User donor, User ngo) {

		this.foodName = foodName;
		this.foodType = foodType;
		this.foodCategory = foodCategory;
		this.quantity = quantity;
		this.pickupAddress = pickupAddress;
		this.expiryDate = expiryDate;
		this.description = description;
		this.donorType=donorType;
		this.photoPath = photoPath;
		this.status = status;
		this.donor = donor;
		this.ngo = ngo;
	}
	
	
	public String getPhotoPath() {
	    return photoPath;
	}

	public void setPhotoPath(String photoPath) {
	    this.photoPath = photoPath;
	}

	public String getDonorType() {
	    return donorType;
	}

	public void setDonorType(String donorType) {
	    this.donorType = donorType;
	}
	
	public User getNgo() {
		return ngo;
	}


	public void setNgo(User ngo) {
		this.ngo = ngo;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public String getFoodType() {
		return foodType;
	}

	public void setFoodType(String foodType) {
		this.foodType = foodType;
	}

	public String getFoodCategory() {
		return foodCategory;
	}

	public void setFoodCategory(String foodCategory) {
		this.foodCategory = foodCategory;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getPickupAddress() {
		return pickupAddress;
	}

	public void setPickupAddress(String pickupAddress) {
		this.pickupAddress = pickupAddress;
	}

	public LocalDate getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(LocalDate expiryDate) {
		this.expiryDate = expiryDate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public User getDonor() {
		return donor;
	}

	public void setDonor(User donor) {
		this.donor = donor;
	}

	@Override
	public String toString() {
		return "Donation [id=" + id + ", foodName=" + foodName + ", foodType=" + foodType + ", foodCategory="
				+ foodCategory + ", quantity=" + quantity + ", pickupAddress=" + pickupAddress + ", expiryDate="
				+ expiryDate + ", description=" + description + ", status=" + status + ", donor=" + donor + "]";
	}
	
	
	
}
