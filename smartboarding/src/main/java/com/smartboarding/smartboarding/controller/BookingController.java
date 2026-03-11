package com.smartboarding.smartboarding.controller;

import com.smartboarding.smartboarding.model.Booking;
import com.smartboarding.smartboarding.repository.BookingRepository;

import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/bookings")
@CrossOrigin
public class BookingController {

    private final BookingRepository repository;

    public BookingController(BookingRepository repository) {
        this.repository = repository;
    }

    // Create booking request
    @PostMapping("/request")
    public Booking requestBooking(@RequestBody Booking booking){

        booking.setStatus("PENDING");
        booking.setRequestDate(LocalDate.now());

        return repository.save(booking);
    }

    // Get all bookings
    @GetMapping("/all")
    public List<Booking> getAllBookings(){
        return repository.findAll();
    }

    // Get bookings by user
    @GetMapping("/user/{userId}")
    public List<Booking> getUserBookings(@PathVariable Long userId){
        return repository.findByUserId(userId);
    }

    // Get bookings by room
    @GetMapping("/room/{roomId}")
    public List<Booking> getRoomBookings(@PathVariable Long roomId){
        return repository.findByRoomId(roomId);
    }
}