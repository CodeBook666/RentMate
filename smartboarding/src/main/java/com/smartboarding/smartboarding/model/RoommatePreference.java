package com.smartboarding.smartboarding.model;

import jakarta.persistence.*;

@Entity
public class RoommatePreference {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long userId;

    private String socialEnergy;
    private String dietaryPreference;
    private String smokingHabit;
    private String sleepSchedule;
    private String cleanlinessLevel;
    private String guestPolicy;

    public RoommatePreference(){}

    public Long getId() {
        return id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getSocialEnergy() {
        return socialEnergy;
    }

    public void setSocialEnergy(String socialEnergy) {
        this.socialEnergy = socialEnergy;
    }

    public String getDietaryPreference() {
        return dietaryPreference;
    }

    public void setDietaryPreference(String dietaryPreference) {
        this.dietaryPreference = dietaryPreference;
    }

    public String getSmokingHabit() {
        return smokingHabit;
    }

    public void setSmokingHabit(String smokingHabit) {
        this.smokingHabit = smokingHabit;
    }

    public String getSleepSchedule() {
        return sleepSchedule;
    }

    public void setSleepSchedule(String sleepSchedule) {
        this.sleepSchedule = sleepSchedule;
    }

    public String getCleanlinessLevel() {
        return cleanlinessLevel;
    }

    public void setCleanlinessLevel(String cleanlinessLevel) {
        this.cleanlinessLevel = cleanlinessLevel;
    }

    public String getGuestPolicy() {
        return guestPolicy;
    }

    public void setGuestPolicy(String guestPolicy) {
        this.guestPolicy = guestPolicy;
    }
}