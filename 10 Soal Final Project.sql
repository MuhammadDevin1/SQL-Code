

-- Anggota Kelompok
-- Alvis Jaunata Hadi			(2502091752)	
-- Muhammad Devin Ardiansyah	(2502137431)
-- Mutiah Munawar				(2501989475)
-- Thresia Avilia Ni Putu Sekar (2502001372)

--1. Display CustomerID, CustomerFullname, and Total Transactions (obtained from the number of SalesTransactions and ended with ‘ Transaction(s)’) for each customer whose served by a female staff  and the country is from ‘China’.
SELECT c.CustomerID, 
 [CustomerFullName] = CustomerName, 
 Concat(count(distinct keyboardPurchased), ' Transaction') as TotalTransaction  
FROM Customer c JOIN SalesTransaction st
ON c.CustomerID = st.CustomerID join Staff on st.StaffID = Staff.StaffID
WHERE CustomerGender = 'Female' AND 
CustomerCountry = 'China'
GROUP BY 
c.CustomerID, CustomerName,keyboardPurchased

----------------------------------------------------------------
--2. Display StaffID, StaffFullname, PurchaseTransactionDate, and Total Restock Product (obtained from the total of quantity in PurchaseTransaction) for each purchase which made in month between 6th and  8th, and on date between 10th and 20th .
SELECT s.StaffID,
 [StaffFullName] = s.StaffName,
 [PurchaseTransactionDate] = PurchaseDate,
 [Total Restock Product] = sum(QuantityKeyboard)
FROM Staff s
JOIN PurchaseTransaction pt
ON s.StaffID = pt.StaffID
WHERE MONTH(PurchaseDate) BETWEEN 6 AND 8
and DAY(PurchaseDate) BETWEEN 10 AND 20

group by s.StaffID,StaffName,PurchaseDate,QuantityKeyboard

----------------------------------------------------------------
--3. Display CustomerID, Customer First Name (obtained from first name of CustomerFullname), Total Transactions (obtained from number of SalesTransaction and no duplicate), and Total Item Buyed (obtained from the total of quantity in SalesTransaction) for every transaction which the total sales transaction is 2 and total item buyed is more than 25.
Select 
c.CustomerID,
[CustomerFirstName] = LEFT(CustomerName,CHARINDEX(' ',CustomerName)-1),
[Total Transaction] = Count(Distinct keyboardPurchased),
[Tota Item Buyed] = SUM (QuantityKeyboard)
FROM
Customer c
JOIN SalesTransaction st ON c.CustomerID = st.CustomerID
where
keyboardPurchased = 2 
AND  QuantityKeyboard > 25
GROUP BY c.CustomerID, CustomerName,keyboardPurchased,QuantityKeyboard

----------------------------------------------------------------
--4. Display VendorID, VendorFullname, Vendor Country (obtained from VendorCountry in uppercase format), Total Restock Transaction (obtained from the number of PurchaseTransaction and no duplicate), and Total Item (obtained from the total of quantity in PurchaseTransaction) for every transaction which VendorCountry is either from ‘Sweden’ or ‘Indonesia’ and the VendorID is either ‘VEN006’ or ‘VEN010’ .
SELECT
 V.VendorID,
 VendorName AS [VendorFullName],
 UPPER(VendorCountry) AS [Vendor Country],
 COUNT(DISTINCT QuantityKeyboard) AS [Total Restock Transaction],
 SUM(QuantityKeyboard) AS [Total Item]
FROM PurchaseTransaction pt
JOIN Vendor V
ON pt.VendorID = V.VendorID
WHERE VendorCountry IN ('Sweden', 'Indonesia')
 AND V.VendorID IN ('VEN006', 'VEN010')

 GROUP BY V.VendorID, VendorCountry, VendorName,QuantityKeyboard

--5. Display StaffID, StaffFullname, KeyboardName, Total Keyboard Sold (obtained from the total of quantity in SalesTransaction and no duplicate), and Total Price Keyboard Sold (obtained from the total of quantity in SalesTransaction multiply by KeyboardPrice, start with ‘Rp. ’ and no duplicate) for every transaction which keyboard price between 2000000 and 3000000 and max of quantity bought in transaction is more than 1.
	Select
	s.StaffID,
	StaffName as [StaffFullName],
	KeyboardName,
	COUNT(DISTINCT QuantityKeyboard) AS [Total Keyboard Sold],
	[Total Price Keyboard Sold] = 'Rp.' + CAST(SUM(Distinct KeyboardPrice) AS varchar)
	FROM Staff s
	JOIN SalesTransaction st
	ON s.StaffID = st.StaffID
	JOIN Keyboard k
	ON k.KeyboardID = st.KeyboardID
	WHERE KeyboardPrice BETWEEN 2000000 AND 3000000 AND QuantityKeyboard > 1

	group by s.StaffID,StaffName,KeyboardName,QuantityKeyboard


--6. Display KeyboardID, KeyboardName, SwitchName, Total Request Restock Keyboard (obtained from the number of transaction from PurchaseTransaction), and Total Restock Keyboard (obtained from the quantity in Purchase Transaction) for every transaction which switch name endswith ‘Red’ and purchase made on date between 5th and 15th. Then Combine it with Display KeyboardID, KeyboardName, SwitchName, Total Request Restock Keyboard (obtained from the number of transaction from PurchaseTransaction), and Total Restock Keyboard (obtained from the quantity in Purchase Transaction) for every transaction which switch name ends with ‘Blue’ and purchase made on date between 20th and 30th.
	SELECT
	k.KeyboardID,
	KeyboardName, 
	SwitchTypeName,
	sum(KeyboardPurchased) AS [Total Request Restock Keyboard],
	[Total Restock Keyboard] = sum(QuantityKeyboard)
FROM Keyboard k 
JOIN SwitchType st
ON k.SwitchTypeID = st.SwitchTypeID
JOIN PurchaseTransaction pt
on k.KeyboardID = pt.KeyboardID
WHERE SwitchTypeName LIKE '%Red' and Day(PurchaseDate) BETWEEN 5 AND 15
GROUP BY k.KeyboardID,KeyboardName,SwitchTypeName,KeyboardPurchased
UNION ALL
SELECT
	k.KeyboardID,
	KeyboardName, 
	SwitchTypeName,
	sum(KeyboardPurchased) AS [Total Request Restock Keyboard],
	[Total Request Restock Keyboard] = sum(QuantityKeyboard)
FROM Keyboard k
JOIN SwitchType st
ON k.SwitchTypeID = st.SwitchTypeID
join PurchaseTransaction pt
on k.KeyboardID = pt.KeyboardID
WHERE SwitchTypeName LIKE '%blue' and DAY(PurchaseDate) BETWEEN 20 AND 30

GROUP BY k.KeyboardID,KeyboardName,SwitchTypeName,KeyboardPurchased


--7. Display VendorID, VendorFullname, Vendor Username (obtained from VendorEmail’s first character until character before ‘@’), Min Quantity Supply (obtained from the minimum quantity in PurchaseTransaction), Max Quantity Supply (obtained from the maximum quantity in PurchaseTransaction), and Total Supply (obtained from the total of quantity in PurchaseTransaction) for every purchase transaction which occurred in ‘March’, ‘June’, and ‘August’ and Total Supply is more than 15
SELECT
  V.VendorID,
  VendorName,
  LEFT(VendorEmail,CHARINDEX('@',VendorEmail)-1) AS VendorUsername,
[Min Quantity]=MIN(QuantityKeyboard),
[Max Quantity]=MAX(QuantityKeyboard),
[Total Suppply]=SUM(QuantityKeyboard) 
FROM
  Vendor V
  JOIN PurchaseTransaction PT ON V.VendorID = PT.VendorID
WHERE MONTH(PurchaseDate) IN ('03','06','08')
AND QuantityKeyboard > 15
  
GROUP BY
  V.VendorID,VendorName,VendorEmail,QuantityKeyboard


--8. Display KeyboardID, KeyboardName, Switch Color (obtained from the last name of switch name), and Keyboard Sold (obtained from the total of quantity in SalesTransaction and ended with ‘ Units’) for every transaction which max of quantity bought in transaction is more than 8 and min of quantity bought in transaction is less than 2. Sort the data based on Keyboard Sold in descending order.
		Select k.KeyboardID, 
		KeyboardName,
		[Switch Color] = RIGHT(SwitchTypeName,Len(SwitchTypeName)-CHARINDEX(' ',SwitchTypeName)),
		[Total Transaction] = Concat(sum(QuantityKeyboard),' Units')  
		from Keyboard k
		join SwitchType sh on k.SwitchTypeID = sh.SwitchTypeID
		join SalesTransaction st on k.KeyboardID = st.KeyboardID
		
		group by k.KeyboardID, KeyboardName,SwitchTypeName,QuantityKeyboard
		HAVING MAX(QuantityKeyboard) > 8 AND MIN(keyboardPurchased) < 2 
		order by QuantityKeyboard DESC

--9. Creeate a view named ‘CustomStaffView’ to display StaffID, StaffFullname, StaffEmail, Min Quantity Restock (obtained from the minimum quantity in PurchaseTransaction), and Max Quantity Restock (obtained from the maximum quantity in PurchaseTransaction) for every purchase transaction whose StaffEmail ends with either ‘com’ or ‘org’ and StaffFullname ends with either ‘s’ or ‘y’.

CREATE VIEW CustomerStaffView as
SELECT
	s.StaffID,
	[StaffFullName] = StaffName,
	StaffEmail,
	[Min Quantity Restock] = MIN(QuantityKeyboard),
	[Max Quantity Restock] = MAX(QuantityKeyboard) 
FROM Staff s
JOIN PurchaseTransaction pt
ON s.StaffID = pt.StaffID
WHERE StaffEmail like '%com' OR  StaffEmail like '%org'
AND StaffName like '%s' OR  StaffName like '%y'
GROUP BY s.StaffID,StaffName,StaffEmail,QuantityKeyboard

drop view CustomerStaffView
Select *from CustomerStaffView


--10. Create a view named ‘CustomCustomerView’ to display CustomerID, CustomerFullname, Total Quantity Item (obtained from the total of quantity in SalesTransaction), and Total Product Item (obtained from the number of keyboard from SalesTransaction) for every sales transaction which occurred in ‘January’ and ‘May’,  and the CustomerID is either ‘CST005’or ‘CST007’.
CREATE VIEW CustomCustomerView as
SELECT
	c.CustomerID,
	[CustomerFullName] = CustomerName,
	[Total Quantity Item] = SUM(QuantityKeyboard),
	[Total Product Item] = Count(keyboardPurchased)
FROM Customer c
join SalesTransaction st on c.CustomerID = st.CustomerID 
WHERE MONTH(keyboardPurchased) IN ('01', '05')
AND c.CustomerID in ('CST005', 'CST007')

group by c.CustomerID,CustomerName,QuantityKeyboard,keyboardPurchased


select *from CustomCustomerView