SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE usuarios;
SET FOREIGN_KEY_CHECKS = 1;

-- Hash BCrypt para 'password123': $2a$10$w8.3fR0kZ0FmEvpGvLZeUu8yDqB/H3b3g3nFf3.wE2eXj8y7L5iOu
-- Hash BCrypt para 'ElMasMeJOR':   $2a$10$fW3eT1p8oP5pBsqwGZlJreN1E4LzK5Y4q5o9Xv0L3XjK2M8P7e6Yi

INSERT INTO usuarios (id, email, password, rol, activo) VALUES
                                                            (1, 'admin@logitrack.com', '$2a$10$w8.3fR0kZ0FmEvpGvLZeUu8yDqB/H3b3g3nFf3.wE2eXj8y7L5iOu', 'ADMIN', true),
                                                            (2, 'mauricio@logitrack.com', '$2a$10$w8.3fR0kZ0FmEvpGvLZeUu8yDqB/H3b3g3nFf3.wE2eXj8y7L5iOu', 'ADMIN', true),
                                                            (3, 'jorge@logitrack.com', '$2a$10$fW3eT1p8oP5pBsqwGZlJreN1E4LzK5Y4q5o9Xv0L3XjK2M8P7e6Yi', 'REPARTIDOR', true),
                                                            (4, 'lucas@logitrack.com', '$2a$10$w8.3fR0kZ0FmEvpGvLZeUu8yDqB/H3b3g3nFf3.wE2eXj8y7L5iOu', 'CLIENTE', true);