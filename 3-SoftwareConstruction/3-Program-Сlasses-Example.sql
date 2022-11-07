CREATE OR REPLACE TYPE Artist AS OBJECT( -- користувач художник
    email VARCHAR(20), -- EMail
    name_artist VARCHAR(100) -- ім'я користувача
    telephone_number VARCHAR(20) -- телефон
    age_artist NUMBER(3), -- вік
    favorite_style VARCHAR(50) -- улюблений стиль 
    /* Процедура виводу на екран значень атрибутів */
    MEMBER PROCEDURE display
);

/* Створення типу для зберігання списку користувачів - "Колекція екземплярів об`єктів класу Artist */
CREATE TYPE Artist_List IS TABLE OF Artist;
/

CREATE OR REPLACE TYPE Shop AS OBJECT( -- магазин
    shop_name VARCHAR(100), -- назва магазину
    link VARCHAR(100),  -- посилання на магазин
    type VARCHAR(100), -- тип магазину
    mark NUMBER(2), -- оцінка магазину
    comments VARCHAR(1000),  -- коментарі користувачів магазину
    customers VARCHAR(20) -- користувачі
    /* Процедура виводу на екран значень атрибутів */
    MEMBER PROCEDURE display
);
/* Створення типу для зберігання списку магазинів - "Колекція екземплярів об`єктів класу Shop */
CREATE TYPE Shop_List IS TABLE OF Shop;
/

CREATE OR REPLACE TYPE Order AS OBJECT( -- магазин
    order_id NUMBER(4), -- номер замовлення
    customer VARCHAR(100), -- замовник
    final_price Number(8), -- кінцева цін до сплати
    order_content VARCHAR(1000), -- зміст замовлення
    address VARCHAR(100),  -- адреса доставлення
    /* Функції отримання значень атрибутів */
    MEMBER FUNCTION get_order_id RETURN NUMBER,
    MEMBER FUNCTION get_customer RETURN VARCHAR,
    /* Процедура виводу на екран значень атрибутів */
    MEMBER PROCEDURE display
);

/* Створення типу для зберігання списку замовлень - "Колекція екземплярів об`єктів класу Order */
CREATE TYPE Order_List IS TABLE OF Order;
/

CREATE OR REPLACE TYPE Post AS OBJECT( -- користувач художник
    post_id NUMBER(4), -- номер публікації
    post_owner VARCHAR(100), -- власник
    content VARCHAR(1000), -- контент публікації
    post_date DATE, -- дата публікації 
    mark NUMBER, -- оцінка публікації
    comments VARCHAR(1000),  -- коментарі користувачів
    /* конструктор екземплярів об'єктів класів.
       	Вхідні параметри:
	   1) p_post_mark - дата
	   умова 1) якщо в таблиці Post вже існує вказана оцінка,
	   значення збільшується на 1 
	 Вихідний параметр - екземпляр обєкту класу */
    	CONSTRUCTOR FUNCTION Post(p_post_mark NUMBER)
        	RETURN SELF AS RESULT,
    /* Процедура виводу на екран значень атрибутів */
    MEMBER FUNCTION get_post_owner RETURN VARCHAR,
    MEMBER FUNCTION get_content RETURN VARCHAR,
    MEMBER FUNCTION get_post_date RETURN DATE,
    /* Процедура виводу на екран значень атрибутів */
    MEMBER PROCEDURE display
);
/* Створення типу для зберігання списку публікацій - "Колекція екземплярів об`єктів класу Post */
CREATE TYPE Post_List IS TABLE OF Post;
/



