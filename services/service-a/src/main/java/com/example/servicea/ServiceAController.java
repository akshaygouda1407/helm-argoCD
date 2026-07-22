package com.example.servicea;

import java.time.Instant;
import java.util.Map;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/service-a")
public class ServiceAController {

    @Value("${app.environment:local}")
    private String environment;

    @GetMapping
    public Map<String, Object> getServiceInfo() {
        return Map.of(
            "service", "service-a",
            "message", "Hello from Service A",
            "environment", environment,
            "timestamp", Instant.now().toString()
        );
    }
}
