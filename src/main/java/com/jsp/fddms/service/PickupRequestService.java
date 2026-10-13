
package com.jsp.fddms.service;

import java.time.LocalDateTime;
import java.util.List;

import com.jsp.fddms.entity.PickupRequest;
import com.jsp.fddms.entity.User;

public interface PickupRequestService {

    boolean createRequest(int donationId, User ngo);

    List<PickupRequest> getRequestsForDonor(int donorId);

    void acceptRequest(int requestId, LocalDateTime scheduledPickupTime);

    void rejectRequest(int requestId);

    List<PickupRequest> getRequestsForNgo(int ngoId);

    List<PickupRequest> getRejectedRequestsForNgo(int ngoId);

    void completeRequest(int requestId);
}
