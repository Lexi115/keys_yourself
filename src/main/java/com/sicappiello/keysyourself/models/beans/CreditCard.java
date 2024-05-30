package com.sicappiello.keysyourself.models.beans;

import java.time.LocalDate;

public class CreditCard {

    private String cardNumber;
    private String expirationDate;
    private String cvv;
    private double balance;

    public CreditCard() {
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(String expirationDate) {
        this.expirationDate = expirationDate;
    }

    public String getCvv() {
        return cvv;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public boolean isExpired() {
        LocalDate today = LocalDate.now();
        LocalDate expiryDate = LocalDate.parse(expirationDate);
        return today.isAfter(expiryDate);
    }

    @Override
    public String toString() {
        return "CreditCard{" +
                "cardNumber='" + cardNumber + '\'' +
                ", expirationDate=" + expirationDate +
                ", cvv=" + cvv +
                ", balance=" + balance +
                '}';
    }
}
