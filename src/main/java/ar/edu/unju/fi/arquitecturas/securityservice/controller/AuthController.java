package ar.edu.unju.fi.arquitecturas.securityservice.controller;

import ar.edu.unju.fi.arquitecturas.securityservice.dto.AuthResponse;
import ar.edu.unju.fi.arquitecturas.securityservice.dto.LoginRequest;
import ar.edu.unju.fi.arquitecturas.securityservice.dto.RegisterRequest;
import ar.edu.unju.fi.arquitecturas.securityservice.service.AuthService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AuthService authService;

    @PostMapping("/register")
    public ResponseEntity<AuthResponse> register(@Valid @RequestBody RegisterRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(authService.register(request));
    }

    @PostMapping("/login")
    public ResponseEntity<AuthResponse> login(@Valid @RequestBody LoginRequest request) {
        return ResponseEntity.ok(authService.login(request));
    }
}
