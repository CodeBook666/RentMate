package com.smartboarding.smartboarding.controller;

import com.smartboarding.smartboarding.model.RoommatePreference;
import com.smartboarding.smartboarding.repository.RoommatePreferenceRepository;

import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/roommate")
@CrossOrigin
public class RoommateController {

    private final RoommatePreferenceRepository repository;

    public RoommateController(RoommatePreferenceRepository repository){
        this.repository = repository;
    }

    // Save lifestyle form
    @PostMapping("/preferences")
    public RoommatePreference savePreferences(@RequestBody RoommatePreference pref){
        return repository.save(pref);
    }

    // Find matching roommates
    @PostMapping("/match")
    public List<RoommatePreference> findMatches(@RequestBody RoommatePreference pref){

        return repository.findBySocialEnergyAndSmokingHabit(
                pref.getSocialEnergy(),
                pref.getSmokingHabit()
        );
    }

}