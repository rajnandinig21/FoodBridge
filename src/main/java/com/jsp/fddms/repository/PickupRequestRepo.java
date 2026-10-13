package com.jsp.fddms.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.jsp.fddms.entity.PickupRequest;

public interface PickupRequestRepo extends JpaRepository<PickupRequest, Integer> {

    Optional<PickupRequest> findByNgoIdAndDonationId(int ngoId, int donationId);

    List<PickupRequest> findByNgoId(int ngoId);

    int countByNgoId(int ngoId);

    int countByDonationDonorId(int donorId);

    boolean existsByNgoIdAndDonationId(int ngoId, int donationId);

    @Query("SELECT COUNT(p) FROM PickupRequest p WHERE p.ngo.id=?1")
    int countPickupRequestsByNgo(int ngoId);

    @Query("SELECT COUNT(p) FROM PickupRequest p WHERE p.donation.donor.id=?1")
    int countPickupRequestsForDonor(int donorId);
    
    List<PickupRequest> findByDonationDonorId(int donorId);
    
    List<PickupRequest> findByNgoIdAndStatus(int ngoId, String status);
    
    boolean existsByNgoIdAndDonationIdAndStatus(
            int ngoId, int donationId, String status);

}
