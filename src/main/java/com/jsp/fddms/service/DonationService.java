package com.jsp.fddms.service;

import java.util.List;

import com.jsp.fddms.entity.Donation;
import com.jsp.fddms.entity.User;

public interface DonationService {
	Donation addDonation(Donation donation);
	
	List<Donation> viewMyDonations(User donor);
	
	Donation findDonationById(int id);
	
	void deleteDonation(int id);
	
	List<Donation> availableDonations();
	
	void acceptDonation(int donationId,User ngo);
	
	List<Donation> acceptedDonations(User ngo);
	
	List<Donation> searchDonations(String keyword);
	
	List<Donation> filterDonations(String keyword,
            String foodCategory,
            String foodType,
            String donorType);
}
