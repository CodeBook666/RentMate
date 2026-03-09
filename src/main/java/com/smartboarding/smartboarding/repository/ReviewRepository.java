package com.smartboarding.smartboarding.repository;

import com.smartboarding.smartboarding.model.Review;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ReviewRepository extends JpaRepository<Review, Long> {

    List<Review> findByPropertyId(Long propertyId);

}