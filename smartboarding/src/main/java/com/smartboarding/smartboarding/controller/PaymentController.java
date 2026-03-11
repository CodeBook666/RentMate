package com.smartboarding.smartboarding.controller;

import com.smartboarding.smartboarding.model.Payment;
import com.smartboarding.smartboarding.repository.PaymentRepository;

import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/payments")
@CrossOrigin
public class PaymentController {

    private final PaymentRepository repository;

    public PaymentController(PaymentRepository repository) {
        this.repository = repository;
    }

    @PostMapping("/pay")
    public Payment makePayment(@RequestBody Payment payment){

        payment.setStatus("PAID");
        payment.setPaymentDate(LocalDate.now());

        return repository.save(payment);
    }

    @GetMapping("/all")
    public List<Payment> getAllPayments(){
        return repository.findAll();
    }

    @GetMapping("/user/{userId}")
    public List<Payment> getUserPayments(@PathVariable Long userId){
        return repository.findByUserId(userId);
    }
}