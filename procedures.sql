CREATE TABLE `customer_status` (
  `idcustomer` int, 
  `firstname` varchar(50)  NULL,
  `lastname` varchar(30)  NULL,
  `age` int(11) DEFAULT NULL,
  `phonenumber` char(11) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` char(1) NOT NULL,
  `country` varchar(30)  NULL,
  `Shipping_status` varchar(30) NULL
) ;

select * from customer_status;

insert into customer_status(idcustomer,firstname,lastname,age,phonenumber,dob,gender,Country,Shipping_status)
values
(1,'Bain ','Lara',49,'505-4141969','1980-01-01','M','USA','shipped'),
(2,'Ian','Botham',19,'505-4141969','1980-01-01','M','USA','failed'),
(3,'Joe','Root',29,'505-4141900','1980-01-01','M','UK','shipped'),
(4,'Ben','Stokes',39,'505-4141900','1980-01-01','M','USA','failed'),
(5,'Ricky','Ponting',69,'505-345900','1960-01-01','M','UK','in-progress');

DELIMITER $$
create Procedure GetOrderCountByStatus(
in shipping_status_order varchar(30),
out total int
)
Begin 
select count(idcustomer)
into total  -- out parameter
from customer_status
where Shipping_status = shipping_status_order;
END$$
DELIMITER ; 

call GetOrderCountByStatus("Shipped",@total);
select @total;

call GetOrderCountByStatus("failed",@total);
select @total;

call GetOrderCountByStatus("in-progress",@total);
select @total;


use CS;
select * from salestriggers;

use storeprocedure;

CREATE TABLE `salestriggers` (
  `salesID` int NOT NULL,
  `quantity` decimal(8,2) NOT NULL,
  `saleValue` decimal(8,2) NOT NULL,
  `saleStatus` char(1) DEFAULT NULL,
  `freeShipping` char(1) DEFAULT NULL,
  `Discount` decimal(8,2) DEFAULT NULL
);

insert into salestriggers(salesID,quantity,saleValue,saleStatus,freeShipping,Discount)
values
(1,469.00,8113.00,"Y","N",0.00),
(2,569.00,9113.00,"Y","N",0.00),
(3,479.00,9445.00,"N","N",0.00),
(4,489.00,9787.00,"N","N",0.00),
(5,499.00,10001.00,"Y","Y",0.00),
(10,1469.00,11000.00,"Y","Y",0.00),
(11,1469.00,100.00,"Y","N",0.00);

insert into salestriggers
values
(6,469,20000,"Y","Y",0);
select * from salestriggers where salesID = 6;

insert into salestriggers
values
(7,469,16000,"Y","Y",0);
select * from salestriggers where salesID = 7;

insert into salestriggers
values
(8,469,6000,"Y","Y",0);
select * from salestriggers where salesID = 8;

insert into salestriggers
values
(9,469,4000,"Y","Y",0);
select * from salestriggers where salesID = 9;

select * from salestriggers;


Select * from salestriggers;

DELIMITER $$
create Procedure GetSalesLevel(
in salesID int,
out saleValueLevel varchar(20)
)
Begin 
If saleValue > 10000 then set saleValueLevel = "PLATINUM";
elseif saleValue < 10000 and saleValue > 5000 then set saleValueLevel = "GOLD";
else
set saleValueLevel = "Not Platinum";
end if;
select count(salesID)
from salestriggers
where saleValue = saleValueLevel;
END$$;
DELIMITER ; 

call GetSalesLevel (10, @saleValueLevel);
