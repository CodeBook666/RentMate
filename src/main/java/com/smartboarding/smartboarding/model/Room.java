package com.smartboarding.smartboarding.model;

import jakarta.persistence.*;

@Entity
public class Room {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long propertyId;

    private String roomType;
    private String gender;

    private double price;

    private boolean wifi;
    private boolean meals;
    private boolean ac;
    private boolean attachedBathroom;

    public Room() {}

    public Long getId() {
        return id;
    }

    public Long getPropertyId() {
        return propertyId;
    }

    public void setPropertyId(Long propertyId) {
        this.propertyId = propertyId;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean isWifi() {
        return wifi;
    }

    public void setWifi(boolean wifi) {
        this.wifi = wifi;
    }

    public boolean isMeals() {
        return meals;
    }

    public void setMeals(boolean meals) {
        this.meals = meals;
    }

    public boolean isAc() {
        return ac;
    }

    public void setAc(boolean ac) {
        this.ac = ac;
    }

    public boolean isAttachedBathroom() {
        return attachedBathroom;
    }

    public void setAttachedBathroom(boolean attachedBathroom) {
        this.attachedBathroom = attachedBathroom;
    }
}