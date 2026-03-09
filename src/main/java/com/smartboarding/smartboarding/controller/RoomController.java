package com.smartboarding.smartboarding.controller;

import com.smartboarding.smartboarding.model.Room;
import com.smartboarding.smartboarding.repository.RoomRepository;

import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/rooms")
@CrossOrigin
public class RoomController {

    private final RoomRepository repository;

    public RoomController(RoomRepository repository) {
        this.repository = repository;
    }

    @PostMapping("/add")
    public Room addRoom(@RequestBody Room room) {
        return repository.save(room);
    }

    @GetMapping("/all")
    public List<Room> getAllRooms() {
        return repository.findAll();
    }

    @GetMapping("/property/{propertyId}")
    public List<Room> getRoomsByProperty(@PathVariable Long propertyId) {
        return repository.findByPropertyId(propertyId);
    }

    @DeleteMapping("/{id}")
    public String deleteRoom(@PathVariable Long id) {
        repository.deleteById(id);
        return "Room deleted";
    }
}