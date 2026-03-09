package com.smartboarding.smartboarding.model;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
public class Payment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long userId;
    private Long roomId;

    private String paymentMethod; // Visa, MasterCard, GooglePay

    private String cardholderName;

    private double amount;

    private String senderName;

    private String accountNumber;

    private String expiryDate;

    private String securityCode;

    private String status;

    private LocalDate paymentDate;

    public Payment(){}

    public Long getId(){ return id; }

    public Long getUserId(){ return userId; }
    public void setUserId(Long userId){ this.userId = userId; }

    public Long getRoomId(){ return roomId; }
    public void setRoomId(Long roomId){ this.roomId = roomId; }

    public String getPaymentMethod(){ return paymentMethod; }
    public void setPaymentMethod(String paymentMethod){ this.paymentMethod = paymentMethod; }

    public String getCardholderName(){ return cardholderName; }
    public void setCardholderName(String cardholderName){ this.cardholderName = cardholderName; }

    public double getAmount(){ return amount; }
    public void setAmount(double amount){ this.amount = amount; }

    public String getSenderName(){ return senderName; }
    public void setSenderName(String senderName){ this.senderName = senderName; }

    public String getAccountNumber(){ return accountNumber; }
    public void setAccountNumber(String accountNumber){ this.accountNumber = accountNumber; }

    public String getExpiryDate(){ return expiryDate; }
    public void setExpiryDate(String expiryDate){ this.expiryDate = expiryDate; }

    public String getSecurityCode(){ return securityCode; }
    public void setSecurityCode(String securityCode){ this.securityCode = securityCode; }

    public String getStatus(){ return status; }
    public void setStatus(String status){ this.status = status; }

    public LocalDate getPaymentDate(){ return paymentDate; }
    public void setPaymentDate(LocalDate paymentDate){ this.paymentDate = paymentDate; }
}