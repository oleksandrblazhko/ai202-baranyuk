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
