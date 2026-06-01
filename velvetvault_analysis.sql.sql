-- ============================================================
--  VelvetVault Commerce Insights
--  Database: luxe_market_db
--  Author  : Khushbakhat
--  Date    : Q1 2025
--  Desc    : Pakistani e-commerce sales analysis
-- ============================================================

CREATE DATABASE IF NOT EXISTS luxe_market_db;
USE luxe_market_db;

-- ──────────────────────────────────────────────
-- TABLE 1: customers
-- ──────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS customers (
    customer_id     INT PRIMARY KEY AUTO_INCREMENT,
    full_name       VARCHAR(100) NOT NULL,
    email           VARCHAR(120) UNIQUE NOT NULL,
    city            VARCHAR(60)  NOT NULL,
    gender          ENUM('Male','Female') NOT NULL,
    age             INT          NOT NULL,
    signup_date     DATE         NOT NULL,
    loyalty_tier    ENUM('Bronze','Silver','Gold','Platinum') DEFAULT 'Bronze'
);

-- ──────────────────────────────────────────────
-- TABLE 2: products
-- ──────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS products (
    product_id      INT PRIMARY KEY AUTO_INCREMENT,
    product_name    VARCHAR(120) NOT NULL,
    category        VARCHAR(60)  NOT NULL,
    brand           VARCHAR(60)  NOT NULL,
    unit_price      DECIMAL(10,2) NOT NULL,
    stock_quantity  INT NOT NULL,
    supplier_city   VARCHAR(60)
);

-- ──────────────────────────────────────────────
-- TABLE 3: orders
-- ──────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS orders (
    order_id        INT PRIMARY KEY AUTO_INCREMENT,
    customer_id     INT NOT NULL,
    order_date      DATE NOT NULL,
    delivery_city   VARCHAR(60) NOT NULL,
    payment_method  ENUM('JazzCash','EasyPaisa','Credit Card','Cash on Delivery') NOT NULL,
    order_status    ENUM('Delivered','Pending','Cancelled','Returned') NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- ──────────────────────────────────────────────
-- TABLE 4: order_items
-- ──────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS order_items (
    item_id         INT PRIMARY KEY AUTO_INCREMENT,
    order_id        INT NOT NULL,
    product_id      INT NOT NULL,
    quantity        INT NOT NULL,
    unit_price      DECIMAL(10,2) NOT NULL,
    discount_pct    DECIMAL(5,2) DEFAULT 0,
    total_amount    DECIMAL(10,2) GENERATED ALWAYS AS
                    (quantity * unit_price * (1 - discount_pct/100)) STORED,
    FOREIGN KEY (order_id)   REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ──────────────────────────────────────────────
-- TABLE 5: returns
-- ──────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS returns (
    return_id       INT PRIMARY KEY AUTO_INCREMENT,
    order_id        INT NOT NULL,
    return_date     DATE NOT NULL,
    reason          VARCHAR(200),
    refund_amount   DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

USE luxe_market_db;

-- ──────────────────────────────────────────────
-- CUSTOMERS (50 records)
-- ──────────────────────────────────────────────
INSERT INTO customers (full_name, email, city, gender, age, signup_date, loyalty_tier) VALUES
('Ahmed Ali',       'ahmed.ali@gmail.com',       'Lahore',      'Male',   28, '2023-01-15', 'Gold'),
('Fatima Khan',     'fatima.khan@gmail.com',      'Karachi',     'Female', 32, '2023-02-10', 'Platinum'),
('Usman Raza',      'usman.raza@yahoo.com',       'Islamabad',   'Male',   24, '2023-03-05', 'Silver'),
('Ayesha Malik',    'ayesha.malik@gmail.com',     'Faisalabad',  'Female', 27, '2023-03-20', 'Bronze'),
('Bilal Sheikh',    'bilal.sheikh@gmail.com',     'Rawalpindi',  'Male',   35, '2023-04-01', 'Silver'),
('Sana Iqbal',      'sana.iqbal@hotmail.com',     'Lahore',      'Female', 29, '2023-04-15', 'Gold'),
('Zain Hussain',    'zain.hussain@gmail.com',     'Multan',      'Male',   31, '2023-05-10', 'Bronze'),
('Hira Baig',       'hira.baig@gmail.com',        'Karachi',     'Female', 26, '2023-05-22', 'Silver'),
('Kamran Butt',     'kamran.butt@yahoo.com',      'Lahore',      'Male',   38, '2023-06-01', 'Platinum'),
('Nadia Aslam',     'nadia.aslam@gmail.com',      'Islamabad',   'Female', 23, '2023-06-18', 'Bronze'),
('Tariq Mehmood',   'tariq.mehmood@gmail.com',    'Peshawar',    'Male',   42, '2023-07-05', 'Silver'),
('Zara Ahmed',      'zara.ahmed@gmail.com',       'Karachi',     'Female', 25, '2023-07-20', 'Gold'),
('Hamza Qureshi',   'hamza.qureshi@gmail.com',    'Lahore',      'Male',   30, '2023-08-10', 'Silver'),
('Mariam Shah',     'mariam.shah@hotmail.com',    'Quetta',      'Female', 28, '2023-08-25', 'Bronze'),
('Faisal Nawaz',    'faisal.nawaz@gmail.com',     'Faisalabad',  'Male',   33, '2023-09-05', 'Gold'),
('Saima Bibi',      'saima.bibi@gmail.com',       'Multan',      'Female', 27, '2023-09-18', 'Silver'),
('Asad Khan',       'asad.khan@yahoo.com',        'Islamabad',   'Male',   36, '2023-10-01', 'Platinum'),
('Rukhsana Ijaz',   'rukhsana.ijaz@gmail.com',    'Lahore',      'Female', 31, '2023-10-15', 'Bronze'),
('Naeem Akhtar',    'naeem.akhtar@gmail.com',     'Rawalpindi',  'Male',   29, '2023-11-05', 'Silver'),
('Shazia Parveen',  'shazia.parveen@gmail.com',   'Karachi',     'Female', 34, '2023-11-20', 'Gold'),
('Imran Chaudhry',  'imran.chaudhry@gmail.com',   'Lahore',      'Male',   27, '2024-01-10', 'Bronze'),
('Lubna Farooq',    'lubna.farooq@hotmail.com',   'Islamabad',   'Female', 30, '2024-01-25', 'Silver'),
('Shahid Latif',    'shahid.latif@gmail.com',     'Multan',      'Male',   44, '2024-02-08', 'Gold'),
('Nazia Sultana',   'nazia.sultana@gmail.com',    'Karachi',     'Female', 26, '2024-02-20', 'Bronze'),
('Waseem Akram',    'waseem.akram@yahoo.com',     'Lahore',      'Male',   39, '2024-03-05', 'Platinum'),
('Rabia Noor',      'rabia.noor@gmail.com',       'Faisalabad',  'Female', 24, '2024-03-18', 'Bronze'),
('Danish Saleem',   'danish.saleem@gmail.com',    'Rawalpindi',  'Male',   32, '2024-04-01', 'Silver'),
('Amna Riaz',       'amna.riaz@gmail.com',        'Islamabad',   'Female', 28, '2024-04-15', 'Gold'),
('Junaid Anwar',    'junaid.anwar@gmail.com',     'Lahore',      'Male',   37, '2024-05-10', 'Silver'),
('Bushra Tufail',   'bushra.tufail@hotmail.com',  'Karachi',     'Female', 33, '2024-05-22', 'Bronze'),
('Aamir Shahzad',   'aamir.shahzad@gmail.com',    'Peshawar',    'Male',   41, '2024-06-01', 'Silver'),
('Mehwish Hayat',   'mehwish.hayat@gmail.com',    'Lahore',      'Female', 29, '2024-06-18', 'Gold'),
('Rizwan Sattar',   'rizwan.sattar@yahoo.com',    'Multan',      'Male',   35, '2024-07-05', 'Bronze'),
('Sobia Nasir',     'sobia.nasir@gmail.com',      'Karachi',     'Female', 27, '2024-07-20', 'Silver'),
('Adeel Farhan',    'adeel.farhan@gmail.com',     'Islamabad',   'Male',   30, '2024-08-10', 'Gold'),
('Kiran Bano',      'kiran.bano@gmail.com',       'Faisalabad',  'Female', 25, '2024-08-25', 'Platinum'),
('Mudassar Ali',    'mudassar.ali@gmail.com',     'Lahore',      'Male',   34, '2024-09-05', 'Silver'),
('Tahira Shafiq',   'tahira.shafiq@hotmail.com',  'Rawalpindi',  'Female', 31, '2024-09-18', 'Bronze'),
('Salman Ghani',    'salman.ghani@gmail.com',     'Karachi',     'Male',   28, '2024-10-01', 'Gold'),
('Farah Deeba',     'farah.deeba@gmail.com',      'Lahore',      'Female', 26, '2024-10-15', 'Silver'),
('Kashif Mehmood',  'kashif.mehmood@yahoo.com',   'Multan',      'Male',   43, '2024-11-05', 'Bronze'),
('Uzma Sarwar',     'uzma.sarwar@gmail.com',      'Islamabad',   'Female', 29, '2024-11-20', 'Gold'),
('Naveed Iqbal',    'naveed.iqbal@gmail.com',     'Lahore',      'Male',   36, '2024-12-01', 'Silver'),
('Samina Malik',    'samina.malik@gmail.com',     'Karachi',     'Female', 32, '2024-12-15', 'Bronze'),
('Babar Azam',      'babar.azam@gmail.com',       'Lahore',      'Male',   27, '2025-01-05', 'Bronze'),
('Huma Waseem',     'huma.waseem@hotmail.com',    'Faisalabad',  'Female', 30, '2025-01-18', 'Silver'),
('Zulfiqar Mirza',  'zulfiqar.mirza@gmail.com',   'Rawalpindi',  'Male',   45, '2025-02-01', 'Gold'),
('Gulnaz Pervez',   'gulnaz.pervez@gmail.com',    'Karachi',     'Female', 28, '2025-02-15', 'Bronze'),
('Shahzaib Hasan',  'shahzaib.hasan@yahoo.com',   'Peshawar',    'Male',   33, '2025-03-01', 'Silver'),
('Noor Fatima',     'noor.fatima@gmail.com',      'Lahore',      'Female', 24, '2025-03-15', 'Bronze');

-- ──────────────────────────────────────────────
-- PRODUCTS (30 records)
-- ──────────────────────────────────────────────
INSERT INTO products (product_name, category, brand, unit_price, stock_quantity, supplier_city) VALUES
('iPhone 15 Pro',          'Electronics',  'Apple',        289000.00, 50,  'Karachi'),
('Samsung Galaxy S24',     'Electronics',  'Samsung',      195000.00, 75,  'Lahore'),
('Haier 55" 4K TV',        'Electronics',  'Haier',         98000.00, 40,  'Faisalabad'),
('HP Laptop 15s',          'Electronics',  'HP',           135000.00, 60,  'Islamabad'),
('JBL Bluetooth Speaker',  'Electronics',  'JBL',           18500.00, 120, 'Karachi'),
('Shalwar Kameez (Gents)', 'Clothing',     'Gul Ahmed',      3500.00, 200, 'Lahore'),
('Lawn Suit (Ladies)',     'Clothing',     'Khaadi',         5800.00, 180, 'Karachi'),
('Denim Jeans',            'Clothing',     'Levi\'s',        8200.00, 150, 'Lahore'),
('Silk Dupatta',           'Clothing',     'Bonanza',        2200.00, 300, 'Faisalabad'),
('Kids School Uniform',    'Clothing',     'ChenOne',        1800.00, 250, 'Multan'),
('Basmati Rice 5kg',       'Groceries',    'Guard',           950.00, 500, 'Lahore'),
('Desi Ghee 1kg',          'Groceries',    'Nurpur',         1800.00, 400, 'Faisalabad'),
('Sunflower Cooking Oil',  'Groceries',    'Dalda',           650.00, 600, 'Karachi'),
('Whole Wheat Flour 10kg', 'Groceries',    'Bake Parlor',     850.00, 450, 'Lahore'),
('Green Tea Box',          'Groceries',    'Tapal',           450.00, 700, 'Islamabad'),
('L\'Oreal Shampoo',       'Beauty',       'L\'Oreal',       1200.00, 300, 'Karachi'),
('Nivea Body Lotion',      'Beauty',       'Nivea',           950.00, 350, 'Lahore'),
('MAC Lipstick',           'Beauty',       'MAC',            3800.00, 200, 'Karachi'),
('Neutrogena Face Wash',   'Beauty',       'Neutrogena',     1500.00, 280, 'Islamabad'),
('Garnier Serum',          'Beauty',       'Garnier',        2200.00, 220, 'Lahore'),
('Sofa Set 5-Seater',      'Furniture',    'Master MFC',    85000.00, 20,  'Lahore'),
('Wooden Dining Table',    'Furniture',    'Interwood',     55000.00, 25,  'Karachi'),
('King Size Bed Frame',    'Furniture',    'Master MFC',    42000.00, 30,  'Lahore'),
('Study Desk & Chair',     'Furniture',    'Interwood',     18500.00, 45,  'Islamabad'),
('Wardrobe 4-Door',        'Furniture',    'Master MFC',    62000.00, 15,  'Faisalabad'),
('Nike Running Shoes',     'Footwear',     'Nike',          18000.00, 100, 'Karachi'),
('Bata Formal Shoes',      'Footwear',     'Bata',           8500.00, 150, 'Lahore'),
('Servis Sandals',         'Footwear',     'Servis',         3200.00, 200, 'Faisalabad'),
('Kids School Bag',        'Accessories',  'Hush Puppies',   4500.00, 180, 'Lahore'),
('Leather Handbag',        'Accessories',  'Stylo',          7800.00, 120, 'Karachi');

-- ──────────────────────────────────────────────
-- ORDERS (60 records)
-- ──────────────────────────────────────────────
INSERT INTO orders (customer_id, order_date, delivery_city, payment_method, order_status) VALUES
(1,  '2025-01-03', 'Lahore',     'JazzCash',         'Delivered'),
(2,  '2025-01-05', 'Karachi',    'Credit Card',       'Delivered'),
(3,  '2025-01-07', 'Islamabad',  'EasyPaisa',         'Delivered'),
(4,  '2025-01-10', 'Faisalabad', 'Cash on Delivery',  'Pending'),
(5,  '2025-01-12', 'Rawalpindi', 'JazzCash',          'Delivered'),
(6,  '2025-01-15', 'Lahore',     'Credit Card',       'Delivered'),
(7,  '2025-01-18', 'Multan',     'EasyPaisa',         'Cancelled'),
(8,  '2025-01-20', 'Karachi',    'Cash on Delivery',  'Delivered'),
(9,  '2025-01-22', 'Lahore',     'JazzCash',          'Delivered'),
(10, '2025-01-25', 'Islamabad',  'Credit Card',       'Delivered'),
(11, '2025-02-01', 'Peshawar',   'Cash on Delivery',  'Delivered'),
(12, '2025-02-03', 'Karachi',    'JazzCash',          'Delivered'),
(13, '2025-02-05', 'Lahore',     'EasyPaisa',         'Returned'),
(14, '2025-02-07', 'Quetta',     'Credit Card',       'Delivered'),
(15, '2025-02-10', 'Faisalabad', 'JazzCash',          'Delivered'),
(16, '2025-02-12', 'Multan',     'Cash on Delivery',  'Delivered'),
(17, '2025-02-15', 'Islamabad',  'Credit Card',       'Delivered'),
(18, '2025-02-18', 'Lahore',     'EasyPaisa',         'Pending'),
(19, '2025-02-20', 'Rawalpindi', 'JazzCash',          'Delivered'),
(20, '2025-02-22', 'Karachi',    'Credit Card',       'Delivered'),
(21, '2025-03-01', 'Lahore',     'Cash on Delivery',  'Delivered'),
(22, '2025-03-03', 'Islamabad',  'JazzCash',          'Delivered'),
(23, '2025-03-05', 'Multan',     'EasyPaisa',         'Cancelled'),
(24, '2025-03-07', 'Karachi',    'Credit Card',       'Delivered'),
(25, '2025-03-10', 'Lahore',     'JazzCash',          'Delivered'),
(26, '2025-03-12', 'Faisalabad', 'Cash on Delivery',  'Delivered'),
(27, '2025-03-15', 'Rawalpindi', 'EasyPaisa',         'Delivered'),
(28, '2025-03-18', 'Islamabad',  'Credit Card',       'Returned'),
(29, '2025-03-20', 'Lahore',     'JazzCash',          'Delivered'),
(30, '2025-03-22', 'Karachi',    'Cash on Delivery',  'Delivered'),
(1,  '2025-01-28', 'Lahore',     'Credit Card',       'Delivered'),
(2,  '2025-02-25', 'Karachi',    'JazzCash',          'Delivered'),
(9,  '2025-03-25', 'Lahore',     'EasyPaisa',         'Delivered'),
(12, '2025-01-30', 'Karachi',    'Credit Card',       'Delivered'),
(17, '2025-02-28', 'Islamabad',  'Cash on Delivery',  'Delivered'),
(25, '2025-03-28', 'Lahore',     'JazzCash',          'Pending'),
(6,  '2025-02-14', 'Lahore',     'Credit Card',       'Delivered'),
(15, '2025-03-14', 'Faisalabad', 'EasyPaisa',         'Delivered'),
(20, '2025-01-26', 'Karachi',    'JazzCash',          'Delivered'),
(32, '2025-02-06', 'Lahore',     'Cash on Delivery',  'Delivered'),
(35, '2025-03-06', 'Islamabad',  'Credit Card',       'Delivered'),
(38, '2025-01-16', 'Rawalpindi', 'EasyPaisa',         'Cancelled'),
(40, '2025-02-16', 'Lahore',     'JazzCash',          'Delivered'),
(42, '2025-03-16', 'Islamabad',  'Credit Card',       'Delivered'),
(44, '2025-01-20', 'Karachi',    'Cash on Delivery',  'Delivered'),
(46, '2025-02-20', 'Faisalabad', 'JazzCash',          'Returned'),
(48, '2025-03-20', 'Karachi',    'EasyPaisa',         'Delivered'),
(50, '2025-01-24', 'Lahore',     'Credit Card',       'Delivered'),
(3,  '2025-02-24', 'Islamabad',  'JazzCash',          'Delivered'),
(5,  '2025-03-24', 'Rawalpindi', 'Cash on Delivery',  'Delivered'),
(7,  '2025-01-14', 'Multan',     'EasyPaisa',         'Delivered'),
(10, '2025-02-14', 'Islamabad',  'Credit Card',       'Delivered'),
(13, '2025-03-14', 'Lahore',     'JazzCash',          'Delivered'),
(16, '2025-01-19', 'Multan',     'Cash on Delivery',  'Pending'),
(19, '2025-02-19', 'Rawalpindi', 'EasyPaisa',         'Delivered'),
(22, '2025-03-19', 'Islamabad',  'Credit Card',       'Delivered'),
(28, '2025-01-29', 'Islamabad',  'JazzCash',          'Delivered'),
(33, '2025-02-27', 'Multan',     'EasyPaisa',         'Delivered'),
(45, '2025-03-27', 'Karachi',    'Credit Card',       'Delivered');

-- ──────────────────────────────────────────────
-- ORDER ITEMS
-- ──────────────────────────────────────────────
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount_pct) VALUES
(1,  1,  1, 289000.00, 5),
(1,  5,  2,  18500.00, 0),
(2,  2,  1, 195000.00, 10),
(3,  4,  1, 135000.00, 5),
(4,  6,  3,   3500.00, 0),
(5,  7,  2,   5800.00, 10),
(6,  8,  1,   8200.00, 15),
(7,  11, 5,    950.00, 0),
(8,  16, 3,   1200.00, 5),
(9,  21, 1,  85000.00, 0),
(10, 3,  1,  98000.00, 10),
(11, 26, 2,  18000.00, 5),
(12, 18, 4,   3800.00, 0),
(13, 22, 1,  55000.00, 15),
(14, 12, 3,   1800.00, 0),
(15, 1,  1, 289000.00, 0),
(16, 13, 4,    650.00, 5),
(17, 4,  1, 135000.00, 10),
(18, 9,  5,   2200.00, 0),
(19, 27, 2,   8500.00, 5),
(20, 2,  1, 195000.00, 5),
(21, 6,  4,   3500.00, 10),
(22, 19, 2,   1500.00, 0),
(23, 11, 10,   950.00, 5),
(24, 30, 2,   7800.00, 0),
(25, 23, 1,  42000.00, 10),
(26, 7,  3,   5800.00, 0),
(27, 5,  3,  18500.00, 5),
(28, 24, 1,  18500.00, 15),
(29, 17, 4,    950.00, 0),
(30, 8,  2,   8200.00, 10),
(31, 2,  1, 195000.00, 5),
(32, 18, 2,   3800.00, 0),
(33, 3,  1,  98000.00, 5),
(34, 1,  1, 289000.00, 10),
(35, 4,  1, 135000.00, 0),
(36, 21, 1,  85000.00, 5),
(37, 6,  5,   3500.00, 0),
(38, 26, 1,  18000.00, 10),
(39, 12, 6,   1800.00, 5),
(40, 7,  2,   5800.00, 0),
(41, 29, 3,   4500.00, 5),
(42, 19, 4,   1500.00, 0),
(43, 2,  1, 195000.00, 10),
(44, 11, 8,    950.00, 0),
(45, 25, 1,  62000.00, 5),
(46, 28, 4,   3200.00, 0),
(47, 14, 3,    850.00, 5),
(48, 20, 2,   2200.00, 10),
(49, 1,  1, 289000.00, 0),
(50, 5,  4,  18500.00, 5),
(51, 16, 3,   1200.00, 0),
(52, 8,  2,   8200.00, 15),
(53, 22, 1,  55000.00, 10),
(54, 13, 5,    650.00, 0),
(55, 27, 2,   8500.00, 5),
(56, 4,  1, 135000.00, 0),
(57, 30, 1,   7800.00, 10),
(58, 6,  3,   3500.00, 5),
(59, 3,  1,  98000.00, 0),
(60, 18, 3,   3800.00, 5);

-- ──────────────────────────────────────────────
-- RETURNS
-- ──────────────────────────────────────────────
INSERT INTO returns (order_id, return_date, reason, refund_amount) VALUES
(13, '2025-02-12', 'Product damaged during delivery',  55000.00),
(28, '2025-03-25', 'Wrong size delivered',             18500.00),
(46, '2025-02-25', 'Quality not as expected',          12800.00),
(7,  '2025-01-22', 'Changed mind after purchase',       4750.00),
(42, '2025-03-21', 'Defective product',                23500.00);