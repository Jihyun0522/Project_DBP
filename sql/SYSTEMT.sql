-- USER SQL
CREATE USER mirim3501 IDENTIFIED BY 3501  
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

-- QUOTAS

-- ROLES
GRANT CONNECT TO mirim3501 ;
GRANT RESOURCE TO mirim3501 ;

-- SYSTEM PRIVILEGES
