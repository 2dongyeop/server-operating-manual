package io.wisoft.apiexample.service;

import io.wisoft.apiexample.entity.ExampleEntity;
import io.wisoft.apiexample.repository.ExampleRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class ExampleService {

    private final ExampleRepository exampleRepository;

    public ExampleEntity findById(long l) {
        return exampleRepository.findById(l).orElse(null);
    }
}
