SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE usuarios;
SET FOREIGN_KEY_CHECKS = 1;

-- Password para admin, mauricio y lucas: 'password123'
-- Password para jorge: 'ElMasMeJOR'

INSERT INTO usuarios (id, email, password, rol, activo) VALUES
    (1, 'admin@logitrack.com',        '$2a$10$Y3vfyb8jAijm1Sk8aTSa2uTsKSeCXenqPogeMaN8mPz4IoZGDQBwG', 'ADMIN', true),
    (2, 'mauricio@logitrack.com',     '$2a$10$Y3vfyb8jAijm1Sk8aTSa2uTsKSeCXenqPogeMaN8mPz4IoZGDQBwG', 'ADMIN', true),
    (3, 'jorge@logitrack.com',        '$2a$10$CBKFjz/GTQLRSC9QvCzTceeCI3QJKdWRqlzYvXzc/qu1YHkqk6Dim', 'REPARTIDOR', true),
    (4, 'lucas@logitrack.com',        '$2a$10$Y3vfyb8jAijm1Sk8aTSa2uTsKSeCXenqPogeMaN8mPz4IoZGDQBwG', 'CLIENTE', true),
    (5, 'lucia@logitrack.com',        '$2a$10$Y3vfyb8jAijm1Sk8aTSa2uTsKSeCXenqPogeMaN8mPz4IoZGDQBwG', 'REPARTIDOR', true),
    (6, 'pedro@logitrack.com',        '$2a$10$Y3vfyb8jAijm1Sk8aTSa2uTsKSeCXenqPogeMaN8mPz4IoZGDQBwG', 'REPARTIDOR', true),
    (7, 'juan.perez@logitrack.com',   '$2a$10$Y3vfyb8jAijm1Sk8aTSa2uTsKSeCXenqPogeMaN8mPz4IoZGDQBwG', 'CLIENTE', true),
    (8, 'maria.lopez@logitrack.com',  '$2a$10$Y3vfyb8jAijm1Sk8aTSa2uTsKSeCXenqPogeMaN8mPz4IoZGDQBwG', 'CLIENTE', true);