package com.smartboarding.smartboarding.controller;

import com.smartboarding.smartboarding.model.Review;
import com.smartboarding.smartboarding.repository.ReviewRepository;

import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/reviews")
@CrossOrigin
public class ReviewController {

    private final ReviewRepository repository;

    public ReviewController(ReviewRepository repository) {
        this.repository = repository;
    }

    // Add review
    @PostMapping("/add")
    public Review addReview(@RequestBody Review review){
        return repository.save(review);
    }

    // Get all reviews
    @GetMapping("/all")
    public List<Review> getAllReviews(){
        return repository.findAll();
    }

    // Get reviews for a property
    @GetMapping("/property/{propertyId}")
    public List<Review> getPropertyReviews(@PathVariable Long propertyId){
        return repository.findByPropertyId(propertyId);
    }
}