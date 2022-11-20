BEGIN
  DBMS_OUTPUT.PUT('TC3:');
  DELETE FROM evaluatePost WHERE post_mark = '8' AND word_mark = 'word3';
    IF evaluate_Post('8', 'word3') = 1
    THEN DBMS_OUTPUT.PUT('Passed');
    ELSE DBMS_OUTPUT.PUT('Failed');
    END IF;
  DBMS_OUTPUT.PUT('TC4:');
  DELETE FROM evaluatePost WHERE post_mark = '9' AND word_mark = 'word4';
    IF evaluate_Post('9', 'word4') = 1
    THEN DBMS_OUTPUT.PUT('Passed');
    ELSE DBMS_OUTPUT.PUT('Failed');
    END IF;
END;
/
