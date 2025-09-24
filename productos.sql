
-- 1) Categorías de queso
CREATE TABLE categories (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  slug VARCHAR(50) NOT NULL,
  description TEXT
);

INSERT INTO categories (id, name, slug, description) VALUES
(1, 'Fresco', 'fresco', 'Quesos no curados, sabor suave y textura húmeda'),
(2, 'Semi-blando', 'semi-blando', 'Textura cremosa, maduración corta'),
(3, 'Curado', 'curado', 'Maduración prolongada, sabor intenso'),
(4, 'Azul', 'azul', 'Quesos con vetas de moho azul, sabor potente'),
(5, 'De cabra', 'cabrita', 'Quesos elaborados con leche de cabra'),
(6, 'De oveja', 'oveja', 'Quesos de leche de oveja'),
(7, 'Procesado', 'procesado', 'Quesos industriales / fundidos');

-- 2) Proveedores (suppliers)
CREATE TABLE suppliers (
  id INT PRIMARY KEY,
  name VARCHAR(100),
  contact_email VARCHAR(100),
  phone VARCHAR(30),
  country VARCHAR(50)
);

INSERT INTO suppliers (id, name, contact_email, phone, country) VALUES
(1, 'Quesos Andinos SAC', 'ventas@quesosandinos.pe', '+51 999 111 222', 'Perú'),
(2, 'Leches del Sur', 'contacto@lechesdelsur.com', '+34 91 555 1234', 'España'),
(3, 'Fromagerie Loire', 'info@fromageloire.fr', '+33 2 47 00 00 00', 'Francia');

-- 3) Tabla principal: productos
CREATE TABLE products (
  id INT PRIMARY KEY,
  sku VARCHAR(30) UNIQUE,
  name VARCHAR(150),
  slug VARCHAR(150),
  description TEXT,
  category_id INT,
  supplier_id INT,
  milk_type VARCHAR(20),       -- 'vaca', 'cabra', 'oveja', 'mezcla'
  aging_days INT DEFAULT 0,
  fat_percent DECIMAL(4,1),
  price DECIMAL(10,2),         -- precio por unidad o por 100g según tu política
  weight_g INT,                -- peso típico del producto en gramos
  stock INT,
  is_featured BOOLEAN DEFAULT FALSE,
  avg_rating DECIMAL(3,2) DEFAULT 0.00,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (category_id) REFERENCES categories(id),
  FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);

INSERT INTO products (id, sku, name, slug, description, category_id, supplier_id, milk_type, aging_days, fat_percent, price, weight_g, stock, is_featured, avg_rating) VALUES
(1, 'QAND-FR-001', 'Queso Fresco Andino', 'queso-fresco-andino', 'Queso fresco local, textura húmeda, ideal para ensaladas y panes.', 1, 1, 'vaca', 3, 22.0, 12.50, 250, 120, TRUE, 4.40),
(2, 'QAND-BR-002', 'Brie de Campo', 'brie-de-campo', 'Brie semi-blando con corteza comestible. Cremoso y aromático.', 2, 2, 'vaca', 21, 28.0, 35.00, 200, 40, TRUE, 4.70),
(3, 'QAND-CH-003', 'Cheddar Curado 12m', 'cheddar-curado-12m', 'Cheddar inglés curado 12 meses, sabor fuerte y notas a frutos secos.', 3, 2, 'vaca', 365, 33.0, 48.00, 300, 25, FALSE, 4.60),
(4, 'QAND-ROQ-004', 'Roquefort Tradicional', 'roquefort-tradicional', 'Queso azul de oveja, con vetas verdes-azules y sabor picante.', 4, 3, 'oveja', 90, 30.0, 60.00, 150, 10, TRUE, 4.85),
(5, 'QAND-CAB-005', 'Queso de Cabra Curado', 'queso-cabra-curado', 'Aroma ligeramente ácido, curado 6 meses, perfecto para tablas.', 5, 1, 'cabra', 180, 27.0, 42.00, 220, 18, FALSE, 4.50),
(6, 'QAND-MIX-006', 'Tomme Mixto', 'tomme-mixto', 'Tomme de mezcla (vaca-oveja), textura firme y sabor lácteo complejo.', 3, 3, 'mezcla', 120, 30.0, 38.00, 400, 8, FALSE, 4.20),
(7, 'QAND-FR-007', 'Ricotta Cremosa', 'ricotta-cremosa', 'Ricotta fresca, ideal para postres y rellenos.', 1, 2, 'vaca', 2, 15.0, 9.50, 200, 200, FALSE, 4.10),
(8, 'QAND-BLEU-008', 'Blue Goat (Cabra Azul)', 'blue-goat', 'Queso azul de cabra, menos salado que los azules tradicionales.', 4, 1, 'cabra', 45, 26.0, 55.00, 180, 12, FALSE, 4.30),
(9, 'QAND-OVE-009', 'Pecorino Romano', 'pecorino-romano', 'Queso de oveja duro y salado, excelente para rallar.', 3, 3, 'oveja', 240, 34.0, 28.00, 250, 30, FALSE, 4.35),
(10, 'QAND-PRC-010', 'Queso Fundido Natural', 'queso-fundido-natural', 'Queso procesado para untar, textura homogénea.', 7, 1, 'vaca', 0, 24.0, 8.90, 200, 500, TRUE, 3.90),
(11, 'QAND-SPL-011', 'Manchego Reserva', 'manchego-reserva', 'Manchego de oveja, 10 meses de curación, notas a frutos secos y manteca.', 6, 2, 'oveja', 300, 31.0, 65.00, 220, 7, TRUE, 4.88),
(12, 'QAND-FR-012', 'Mozzarella Fresca', 'mozzarella-fresca', 'Mozzarella para ensalada y pizza, textura fibrosa y elástica.', 1, 2, 'vaca', 1, 18.0, 14.00, 200, 180, FALSE, 4.25);

-- 4) Imágenes de producto (varias por producto)
CREATE TABLE product_images (
  id INT PRIMARY KEY,
  product_id INT,
  url VARCHAR(255),
  alt_text VARCHAR(150),
  is_primary BOOLEAN DEFAULT FALSE,
  FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO product_images (id, product_id, url, alt_text, is_primary) VALUES
(1, 1, '/images/queso-fresco-andino-1.jpg', 'Queso fresco andino entero', TRUE),
(2, 2, '/images/brie-de-campo-1.jpg', 'Brie con corteza blanca', TRUE),
(3, 4, '/images/roquefort-1.jpg', 'Roquefort con vetas', TRUE),
(4, 11, '/images/manchego-reserva-1.jpg', 'Manchego corte', TRUE),
(5, 3, '/images/cheddar-12m-1.jpg', 'Cheddar curado en tabla', TRUE),
(6, 7, '/images/ricotta-1.jpg', 'Ricotta fresca en bol', TRUE);

-- 5) Reseñas (reviews)
CREATE TABLE reviews (
  id INT PRIMARY KEY,
  product_id INT,
  author_name VARCHAR(80),
  rating INT CHECK (rating BETWEEN 1 AND 5),
  title VARCHAR(150),
  body TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO reviews (id, product_id, author_name, rating, title, body) VALUES
(1, 4, 'Clara M.', 5, 'Potente y sabroso', 'Perfecto para tablas; la sal y el picor están en equilibrio.'),
(2, 2, 'Pedro G.', 5, 'Cremoso hasta llorar', 'Excelente textura, se deshace en la boca.'),
(3, 1, 'Ana R.', 4, 'Fresco y versátil', 'Buena opción para ensaladas pero con mucha humedad si lo guardas mal.'),
(4, 11, 'Miguel S.', 5, 'Top Manchego', 'Reserva de primera, se nota su añejamiento.'),
(5, 3, 'Laura T.', 4, 'Buen cheddar', 'Intenso, ideal para sándwiches.');
