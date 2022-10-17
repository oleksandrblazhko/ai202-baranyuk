/* ��������� ������� � ��������� ���������� 
�������� ����� �������� */

drop table Artist CASCADE CONSTRAINTS;
drop table Shop CASCADE CONSTRAINTS;
drop table Order CASCADE CONSTRAINTS;
drop table Post CASCADE CONSTRAINTS;


CREATE TABLE Artist( -- ���������� ��������
    email VARCHAR(20), -- EMail
    name_artist VARCHAR(100) -- ��'� �����������
    telephone_number VARCHAR(20) -- �������
    age_artist NUMBER(3), -- ��
    favorite_style VARCHAR(50) -- ��������� ����� 

);

-- ��������� ������������ �����
ALTER TABLE Artist ADD CONSTRAINT Artist_name_unique 
    UNIQUE (name_artist);
ALTER TABLE Artist MODIFY (name_artist NOT NULL);

-- ��������� ���������� �����
ALTER TABLE Artist ADD CONSTRAINT Artist_pk
    PRIMARY KEY (email);

-- ��������� ����� ��������� �������
ALTER TABLE Artist ADD CONSTRAINT email_template
    CHECK ( regexp_like(email, 
	           '^([a-z0-9][a-z0-9._-]*@[a-z][a-z0-9._-]*\.[a-z]{2,4})$'));

-- ��������� ����� ��������� �������
ALTER TABLE Artist ADD CONSTRAINT Artist_telephone_template
    CHECK ( regexp_like(telephone_number, 
	          '^(\([0-9]{3}\))?[0-9]{3}-[0-9]{4}$'));



CREATE TABLE Shop( -- �������
    shop_name VARCHAR(100), -- ����� ��������
    link VARCHAR(100),  -- ��������� �� �������
    type VARCHAR(100), -- ��� ��������
    mark NUMBER(2), -- ������ ��������
    comments VARCHAR(1000),  -- �������� ������������ ��������
    customers VARCHAR(20) -- �����������

);

-- ��������� ������������ �����
ALTER TABLE Shop ADD CONSTRAINT shop_link_unique
    UNIQUE (link);
ALTER TABLE Shop MODIFY (link NOT NULL);

-- ��������� ���������� �����
ALTER TABLE Shop ADD CONSTRAINT shop_pk
    PRIMARY KEY (shop_name);
	
-- ��������� ���������� �����
ALTER TABLE Shop ADD CONSTRAINT shop_customers_fk
    FOREIGN KEY (customers) REFERENCES Artist(email);

-- ��������� ����� ��������� �������
ALTER TABLE Shop ADD CONSTRAINT shop_mark_template
    CHECK (Mark < 11);



CREATE TABLE Post( -- ���������� ��������
    post_id NUMBER(4), -- ����� ���������
    post_owner VARCHAR(100), -- �������
    content VARCHAR(1000), -- ������� ���������
    post_date DATE, -- ���� ��������� 
    mark BOOLEAN, -- ������ ���������
    comments VARCHAR(1000),  -- �������� ������������
);

-- ��������� ������������ �����
ALTER TABLE Post ADD CONSTRAINT post_date_unique 
    UNIQUE (post_date);
ALTER TABLE Post MODIFY (post_date NOT NULL);

-- ��������� ���������� �����
ALTER TABLE Post ADD CONSTRAINT Post_pk
    PRIMARY KEY (post_id);

-- ��������� ���������� �����
ALTER TABLE Post ADD CONSTRAINT post_owner_fk
    FOREIGN KEY (owner) REFERENCES Artist(email);



CREATE TABLE Order( -- �������
    order_id NUMBER(4), -- ����� ����������
    customer VARCHAR(100), -- ��������
    final_price Number(8), -- ������ ��� �� ������
    order_content VARCHAR(1000), -- ���� ����������
    address VARCHAR(100),  -- ������ �����������

);

-- ��������� ������������ �����
ALTER TABLE Order ADD CONSTRAINT order_final_price_unique
    UNIQUE (final_price);
ALTER TABLE Shop MODIFY (final_price NOT NULL);

-- ��������� ���������� �����
ALTER TABLE Order ADD CONSTRAINT Order_pk
    PRIMARY KEY (order_id);
	
-- ��������� ���������� �����
ALTER TABLE Order ADD CONSTRAINT Order_customer_fk
    FOREIGN KEY (customer) REFERENCES Artist(email);








