package com.example.servicec;

import java.util.Map;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ServiceCController {

    @GetMapping("/")
    public Map<String, String> home() {
        return Map.of(
                "service", "service-c",
                "version", "v1",
                "status", "running"
        );
    }
}