CREATE OR REPLACE TYPE Artist AS OBJECT( -- ���������� ��������
    email VARCHAR(20), -- EMail
    name_artist VARCHAR(100) -- ��'� �����������
    telephone_number VARCHAR(20) -- �������
    age_artist NUMBER(3), -- ��
    favorite_style VARCHAR(50) -- ��������� ����� 
    /* ��������� ������ �� ����� ������� �������� */
    MEMBER PROCEDURE display
);

/* ��������� ���� ��� ��������� ������ ������������ - "�������� ���������� ��`���� ����� Artist */
CREATE TYPE Artist_List IS TABLE OF Artist;
/

CREATE OR REPLACE TYPE Shop AS OBJECT( -- �������
    shop_name VARCHAR(100), -- ����� ��������
    link VARCHAR(100),  -- ��������� �� �������
    type VARCHAR(100), -- ��� ��������
    mark NUMBER(2), -- ������ ��������
    comments VARCHAR(1000),  -- �������� ������������ ��������
    customers VARCHAR(20) -- �����������
    /* ��������� ������ �� ����� ������� �������� */
    MEMBER PROCEDURE display
);
/* ��������� ���� ��� ��������� ������ �������� - "�������� ���������� ��`���� ����� Shop */
CREATE TYPE Shop_List IS TABLE OF Shop;
/

CREATE OR REPLACE TYPE Order AS OBJECT( -- �������
    order_id NUMBER(4), -- ����� ����������
    customer VARCHAR(100), -- ��������
    final_price Number(8), -- ������ ��� �� ������
    order_content VARCHAR(1000), -- ���� ����������
    address VARCHAR(100),  -- ������ �����������
    /* ������� ��������� ������� �������� */
    MEMBER FUNCTION get_order_id RETURN NUMBER,
    MEMBER FUNCTION get_customer RETURN VARCHAR,
    /* ��������� ������ �� ����� ������� �������� */
    MEMBER PROCEDURE display
);

/* ��������� ���� ��� ��������� ������ ��������� - "�������� ���������� ��`���� ����� Order */
CREATE TYPE Order_List IS TABLE OF Order;
/

CREATE OR REPLACE TYPE Post AS OBJECT( -- ���������� ��������
    post_id NUMBER(4), -- ����� ���������
    post_owner VARCHAR(100), -- �������
    content VARCHAR(1000), -- ������� ���������
    post_date DATE, -- ���� ��������� 
    mark NUMBER, -- ������ ���������
    comments VARCHAR(1000),  -- �������� ������������
    /* ����������� ���������� ��'���� �����.
       	����� ���������:
	   1) p_post_mark - ����
	   ����� 1) ���� � ������� Post ��� ���� ������� ������,
	   �������� ���������� �� 1 
	 �������� �������� - ��������� ����� ����� */
    	CONSTRUCTOR FUNCTION Post(p_post_mark NUMBER)
        	RETURN SELF AS RESULT,
    /* ��������� ������ �� ����� ������� �������� */
    MEMBER FUNCTION get_post_owner RETURN VARCHAR,
    MEMBER FUNCTION get_content RETURN VARCHAR,
    MEMBER FUNCTION get_post_date RETURN DATE,
    /* ��������� ������ �� ����� ������� �������� */
    MEMBER PROCEDURE display
);
/* ��������� ���� ��� ��������� ������ ��������� - "�������� ���������� ��`���� ����� Post */
CREATE TYPE Post_List IS TABLE OF Post;
/



