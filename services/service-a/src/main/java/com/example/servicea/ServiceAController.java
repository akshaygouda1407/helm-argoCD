package com.example.servicea;

import java.util.Map;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ServiceAController {

    @GetMapping("/")
    public Map<String, String> home() {
        return Map.of(
                "service", "service-a",
                "version", "v1",
                "status", "running"
        );
    }
}