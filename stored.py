import mysql.connector as connector
from mysql.connector import Error


dbconfig={"database":"littlelemondb", "user":"Teodor", "password":"123456"}


try:
     
    conn= connector.connect(**dbconfig)
    print("connected")


except Error as er:

    print(f"error code:", [er.errno])
    print(f"error message:", [er.msg])


    

cursor = conn.cursor(buffered=True)




def GetMaxQuantity():
    
    
    cursor.execute("""
                   DROP PROCEDURE IF EXISTS GetMaxQuantity;
                   CREATE PROCEDURE GetMaxQuantity()
                   begin
                    SELECT max(quantity) FROM bills;
                   end""")

def manageBooking():
    
    cursor.execute("""
                    DROP PROCEDURE IF EXISTS manageBooking;
                    CREATE PROCEDURE manageBooking(idtable INT,idtime time,iddate date)
                    begin
                    SELECT booking_date,booking_time,booking_table,booking_state FROM Booking where booking_date=iddate and booking_time=idtime and booking_table=idtable;
                    end""")

def UpdateBooking():

    cursor.execute("""
                    DROP PROCEDURE IF EXISTS UpdateBooking;
                    CREATE PROCEDURE UpdateBooking(idbookings INT,new_date Date)
                    begin
                    UPDATE booking
                    SET booking_date = new_date
                    WHERE idbooking = idbookings;
                    
                    end""")

def AddBooking():

    cursor.execute("""
                    DROP PROCEDURE IF EXISTS AddBooking;
                    CREATE PROCEDURE AddBooking(emp_id INT,customer_id int,booking_date date,booking_time time,booking_table int,booking_state VARCHAR(45))
                    begin
                    
                    INSERT INTO booking (emp_id, customer_id, booking_date, booking_time, booking_table, booking_state, is_deleted)
                    VALUES (emp_id, customer_id, booking_date,booking_time,booking_table,booking_state,0);
                    
                    end""")

def CancelBooking():

    cursor.execute("""
                    DROP PROCEDURE IF EXISTS CancelBooking;
                    CREATE PROCEDURE CancelBooking(idbookings INT)
                    begin
                    UPDATE booking
                    SET is_deleted = 1
                    WHERE idbooking = idbookings;
                    
                    end""")



GetMaxQuantity()
while cursor.nextset():
    pass
manageBooking()
while cursor.nextset():
    pass
UpdateBooking()
while cursor.nextset():
    pass
AddBooking()
while cursor.nextset():
    pass
CancelBooking()