select w.warehouseCode, w.warehouseName,  w.warehousePctCap, p.quantityInStock from 
products p, warehouses w where p.warehouseCode = w.warehouseCode;

select productName, productLine, quantityInstock, quantityInStock - 5/100*quantityInstock as "reduction_by_5%"
from product_reduction;

select w.warehouseCode, w.warehouseName,  w.warehousePctCap, round(sum(p.quantityInStock) - 5/100*
sum(p.quantityInStock)) total_in_stock from product_reduction p, warehouses w where 
p.warehouseCode = w.warehouseCode group by w.warehouseCode;


select p.productCode, p.productLine, p.productName, sum(od.quantityOrdered) as total_car_order from 
product_reduction p join orderDetails od on p.productCode = od.productCode join orders o on o.orderNumber = 
od.orderNumber where od.orderNumber in (select o.orderNumber from orders o where o.orderNumber = od.orderNumber)
group by productName, productCode order by 4 desc limit 10;

select p.productCode, p.productLine, p.productName, sum(od.quantityOrdered) as total_car_order from 
product_reduction p join orderDetails od on p.productCode = od.productCode join orders o on o.orderNumber = od.orderNumber
where od.orderNumber in (select o.orderNumber from orders o where o.orderNumber = od.orderNumber)
group by productName, productCode order by 4 asc limit 10;

select p.productCode, p.productName, p.productLine, sum(od.quantityOrdered) Total_car_ordered, w.warehousePctCap
from product_reduction p join orderdetails od on p.productCode = od.productCode join warehouses w on 
w.warehouseCode =  p.warehouseCode where orderNumber in (select o.orderNumber from orders o where 
o.orderNumber = od.orderNumber) 
group by p.productCode, productLine order by 4 desc;


select p.warehouseCode, w.warehouseName, sum(o.quantityOrdered) total_order from product_reduction p join 
orderdetails o on p.productCode = o.productCode join warehouses w on p.warehouseCode = w.warehouseCode 
group by warehouseName, warehouseCode;

