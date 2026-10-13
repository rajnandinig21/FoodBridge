package com.jsp.fddms.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jsp.fddms.entity.Donation;
import com.jsp.fddms.entity.User;

@Repository
public interface DonationRepository extends JpaRepository<Donation, Integer> {

	List<Donation> findByStatusAndFoodNameContainingIgnoreCaseOrStatusAndDescriptionContainingIgnoreCaseOrStatusAndPickupAddressContainingIgnoreCase(
	        String status1, String foodName,
	        String status2, String description,
	        String status3, String pickupAddress);

    List<Donation> findByDonor(User donor);
    
    @Override
     Optional<Donation> findById(Integer id);

    int countByDonorId(int donorId);
    
    List<Donation> findByStatus(String status);
    
    List<Donation> findByNgoAndStatus(User ngo,String status);
    
    List<Donation> findByStatusAndFoodNameContainingIgnoreCaseAndFoodCategoryContainingIgnoreCaseAndFoodTypeContainingIgnoreCaseAndDonorTypeContainingIgnoreCase(
            String status,
            String foodName,
            String foodCategory,
            String foodType,
            String donorType);

}
