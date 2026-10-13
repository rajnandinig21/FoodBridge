package com.jsp.fddms.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import java.time.LocalDateTime;
import org.springframework.format.annotation.DateTimeFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jsp.fddms.entity.Donation;
import com.jsp.fddms.entity.PickupRequest;
import com.jsp.fddms.entity.User;
import com.jsp.fddms.service.DonationService;
import com.jsp.fddms.service.PickupRequestService;
import com.jsp.fddms.service.UserService;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;

@Controller
public class DonationController {
	@Autowired
	private DonationService donationService;

	@Autowired
	private PickupRequestService pickupRequestService;

	@Autowired
	private UserService userService;

	@GetMapping("/add_donation")
	public String openDonationPage() {
		return "add_donation";
	}

	@PostMapping("/add_donation")
	public String addDonation(@ModelAttribute Donation donation, @RequestParam("photo") MultipartFile photo,
			Model model, HttpSession session) throws IOException {

		User user = (User) session.getAttribute("user");

		donation.setDonor(user);

		// Create uploads folder
		String uploadDir = "uploads/";

		Files.createDirectories(Paths.get(uploadDir));

		// Save uploaded image

		if (photo != null && !photo.isEmpty()) {
			String fileName = System.currentTimeMillis() + "_" + photo.getOriginalFilename();

			Path uploadPath = Paths.get("uploads").toAbsolutePath();
			Files.createDirectories(uploadPath);

			Path filePath = uploadPath.resolve(fileName);
			Files.write(filePath, photo.getBytes());

			donation.setPhotoPath(fileName);
		}


		donationService.addDonation(donation);

		model.addAttribute("message", "Donation Added Successfully");

		return "add_donation";
	}

	@GetMapping("/my_donations")
	public String viewDonation(HttpSession session, Model model) {

		User user = (User) session.getAttribute("user");
		List<Donation> donations = donationService.viewMyDonations(user);

		model.addAttribute("donations", donations);

		return "my_donations";

	}

	@GetMapping("/edit_donation")
	public String openEditDonationPage(@RequestParam int id, Model model) {
		Donation donation = donationService.findDonationById(id);

		model.addAttribute("donation", donation);
		return "edit_donation";
	}

	@PostMapping("/update_donation")
	public String updateDonation(@ModelAttribute Donation donation, HttpSession session, Model model) {

		User user = (User) session.getAttribute("user");
		donation.setDonor(user);

		donationService.addDonation(donation);

		model.addAttribute("message", "Donation Updated Successfully");

		return "redirect:/my_donations";

	}

	@GetMapping("/delete_donation")
	public String deleteDonation(@RequestParam int id, Model model) {

		donationService.deleteDonation(id);

		model.addAttribute("message", "Donation Deleted Successfully");
		return "redirect:/my_donations";
	}

	@GetMapping("/available_donations")
	public String availableDonations(HttpSession session, Model model) {

		User ngo = (User) session.getAttribute("user");

		if (ngo == null) {
			return "redirect:/login";
		}

		List<Donation> donations = donationService.availableDonations();

		for (Donation d : donations) {
			System.out.println(
					"AVAILABLE DONATION: " + d.getId() + " | " + d.getFoodName() + " | STATUS: " + d.getStatus());
		}

		List<PickupRequest> requests = pickupRequestService.getRequestsForNgo(ngo.getId());

		model.addAttribute("donations", donations);
		model.addAttribute("requests", requests);

		return "available_donations";
	}

	@GetMapping("/request_donation")
	public String acceptDonation(@RequestParam int id, HttpSession session, Model model) {

		User ngo = (User) session.getAttribute("user");

		if (ngo == null) {
			return "redirect:/login";
		}

		boolean created = pickupRequestService.createRequest(id, ngo);

		if (!created) {
			model.addAttribute("message", "You have already requested this donation.");
			return "available_donations";
		}

		return "redirect:/available_donations";
	}

	@GetMapping("/accepted_donations")
	public String acceptedDonations(HttpSession session, Model model) {
		User ngo = (User) session.getAttribute("user");
		List<Donation> donations = donationService.acceptedDonations(ngo);

		model.addAttribute("donations", donations);
		return "accepted_donations";
	}

	@GetMapping("/track_donations")
	public String trackDonations(HttpSession session, Model model) {

		User ngo = (User) session.getAttribute("user");

		if (ngo == null) {
			return "redirect:/login";
		}

		model.addAttribute("requests", pickupRequestService.getRequestsForNgo(ngo.getId()));

		return "track_donations";
	}

	@GetMapping("/rejected_donations")
	public String rejectedDonations(HttpSession session, Model model) {

		User ngo = (User) session.getAttribute("user");

		if (ngo == null) {
			return "redirect:/login";
		}

		model.addAttribute("requests", pickupRequestService.getRejectedRequestsForNgo(ngo.getId()));

		return "rejected_donations";
	}

	@GetMapping("/pickup_requests")
	public String pickupRequests(HttpSession session, Model model) {

		User donor = (User) session.getAttribute("user");

		model.addAttribute("requests", pickupRequestService.getRequestsForDonor(donor.getId()));

		model.addAttribute("minPickupDateTime",
				java.time.LocalDateTime.now().plusMinutes(1).withSecond(0).withNano(0).toString());
		return "pickup_requests";
	}

	@PostMapping("/accept_request")
	public String acceptRequest(@RequestParam int id,
			@RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime scheduledPickupTime,
			HttpSession session) {

		User donor = (User) session.getAttribute("user");

		if (donor == null || !"DONOR".equalsIgnoreCase(donor.getRole())) {
			return "redirect:/login";
		}

		pickupRequestService.acceptRequest(id, scheduledPickupTime);

		return "redirect:/pickup_requests";
	}

	@GetMapping("/reject_request")
	public String rejectRequest(@RequestParam int id) {

		pickupRequestService.rejectRequest(id);

		return "redirect:/pickup_requests";
	}

	@GetMapping("/complete_pickup")
	public String completePickup(@RequestParam int id) {

		pickupRequestService.completeRequest(id);

		return "redirect:/track_donations";
	}

	@GetMapping("/ngo_details")
	public String ngoDetails(@RequestParam int id, Model model) {

		User ngo = userService.findUserById(id);

		model.addAttribute("ngo", ngo);

		return "ngo_details";
	}

	@GetMapping("/search_donations")
	public String searchDonations(@RequestParam(required = false) String keyword,
			@RequestParam(required = false) String foodCategory, @RequestParam(required = false) String foodType,
			@RequestParam(required = false) String donorType, Model model) {

		List<Donation> donations = donationService.filterDonations(keyword, foodCategory, foodType, donorType);

		model.addAttribute("donations", donations);

		return "available_donations";
	}

	@GetMapping("/donation_details")
	public String donationDetails(@RequestParam int id, Model model) {

		Donation donation = donationService.findDonationById(id);

		if (donation == null) {
			return "redirect:/available_donations";
		}

		model.addAttribute("donation", donation);

		return "donation_details";
	}
}
