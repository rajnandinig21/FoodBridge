package com.jsp.fddms.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsp.fddms.entity.Donation;
import com.jsp.fddms.entity.PickupRequest;
import com.jsp.fddms.entity.User;
import com.jsp.fddms.repository.DonationRepository;
import com.jsp.fddms.repository.PickupRequestRepo;

@Service
public class PickupRequestServiceImpl implements PickupRequestService {

	@Autowired
	private PickupRequestRepo pickupRequestRepo;

	@Autowired
	private DonationRepository donationRepo;

	@Autowired
	private EmailService emailService;

	// =====================================================
	// NGO REQUESTS PICKUP
	// =====================================================

	@Override
	public boolean createRequest(int donationId, User ngo) {

		if (pickupRequestRepo.existsByNgoIdAndDonationIdAndStatus(ngo.getId(), donationId, "PENDING")) {

			return false;
		}

		Donation donation = donationRepo.findById(donationId).orElse(null);

		if (donation == null) {
			return false;
		}

		PickupRequest request = new PickupRequest(donation, ngo, "PENDING");

		pickupRequestRepo.save(request);

		// Send email to donor
		User donor = donation.getDonor();

		if (donor != null && donor.getEmail() != null) {

			String subject = "New Pickup Request - Food Donation Management System";

			String message = "Hello " + donor.getName() + ",\n\n" + "You have received a new pickup request.\n\n"
					+ "Food: " + donation.getFoodName() + "\n" + "Quantity: " + donation.getQuantity() + "\n" + "NGO: "
					+ ngo.getName() + "\n" + "NGO Email: " + ngo.getEmail() + "\n" + "NGO Phone: " + ngo.getPhone()
					+ "\n\n" + "Please login to the Food Donation Management System "
					+ "to accept or reject this request.\n\n" + "Thank you.";

			try {
				emailService.sendEmail(donor.getEmail(), subject, message);
			} catch (Exception e) {
				System.out.println("Unable to send pickup request email: " + e.getMessage());
			}
		}

		return true;
	}

	// =====================================================
	// DONOR REQUESTS
	// =====================================================

	@Override
	public List<PickupRequest> getRequestsForDonor(int donorId) {

		return pickupRequestRepo.findByDonationDonorId(donorId);
	}

	// =====================================================
	// DONOR ACCEPTS REQUEST
	// =====================================================

	
	// =====================================================
	// DONOR REJECTS REQUEST
	// =====================================================

	@Override
	public void rejectRequest(int requestId) {

		PickupRequest request = pickupRequestRepo.findById(requestId).orElse(null);

		if (request != null) {

			request.setStatus("REJECTED");
			pickupRequestRepo.save(request);

			Donation donation = request.getDonation();

			donation.setStatus("AVAILABLE");

			request.setScheduledPickupTime(null);
			donationRepo.save(donation);

			// Send email to NGO
			User ngo = request.getNgo();
			User donor = donation.getDonor();

			if (ngo != null && ngo.getEmail() != null) {

				String subject = "Pickup Request Rejected";

				String message = "Hello " + ngo.getName() + ",\n\n" + "Unfortunately, your pickup request has been "
						+ "REJECTED by the donor.\n\n" + "Food: " + donation.getFoodName() + "\n" + "Quantity: "
						+ donation.getQuantity() + "\n" + "Donor: " + donor.getName() + "\n\n"
						+ "The donation is now available again for other " + "pickup requests.\n\n" + "Thank you.";

				try {
					emailService.sendEmail(ngo.getEmail(), subject, message);
				} catch (Exception e) {
					System.out.println("Unable to send rejection email: " + e.getMessage());
				}
			}
		}
	}

	// =====================================================
	// NGO REQUESTS
	// =====================================================

	@Override
	public List<PickupRequest> getRequestsForNgo(int ngoId) {

		return pickupRequestRepo.findByNgoId(ngoId);
	}

	@Override
	public List<PickupRequest> getRejectedRequestsForNgo(int ngoId) {

		return pickupRequestRepo.findByNgoIdAndStatus(ngoId, "REJECTED");
	}

	// =====================================================
	// NGO COMPLETES DONATION
	// =====================================================

	@Override
	public void completeRequest(int requestId) {

		PickupRequest request = pickupRequestRepo.findById(requestId).orElse(null);

		if (request != null && request.getStatus().equals("ACCEPTED")) {

			request.setStatus("COMPLETED");
			pickupRequestRepo.save(request);

			Donation donation = request.getDonation();

			donation.setStatus("COMPLETED");

			donationRepo.save(donation);

			// Users
			User ngo = request.getNgo();
			User donor = donation.getDonor();

			// =================================================
			// EMAIL TO DONOR
			// =================================================

			if (donor != null && donor.getEmail() != null) {

				String subject = "Donation Completed Successfully";

				String message = "Hello " + donor.getName() + ",\n\n" + "Your food donation has been successfully "
						+ "completed.\n\n" + "Food: " + donation.getFoodName() + "\n" + "Quantity: "
						+ donation.getQuantity() + "\n" + "NGO: " + ngo.getName() + "\n\n"
						+ "Thank you for helping make a difference "
						+ "through the Food Donation Management System.\n\n" + "Thank you.";

				try {
					emailService.sendEmail(donor.getEmail(), subject, message);
				} catch (Exception e) {
					System.out.println("Unable to send completion email to donor: " + e.getMessage());
				}
			}

			// =================================================
			// EMAIL TO NGO
			// =================================================

			if (ngo != null && ngo.getEmail() != null) {

				String subject = "Donation Pickup Completed";

				String message = "Hello " + ngo.getName() + ",\n\n" + "The pickup for the following donation has been "
						+ "marked as COMPLETED.\n\n" + "Food: " + donation.getFoodName() + "\n" + "Quantity: "
						+ donation.getQuantity() + "\n" + "Donor: " + donor.getName() + "\n\n"
						+ "Thank you for participating in the Food Donation " + "Management System.";

				try {
					emailService.sendEmail(ngo.getEmail(), subject, message);
				} catch (Exception e) {
					System.out.println("Unable to send completion email to NGO: " + e.getMessage());
				}
			}
		}
	}


@Override
public void acceptRequest(int requestId, LocalDateTime scheduledPickupTime) {

    PickupRequest request =
            pickupRequestRepo.findById(requestId).orElse(null);

    if (request == null || !"PENDING".equals(request.getStatus())) {
        return;
    }

    if (scheduledPickupTime == null ||
            !scheduledPickupTime.isAfter(LocalDateTime.now())) {
        throw new IllegalArgumentException(
                "Pickup date and time must be in the future.");
    }

    request.setStatus("ACCEPTED");
    request.setScheduledPickupTime(scheduledPickupTime);
    pickupRequestRepo.save(request);

    Donation donation = request.getDonation();
    donation.setStatus("ACCEPTED");
    donation.setNgo(request.getNgo());
    donationRepo.save(donation);

    User ngo = request.getNgo();
    User donor = donation.getDonor();

    if (ngo != null && ngo.getEmail() != null) {
        String subject = "Pickup Request Accepted - FoodBridge";

        String message = "Hello " + ngo.getName() + ",\n\n"
                + "Your pickup request has been accepted.\n\n"
                + "Food: " + donation.getFoodName() + "\n"
                + "Quantity: " + donation.getQuantity() + "\n"
                + "Donor: " + (donor != null ? donor.getName() : "N/A") + "\n"
                + "Donor Phone: " + (donor != null ? donor.getPhone() : "N/A") + "\n"
                + "Pickup Address: " + donation.getPickupAddress() + "\n"
                + "Scheduled Pickup: " + scheduledPickupTime + "\n\n"
                + "Please arrive at the scheduled time.\n\n"
                + "Thank you,\nFoodBridge";

        try {
            emailService.sendEmail(ngo.getEmail(), subject, message);
        } catch (Exception e) {
            System.out.println(
                    "Unable to send acceptance email: " + e.getMessage());
        }
    }
}

}