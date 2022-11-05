/* Приклади роботи з класом Post
*/
DECLARE
    post1 Post;
BEGIN 
    post1:= NEW Post('My_Post');
	dbms_output.put_line('get owner_post: ' || post1.get_owner_post);
	dbms_output.put_line('get content: ' || post1.get_content);
        dbms_output.put_line('get post_date: ' || post1.get_post_date);
    post1.display();
END;
/

/* Приклад роботи з класами Post, Artist */
DECLARE 
    post1 Post; 
    artist1 Artist;
BEGIN 
    post1:= Post('My_Post'); 
    artist1:= Artist('dmb@gmail.com', 'Dmytro', '050214578', '19', 'nature');
    artist1.display();
END;
/

/* Приклад роботи з класами Post, Artist, Order */
DECLARE 
   post1 Post; 
   artist1 Artist;
   order1 Order;
BEGIN
    artist1:= Artist('dmb@gmail.com', 'Dmytro', '050214578', '19', 'nature');
    post1:= Post('My_Post'); 

    order1 := Order(1,'Dmytro','content', 'Odessa,Shevchenko av.1');
    order1.display(); 
END;
/
