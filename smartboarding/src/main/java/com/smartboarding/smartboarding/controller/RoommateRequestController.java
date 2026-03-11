package com.smartboarding.smartboarding.controller;

import com.smartboarding.smartboarding.model.RoommateRequest;
import com.smartboarding.smartboarding.repository.RoommateRequestRepository;

import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/roommate")
@CrossOrigin(origins = "*")
public class RoommateRequestController {

    private final RoommateRequestRepository repository;

    public RoommateRequestController(RoommateRequestRepository repository) {
        this.repository = repository;
    }

    // SEND ROOMMATE REQUEST
    @PostMapping("/send")
    public RoommateRequest sendRequest(@RequestBody RoommateRequest request) {

        request.setStatus("pending");

        return repository.save(request);
    }

    // ACCEPT REQUEST
    @PostMapping("/accept/{id}")
    public RoommateRequest acceptRequest(@PathVariable Long id) {

        RoommateRequest request = repository.findById(id).orElse(null);

        if (request != null) {
            request.setStatus("accepted");
            return repository.save(request);
        }

        return null;
    }

    // REJECT REQUEST
    @PostMapping("/reject/{id}")
    public RoommateRequest rejectRequest(@PathVariable Long id) {

        RoommateRequest request = repository.findById(id).orElse(null);

        if (request != null) {
            request.setStatus("rejected");
            return repository.save(request);
        }

        return null;
    }

    // GET REQUESTS FOR USER
    @GetMapping("/requests/{userId}")
    public List<RoommateRequest> getRequests(@PathVariable Long userId) {

        return repository.findByReceiverId(userId);
    }

}