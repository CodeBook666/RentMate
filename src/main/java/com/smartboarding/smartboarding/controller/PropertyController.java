package com.smartboarding.smartboarding.controller;

import com.smartboarding.smartboarding.model.Property;
import com.smartboarding.smartboarding.repository.PropertyRepository;

import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/properties")
@CrossOrigin
public class PropertyController {

    private final PropertyRepository repository;

    public PropertyController(PropertyRepository repository) {
        this.repository = repository;
    }

    @PostMapping("/add")
    public Property addProperty(@RequestBody Property property){
        return repository.save(property);
    }

    @GetMapping("/all")
    public List<Property> getAllProperties(){
        return repository.findAll();
    }

}