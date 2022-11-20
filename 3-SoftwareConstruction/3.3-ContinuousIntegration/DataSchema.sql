/* видалення таблиць з каскадним видаленням 
можливих описів цілісності */

drop table Artist CASCADE CONSTRAINTS;
drop table Shop CASCADE CONSTRAINTS;
drop table Order CASCADE CONSTRAINTS;
drop table Post CASCADE CONSTRAINTS;


CREATE TABLE Artist( -- користувач художник
    email VARCHAR(20), -- EMail
    name_artist VARCHAR(100) -- ім'я користувача
    telephone_number VARCHAR(20) -- телефон
    age_artist NUMBER(3), -- вік
    favorite_style VARCHAR(50) -- улюблений стиль 

);

-- обмеження потенційного ключа
ALTER TABLE Artist ADD CONSTRAINT Artist_name_unique 
    UNIQUE (name_artist);
ALTER TABLE Artist MODIFY (name_artist NOT NULL);

-- обмеження первинного ключа
ALTER TABLE Artist ADD CONSTRAINT Artist_pk
    PRIMARY KEY (email);

-- обмеження вмісту стовпчика таблиці
ALTER TABLE Artist ADD CONSTRAINT email_template
    CHECK ( regexp_like(email, 
	           '^([a-z0-9][a-z0-9._-]*@[a-z][a-z0-9._-]*\.[a-z]{2,4})$'));

-- обмеження вмісту стовпчика таблиці
ALTER TABLE Artist ADD CONSTRAINT Artist_telephone_template
    CHECK ( regexp_like(telephone_number, 
	          '^(\([0-9]{3}\))?[0-9]{3}-[0-9]{4}$'));



CREATE TABLE Shop( -- магазин
    shop_name VARCHAR(100), -- назва магазину
    link VARCHAR(100),  -- посилання на магазин
    type VARCHAR(100), -- тип магазину
    mark NUMBER(2), -- оцінка магазину
    comments VARCHAR(1000),  -- коментарі користувачів магазину
    customers VARCHAR(20) -- користувачі

);

-- обмеження потенційного ключа
ALTER TABLE Shop ADD CONSTRAINT shop_link_unique
    UNIQUE (link);
ALTER TABLE Shop MODIFY (link NOT NULL);

-- обмеження первинного ключа
ALTER TABLE Shop ADD CONSTRAINT shop_pk
    PRIMARY KEY (shop_name);
	
-- обмеження зовнішнього ключа
ALTER TABLE Shop ADD CONSTRAINT shop_customers_fk
    FOREIGN KEY (customers) REFERENCES Artist(email);

-- обмеження вмісту стовпчика таблиці
ALTER TABLE Shop ADD CONSTRAINT shop_mark_template
    CHECK (Mark < 11);



CREATE TABLE Post( -- користувач художник
    post_id NUMBER(4), -- номер публікації
    post_owner VARCHAR(100), -- власник
    content VARCHAR(1000), -- контент публікації
    post_date DATE, -- дата публікації 
    mark BOOLEAN, -- оцінка публікації
    comments VARCHAR(1000),  -- коментарі користувачів
);

-- обмеження потенційного ключа
ALTER TABLE Post ADD CONSTRAINT post_date_unique 
    UNIQUE (post_date);
ALTER TABLE Post MODIFY (post_date NOT NULL);

-- обмеження первинного ключа
ALTER TABLE Post ADD CONSTRAINT Post_pk
    PRIMARY KEY (post_id);

-- обмеження зовнішнього ключа
ALTER TABLE Post ADD CONSTRAINT post_owner_fk
    FOREIGN KEY (owner) REFERENCES Artist(email);



CREATE TABLE Order( -- магазин
    order_id NUMBER(4), -- номер замовлення
    customer VARCHAR(100), -- замовник
    final_price Number(8), -- кінцева цін до сплати
    order_content VARCHAR(1000), -- зміст замовлення
    address VARCHAR(100),  -- адреса доставлення

);

-- обмеження потенційного ключа
ALTER TABLE Order ADD CONSTRAINT order_final_price_unique
    UNIQUE (final_price);
ALTER TABLE Shop MODIFY (final_price NOT NULL);

-- обмеження первинного ключа
ALTER TABLE Order ADD CONSTRAINT Order_pk
    PRIMARY KEY (order_id);
	
-- обмеження зовнішнього ключа
ALTER TABLE Order ADD CONSTRAINT Order_customer_fk
    FOREIGN KEY (customer) REFERENCES Artist(email);








