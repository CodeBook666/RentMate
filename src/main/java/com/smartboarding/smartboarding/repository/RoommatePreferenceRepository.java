package com.smartboarding.smartboarding.repository;

import com.smartboarding.smartboarding.model.RoommatePreference;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RoommatePreferenceRepository extends JpaRepository<RoommatePreference, Long> {

    List<RoommatePreference> findBySocialEnergyAndSmokingHabit(
            String socialEnergy,
            String smokingHabit
    );

}