package com.example.serviceb;

import java.time.Instant;
import java.util.Map;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/service-b")
public class ServiceBController {

    @Value("${app.environment:local}")
    private String environment;

    @GetMapping
    public Map<String, Object> getServiceInfo() {
        return Map.of(
            "service", "service-b",
            "message", "Hello from Service B",
            "environment", environment,
            "timestamp", Instant.now().toString()
        );
    }
}
