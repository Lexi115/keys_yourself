package com.sicappiello.keysyourself.models.beans;

import java.time.LocalDate;
import java.time.YearMonth;

public class CreditCard {

    private String cardNumber;
    private String expirationDate;
    private String cvv;

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

    public boolean isExpired() {
        LocalDate today = LocalDate.now();
        return today.isAfter(parseIntoLocalDate());
    }

    public LocalDate parseIntoLocalDate(){
        String[] expirationDateString = expirationDate.split("/");
        int year = Integer.parseInt(expirationDateString[1]);
        int month = Integer.parseInt(expirationDateString[0]);
        //prendi l'ultimo giorno del mese
        YearMonth yearMonth = YearMonth.of(year, month);
        int lastDay = yearMonth.lengthOfMonth();

        return LocalDate.of(year,month,lastDay);
    }

    @Override
    public String toString() {
        return "CreditCard{" +
                "cardNumber='" + cardNumber + '\'' +
                ", expirationDate=" + expirationDate +
                ", cvv=" + cvv +
                '}';
    }
}
