package ar.edu.unju.fi.arquitecturas.securityservice.service;

import ar.edu.unju.fi.arquitecturas.securityservice.dto.AuthResponse;
import ar.edu.unju.fi.arquitecturas.securityservice.dto.LoginRequest;
import ar.edu.unju.fi.arquitecturas.securityservice.dto.RegisterRequest;
import ar.edu.unju.fi.arquitecturas.securityservice.model.Usuario;
import ar.edu.unju.fi.arquitecturas.securityservice.repository.UsuarioRepository;
import ar.edu.unju.fi.arquitecturas.securityservice.security.JwtService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

@Service
@RequiredArgsConstructor
public class AuthService {

    private final UsuarioRepository usuarioRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;

    public AuthResponse register(RegisterRequest request) {
        if (usuarioRepository.existsByEmail(request.getEmail())) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "El email ya está registrado");
        }

        Usuario nuevoUsuario = Usuario.builder()
                .email(request.getEmail())
                .password(passwordEncoder.encode(request.getPassword()))
                .rol(request.getRol())
                .activo(true)
                .build();

        Usuario guardado = usuarioRepository.save(nuevoUsuario);
        String token = jwtService.generateToken(guardado);

        return AuthResponse.builder()
                .token(token)
                .userId(guardado.getId())
                .email(guardado.getEmail())
                .rol(guardado.getRol().name())
                .build();
    }

    public AuthResponse login(LoginRequest request) {
        Usuario usuario = usuarioRepository.findByEmail(request.getEmail())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Credenciales inválidas"));

        if (!usuario.getActivo() || !passwordEncoder.matches(request.getPassword(), usuario.getPassword())) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Credenciales inválidas");
        }

        String token = jwtService.generateToken(usuario);

        return AuthResponse.builder()
                .token(token)
                .userId(usuario.getId())
                .email(usuario.getEmail())
                .rol(usuario.getRol().name())
                .build();
    }
}