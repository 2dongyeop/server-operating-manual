package io.dongvelop.apiexample.endpoint;

import io.dongvelop.apiexample.service.ExampleService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequiredArgsConstructor
public class ExampleEndpoint {

    private final ExampleService exampleService;

    @GetMapping("/test")
    public ResponseEntity<?> test() {
        return ResponseEntity.ok(exampleService.findById(1L));
    }
}
