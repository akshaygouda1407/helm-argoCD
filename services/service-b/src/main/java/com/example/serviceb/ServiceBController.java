package com.example.serviceb;

import java.util.Map;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ServiceBController {

    @GetMapping("/")
    public Map<String, String> home() {
        return Map.of(
                "service", "service-b",
                "version", "v1",
                "status", "running"
        );
    }
}