
package com.jsp.fddms.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "pickup_requests")
public class PickupRequest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "donation_id")
    private Donation donation;

    @ManyToOne
    @JoinColumn(name = "ngo_id")
    private User ngo;

    private String status = "PENDING";

    private LocalDateTime scheduledPickupTime;

    public PickupRequest() {
    }

    public PickupRequest(Donation donation, User ngo, String status) {
        this.donation = donation;
        this.ngo = ngo;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Donation getDonation() {
        return donation;
    }

    public void setDonation(Donation donation) {
        this.donation = donation;
    }

    public User getNgo() {
        return ngo;
    }

    public void setNgo(User ngo) {
        this.ngo = ngo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDateTime getScheduledPickupTime() {
        return scheduledPickupTime;
    }

    public void setScheduledPickupTime(LocalDateTime scheduledPickupTime) {
        this.scheduledPickupTime = scheduledPickupTime;
    }

    @Override
    public String toString() {
        return "PickupRequest [id=" + id
                + ", donation=" + donation
                + ", ngo=" + ngo
                + ", status=" + status
                + ", scheduledPickupTime=" + scheduledPickupTime + "]";
    }
}
