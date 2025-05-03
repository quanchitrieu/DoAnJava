CREATE DATABASE db_ecommerce;
USE db_ecommerce;

-- Create Category Table
CREATE TABLE category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL,
    description TEXT
);

-- Create Owner Table
CREATE TABLE owner (
    owner_id INT AUTO_INCREMENT PRIMARY KEY,
    owner_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(20),
    url_image VARCHAR(255),
    gender BOOLEAN DEFAULT TRUE
);

-- Create Shop Table
CREATE TABLE shop (
    shop_id INT AUTO_INCREMENT PRIMARY KEY,
    shop_name VARCHAR(255) NOT NULL,
    owner_id INT,
    address TEXT,
    FOREIGN KEY (owner_id) REFERENCES Owner(owner_id)
);

-- Create Product Table
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    category_id INT,
    shop_id INT,
    url_image VARCHAR(255),
    quantity INT,
    sold INT DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (category_id) REFERENCES Category(category_id),
    FOREIGN KEY (shop_id) REFERENCES Shop(shop_id)
);

-- Create Customer Table
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    address TEXT,
    url_image VARCHAR(255),
    phone VARCHAR(20),
    gender BOOLEAN DEFAULT TRUE,
    date_of_birth TIME
);

-- Create Order Table
CREATE TABLE `order` (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status TEXT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- Create OrderItem Table
CREATE TABLE orderItem (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Create Cart Table
CREATE TABLE cart (
    cart_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- Create CartItem Table
CREATE TABLE cartItem (
    cart_item_id INT AUTO_INCREMENT PRIMARY KEY,
    cart_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    is_selected BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (cart_id) REFERENCES Cart(cart_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Create SignInAccount Table
CREATE TABLE `account` (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    owner_id INT,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (owner_id) REFERENCES Owner(owner_id)
);
INSERT INTO category (category_name) VALUES
('Điện Thoại'),
('Máy Tính'),
('Đồng Hồ'),
('Thời Trang Nam'),
('Thời Trang Nữ'),
('Giày Dép Nam'),
('Giày Dép Nữ'),
('Mỹ Phẩm');

INSERT INTO `db_ecommerce`.`owner` (`owner_name`, `email`, `phone`, `gender`) VALUES ('Nguyễn Văn A', 'owner1@gmail.com.vn', '0123123123', '1');
INSERT INTO `db_ecommerce`.`owner` (`owner_name`, `email`, `phone`, `gender`) VALUES ('Nguyễn Thị B', 'owner2@gmail.com.vn', '0111111111', '0');
INSERT INTO `db_ecommerce`.`owner` (`owner_name`, `email`, `phone`, `gender`) VALUES ('Nguyễn Văn C', 'owner3@gmail.com.vn', '0122222222', '1');
INSERT INTO `db_ecommerce`.`owner` (`owner_name`, `email`, `phone`, `gender`) VALUES ('Nguyễn Thị D', 'owner4@gmail.com.vn', '0123456789', '0');

INSERT INTO `db_ecommerce`.`account` (`owner_id`, `username`, `password`) VALUES ('1', 'owner1', '12345');
INSERT INTO `db_ecommerce`.`account` (`owner_id`, `username`, `password`) VALUES ('2', 'owner2', '12345');
INSERT INTO `db_ecommerce`.`account` (`owner_id`, `username`, `password`) VALUES ('3', 'owner3', '12345');
INSERT INTO `db_ecommerce`.`account` (`owner_id`, `username`, `password`) VALUES ('4', 'owner4', '12345');

INSERT INTO shop (shop_name, owner_id, address) VALUES
('Apple Store', 1, '123 Đường ABC, Quận 1, TP. Hồ Chí Minh, Việt Nam'),
('Beauty Store', 2, '456 Đường XYZ, Quận 2, TP. Hồ Chí Minh, Việt Nam'),
('Men Cloth Store', 3, '123 Đường Đống Đa, Quận 9, TP. Hồ Chí Minh, Việt Nam'),
('Women Cloth Store', 4, '456 Đường Hai Bà Trưng, Quận 10, TP. Hồ Chí Minh, Việt Nam');

INSERT INTO product (product_name, `description`, price, category_id, shop_id, url_image, quantity, sold) VALUES
('iPhone 13', 'Apple iPhone 13 with 128GB storage', 20000000, 1, 1, '/ecommerce/products/iphone13.png', 100, 10),
('iPhone 13 Pro', 'Apple iPhone 13 Pro with 256GB storage', 30000000, 1, 1, '/ecommerce/products/iphone13pro.png', 100, 10),
('iPhone 12', 'Apple iPhone 12 with 64GB storage', 15000000, 1, 1, '/ecommerce/products/iphone12.png', 100, 10),
('iPhone 12 Pro', 'Apple iPhone 12 Pro with 128GB storage', 25000000, 1, 1, '/ecommerce/products/iphone12pro.png', 100, 10),
('iPhone SE', 'Apple iPhone SE with 64GB storage', 10000000, 1, 1, '/ecommerce/products/iphonese.png', 100, 10),
('Áo Thun Nam', 'Áo thun nam chất liệu cotton', 200000.00, 4, 3, '/ecommerce/products/aothunnam.png', 100, 10),
('Áo Thun Nữ', 'Áo thun nữ chất liệu cotton', 200000.00, 5, 4, '/ecommerce/products/aothunnu.png', 100, 10),
('Quần Jeans Nam', 'Quần jeans nam phong cách', 500000.00, 4, 3, '/ecommerce/products/quanjeansnam.png', 100, 10),
('Sữa Rửa Mặt', 'Sữa rửa mặt dịu nhẹ', 200000.00, 8, 2, '/ecommerce/products/suaruamat.png', 100, 10),
('Áo Sơ Mi Nam', 'Áo sơ mi nam lịch lãm', 300000.00, 4, 3, '/ecommerce/products/aosominam.png', 100, 10),
('Áo Khoác Nam', 'Áo khoác nam thời trang', 700000.00, 4, 3, '/ecommerce/products/aokhoacnam.png', 100, 10),
('Kem Chống Nắng', 'Kem chống nắng SPF 50+', 400000.00, 8, 2, '/ecommerce/products/kemchongnang.png', 100, 10),
('Quần Short Nam', 'Quần short nam thoải mái', 250000.00, 4, 3, '/ecommerce/products/quanshortnam.png', 100, 10),
('Quần Jeans Nữ', 'Quần jeans nữ phong cách', 500000.00, 5, 4, '/ecommerce/products/quanjeansnu.png', 100, 10),
('Áo Sơ Mi Nữ', 'Áo sơ mi nữ thanh lịch', 300000.00, 5, 4, '/ecommerce/products/aosominu.png', 100, 10),
('Váy Đầm Nữ', 'Váy đầm nữ dịu dàng', 600000.00, 5, 4, '/ecommerce/products/vaydamnu.png', 100, 10),
('Son Môi', 'Son môi cao cấp', 300000.00, 8, 2, '/ecommerce/products/sonmoi.png', 100, 10),
('Áo Khoác Nữ', 'Áo khoác nữ thời trang', 700000.00, 5, 4, '/ecommerce/products/aokhoacnu.png', 100, 10),
('Kem Dưỡng Da', 'Kem dưỡng da ban đêm', 500000.00, 8, 2, '/ecommerce/products/kemduongda.png', 100, 10),
('Nước Hoa', 'Nước hoa nữ quyến rũ', 1000000.00, 8, 2, '/ecommerce/products/nuochoa.png', 100, 10);




