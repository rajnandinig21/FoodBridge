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
@Table(name = "money_donations")
public class MoneyDonation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private double amount;

    private LocalDateTime donationDate;

    private String status = "SUCCESS";

    @ManyToOne
    @JoinColumn(name = "donor_id")
    private User donor;


    public MoneyDonation() {
    }


    public MoneyDonation(double amount, LocalDateTime donationDate,
                         String status, User donor) {

        this.amount = amount;
        this.donationDate = donationDate;
        this.status = status;
        this.donor = donor;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }


    public LocalDateTime getDonationDate() {
        return donationDate;
    }

    public void setDonationDate(LocalDateTime donationDate) {
        this.donationDate = donationDate;
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

        return "MoneyDonation [id=" + id
                + ", amount=" + amount
                + ", donationDate=" + donationDate
                + ", status=" + status
                + ", donor=" + donor + "]";
    }
}