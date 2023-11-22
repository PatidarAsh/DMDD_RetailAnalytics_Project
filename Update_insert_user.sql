CREATE OR REPLACE PROCEDURE UPDATE_INSERT_USER (
    p_user_name VARCHAR2,
    p_user_address VARCHAR2,
    p_user_phone VARCHAR2
)
AS
    v_count NUMBER;
BEGIN
    -- Check if user name already exists
    SELECT COUNT(*) INTO v_count FROM USERS WHERE User_Name = p_user_name;

    IF v_count = 0 THEN
        -- Insert if user name doesn't exist
        INSERT INTO USERS(User_ID, User_Name, User_Address, User_Phone)
        VALUES (USER_ID_SEQ.NEXTVAL, p_user_name, p_user_address, p_user_phone);
        DBMS_OUTPUT.PUT_LINE('User details added.');
        

   
        END IF;
    END IF;
    
    COMMIT;
EXCEPTION
        WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/

--execute UPDATE_INSERT_USER('David','78 forest Hills','987-654-3218');

--select * from users;