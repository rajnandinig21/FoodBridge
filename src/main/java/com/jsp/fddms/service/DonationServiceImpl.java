package com.jsp.fddms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsp.fddms.entity.Donation;
import com.jsp.fddms.entity.User;
import com.jsp.fddms.repository.DonationRepository;

@Service
public class DonationServiceImpl implements DonationService {

	@Autowired
	private DonationRepository donationRepo;

	@Override
	public Donation addDonation(Donation donation) {
		Donation save = donationRepo.save(donation);
		return save;
	}

	@Override
	public List<Donation> viewMyDonations(User donor) {
		return donationRepo.findByDonor(donor);
	}

	@Override
	public Donation findDonationById(int id) {
		return donationRepo.findById(id).orElse(null);
	}

	@Override
	public void deleteDonation(int id) {
		donationRepo.deleteById(id);
	}

	@Override
	public List<Donation> availableDonations() {
		List<Donation> list = donationRepo.findByStatus("AVAILABLE");
		return list;
	}

	@Override
	public void acceptDonation(int donationId, User ngo) {
		Donation donation = donationRepo.findById(donationId).orElse(null);
		if(donation!=null) {
			donation.setNgo(ngo);
			donation.setStatus("ACCEPTED");
			donationRepo.save(donation);
			
		}
	}

	@Override
	public List<Donation> acceptedDonations(User ngo) {
		List<Donation> list = donationRepo.findByNgoAndStatus(ngo,"ACCEPTED");
		return list;
	}
	
	@Override
	public List<Donation> searchDonations(String keyword) {

	    return donationRepo.findByStatusAndFoodNameContainingIgnoreCaseOrStatusAndDescriptionContainingIgnoreCaseOrStatusAndPickupAddressContainingIgnoreCase(
	                    "AVAILABLE", keyword,
	                    "AVAILABLE", keyword,
	                    "AVAILABLE", keyword);
	}
	
	@Override
	public List<Donation> filterDonations(String keyword,
	                                      String foodCategory,
	                                      String foodType,
	                                      String donorType) {

	    if (keyword == null) {
	        keyword = "";
	    }

	    if (foodCategory == null) {
	        foodCategory = "";
	    }

	    if (foodType == null) {
	        foodType = "";
	    }

	    if (donorType == null) {
	        donorType = "";
	    }

	    return donationRepo
	            .findByStatusAndFoodNameContainingIgnoreCaseAndFoodCategoryContainingIgnoreCaseAndFoodTypeContainingIgnoreCaseAndDonorTypeContainingIgnoreCase(
	                    "AVAILABLE",
	                    keyword,
	                    foodCategory,
	                    foodType,
	                    donorType);
	}

}
