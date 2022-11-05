/* Методи класу Post */
CREATE OR REPLACE TYPE BODY Post AS 

    /* конструктор екземплярів об'єктів класів.
       	Вхідні параметри:
	   1) p_post_mark - оцінка
	   умова 1) якщо в таблиці Post вже існує вказана оцінка,
	   значення збільшується на 1 
	 Вихідний параметр - екземпляр обєкту класу 
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


	/* Функції отримання значень атрибутів */
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
