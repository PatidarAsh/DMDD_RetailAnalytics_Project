-- add Triggers and Packeges to this file 


CREATE OR REPLACE PACKAGE TriggerPackage AS
  v_user_name USERS.USER_NAME%TYPE;
END TriggerPackage;
/

CREATE OR REPLACE TRIGGER ViewUserName
AFTER INSERT OR UPDATE ON USERS
FOR EACH ROW
ENABLE
BEGIN
  TriggerPackage.v_user_name := :NEW.USER_NAME;
  DBMS_OUTPUT.PUT_LINE('User Name: ' || TriggerPackage.v_user_name);
END;
/