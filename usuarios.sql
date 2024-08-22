CREATE TABLE message_table (
    id bigint primary key generated always as identity,
    content text NOT NULL,
    img_msg bytea,
    user_name text NOT NULL,
    avatar text
);

-- Tabla de llamadas
CREATE TABLE call_table (
    id bigint primary key generated always as identity,
    call_name text NOT NULL,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone,
    participants jsonb, -- Cambiado a JSONB para manejar listas de participantes
    status text NOT NULL CHECK (status IN ('active', 'finished')), -- Añadido CHECK para estado
    created_by text NOT NULL
);

-- Datos ficticios para message_table
INSERT INTO message_table (content, img_msg, user_name, avatar) VALUES
('Hola, ¿cómo estás?', NULL, 'Juan', 'avatar1.png'),
('Aquí está la imagen que pediste.', '\\x89504e470d0a1a0a0000000d49484452', 'María', 'avatar2.png'),
('¿Vamos a almorzar juntos?', NULL, 'Carlos', 'avatar3.png'),
('¡Feliz cumpleaños!', '\\x89504e470d0a1a0a0000000d49484452', 'Ana', 'avatar4.png'),
('Nos vemos mañana.', NULL, 'Luis', 'avatar5.png');
