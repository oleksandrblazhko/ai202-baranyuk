/* ������ ����� Post */
CREATE OR REPLACE TYPE BODY Post AS 

    /* ����������� ���������� ��'���� �����.
       	����� ���������:
	   1) p_post_mark - ������
	   ����� 1) ���� � ������� Post ��� ���� ������� ������,
	   �������� ���������� �� 1 
	 �������� �������� - ��������� ����� ����� 
         */
    CONSTRUCTOR FUNCTION Post(p_post_mark NUMBER)
       RETURN SELF AS RESULT,
    IS
        v_mark Post.mark%TYPE;
    BEGIN
        SELECT mark INTO v_mark
        FROM Post
        WHERE 
            mark = p_post_mark;
        SELF.mark := v_mark+1;
        RETURN;
    END Location;


	/* ������� ��������� ������� �������� */
	/* get_post_owner */
    MEMBER FUNCTION get_post_owner
	    RETURN NUMBER 
	IS
    BEGIN
       RETURN SELF.post_owner;
    END get_post_owner;

	/* get_content */
    MEMBER FUNCTION get_content
	    RETURN VARCHAR 
	IS
    BEGIN
       RETURN SELF.content;
    END get_content;	
 
    MEMBER PROCEDURE display IS 
    BEGIN 
        dbms_output.put_line('Owner: ' || post_owner); 
        dbms_output.put_line('' || content); 
        dbms_output.put_line('Mark: ' || mark); 
        dbms_output.put_line('Date: ' || post_date); 
    END display; 
END; 
/


























/* ������ ����� Location */
-- DROP TYPE Location FORCE;
CREATE OR REPLACE TYPE BODY Location AS 

    /* ����������� ���������� ��'���� �����.
       ����� ���������:
	   1) p_lname - ����� �������
	   ����� 1) ���� � ������� Loc ��� ���� ������� �������,
	   ����������� ��������� ����� �� ����� ����� �������,
	   ������ � ������� Loc ����������� ����� ����� � ����������
	   ����������� ��������� ����� 
	   �������� �������� - ��������� ����� �����
	*/
    CONSTRUCTOR FUNCTION Location(p_lname VARCHAR) 
        RETURN SELF AS RESULT
    IS
        v_locno loc.locno%TYPE;
    BEGIN
        SELECT locno INTO v_locno
        FROM Loc
        WHERE 
            lname = p_lname;
        SELF.locno := v_locno;
        SELF.lname := p_lname;
        RETURN;
    EXCEPTION WHEN NO_DATA_FOUND THEN
        INSERT INTO Loc (lname)
            VALUES (p_lname)
        RETURNING locno INTO v_locno;
        SELF.locno := v_locno;
        SELF.lname := p_lname;
        RETURN;
    END Location;

	/* ��������� ���� �������� �������� */
	MEMBER PROCEDURE set_lname(p_locno NUMBER, p_lname VARCHAR)
	IS
	BEGIN
        UPDATE Loc SET lname = p_lname
		WHERE locno = p_locno;
		SELF.lname := p_lname;
	END set_lname;

	/* ������� ��������� ������� �������� */
	/* get_locno */
    MEMBER FUNCTION get_locno
	    RETURN NUMBER 
	IS
    BEGIN
       RETURN SELF.locno;
    END get_locno;

	/* get_lname */
    MEMBER FUNCTION get_lname
	    RETURN VARCHAR 
	IS
    BEGIN
       RETURN SELF.lname;
    END get_lname;	

    /* ��������� ������ �� ����� ������� �������� */
    MEMBER PROCEDURE display 
    IS
    BEGIN 
        dbms_output.put_line('locno: ' || locno);
        dbms_output.put_line('lname: ' || lname);
    END display;
END; 
/

/* ������ ����� Department */
CREATE OR REPLACE TYPE BODY Department AS 
    /* �����-��������� display ������ �� ����� 
    ������� �������� ���������� ��'���� ����� */
    MEMBER PROCEDURE display IS 
    BEGIN 
        dbms_output.put_line('deptno: ' || Self.deptno); 
        dbms_output.put_line('dname: ' || Self.dname);   
        dbms_output.put_line('locno: ' || Loc.locno); 
        dbms_output.put_line('lname: ' || Loc.lname); 
    END display;
END; 
/

/* ������ ����� Employee */
CREATE OR REPLACE TYPE BODY Employee AS 
    MEMBER PROCEDURE display IS 
    BEGIN 
        dbms_output.put_line('Name: ' || ename); 
        dbms_output.put_line('Job: ' || job); 
        dbms_output.put_line('Dept: ' || dept.dname); 
    END display; 
END; 
/

/* ������ ����� Manager */
CREATE OR REPLACE TYPE BODY Manager AS 
    OVERRIDING MEMBER PROCEDURE display IS 
    BEGIN 
        dbms_output.put_line('Name: '|| self.ename); 
        dbms_output.put_line('Job: '|| self.job); 
        dbms_output.put_line('Dept: '|| dept.dname); 
        dbms_output.put('Manages: {'); 
        FOR i IN 1..manage.COUNT LOOP
            dbms_output.put(manage(i).ename);
            IF i < manage.COUNT THEN 
                dbms_output.put(',');
            END IF;
        END LOOP;
        dbms_output.put_line('}');
    END display; 
END; 
/













/* ������ ����� Online_order */
CREATE OR REPLACE TYPE BODY Online_order AS
  /* ����������� ���������� ��'���� �����.
       	����� ���������:
	   1) p_date_order - ����
	   ����� 1) ���� � ������� Online_order ��� ���� ������� ����,
	   ����������� ��������� ����� �� ����� ����� �������,
	   ������ � ������� Online_order ����������� ����� ����� � ����������
	   ����������� ��������� ����� 
	  �������� �������� - ��������� ����� ����� */
    CONSTRUCTOR FUNCTION Online_order(p_date_order DATE)
        RETURN SELF AS RESULT,
    IS
        v_order_id Online_order.order_id%TYPE;
    BEGIN
        SELECT order_id INTO v_order_id
        FROM Online_order
        WHERE 
            date_order = p_date_order;
        SELF.order_id := v_order_id;
        SELF.date_order := p_date_order;
        RETURN;
    EXCEPTION WHEN NO_DATA_FOUND THEN
        INSERT INTO Online_order (date_order)
            VALUES ( p_date_order)
        RETURNING order_id INTO v_order_id;
        SELF.order_id := v_order_id;
        SELF.date_order := p_date_order;
        RETURN;
    END Online_order;
    
        /* ��������� ���� ������� �������� */
	      MEMBER PROCEDURE formOnlineOrder(p_order_id NUMBER, p_date_order DATE, p_text VARCHAR(20))
	      IS
	      BEGIN
        UPDATE Online_order SET date_order = p_date_order, text = p_text
		      WHERE order_id = p_order_id;
		      SELF.date_order := p_date_order, SELF.text := p_text;;
	      END formOnlineOrder;
    
        /* ������� ��������� ������� �������� */
	      /* get_order_id */
        MEMBER FUNCTION get_order_id
	        RETURN NUMBER 
	      IS
        BEGIN
          RETURN SELF.order_id;
        END get_order_id;
        
        /* get_date_order */
        MEMBER FUNCTION get_date_order
	        RETURN NUMBER 
	      IS
        BEGIN
          RETURN SELF.date_order;
        END get_date_order;

        /* ��������� ������ �� ����� ������� �������� */
        MEMBER PROCEDURE display 
        IS
        BEGIN 
          dbms_output.put_line('order_id: ' || order_id);
          dbms_output.put_line('date_order: ' || date_order);
          dbms_output.put_line('text: ' || text);
        END display;
END; 
/

