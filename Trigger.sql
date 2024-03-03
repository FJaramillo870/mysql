/*Create trigger trigger_name
	before insert
    on table_name
    for each row
    trigger_body*/
    
create TABLE titleForTriggers(
emp_no int not null,
title varchar(256) not null,
from_date date not null,
to_date date default null
);

select * from titlefortriggers;

insert into titlefortriggers
values
(1 ,"Senior Engineer","1986-06-26" ,"2021-06-30"),
(2, "Staff", "2020-08-30" ,"9999-09-09"),
(3,"Assistant Engineer","2020-07-24","2021-07-24"),
(4,"Skilled Person","2001-01-15","2012-02-02");

DELIMITER $$
CREATE TRIGGER before_title_insert
	BEFORE INSERT
    ON titlefortriggers
    FOR EACH ROW
BEGIN
  IF NEW.title = "Skilled Person"
   then set NEW.title = "Technician";
   END if;
END$$
DELIMITER ;

insert into titlefortriggers
values
(6,"Skilled Person", curdate(),"9999-01-01");



CREATE TABLE `salestriggers` (
  `salesID` int NOT NULL,
  `quantity` decimal(8,2) NOT NULL,
  `saleValue` decimal(8,2) NOT NULL,
  `saleStatus` char(1) DEFAULT NULL,
  `freeShipping` char(1) DEFAULT NULL,
  `Discount` decimal(8,2) DEFAULT NULL
);



select * from salestriggers;

DELIMITER $$
Create trigger discount
	before insert
    on salestriggers
    for each row
BEGIN
   IF NEW.saleValue >= 15000 
   then set NEW.Discount = 0.02;
   elseif New.saleValue <= 14999 and New.saleValue >= 5000
   then set NEW.Discount = 0.01;
   else 
   set New.Discount = 0.00;
   END if;
END$$
DELIMITER ;


