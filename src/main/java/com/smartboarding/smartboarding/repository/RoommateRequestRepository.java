package com.smartboarding.smartboarding.repository;

import com.smartboarding.smartboarding.model.RoommateRequest;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RoommateRequestRepository extends JpaRepository<RoommateRequest, Long> {

    List<RoommateRequest> findByReceiverId(Long receiverId);

}