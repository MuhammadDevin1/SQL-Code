/*
Response (target) - 1 if customer accepted the offer in the last campaign, 0 otherwise
ID - Unique ID of each customer
Year_Birth - Age of the customer
Complain - 1 if the customer complained in the last 2 years
Dt_Customer - date of customer's enrollment with the company
Education - customer's level of education
Marital - customer's marital status
Kidhome - number of small children in customer's household
Teenhome - number of teenagers in customer's household
Income - customer's yearly household income
MntFishProducts - the amount spent on fish products in the last 2 years
MntMeatProducts - the amount spent on meat products in the last 2 years
MntFruits - the amount spent on fruits products in the last 2 years
MntSweetProducts - amount spent on sweet products in the last 2 years
MntWines - the amount spent on wine products in the last 2 years
MntGoldProds - the amount spent on gold products in the last 2 years
NumDealsPurchases - number of purchases made with discount
NumCatalogPurchases - number of purchases made using catalog (buying goods to be shipped through the mail)
NumStorePurchases - number of purchases made directly in stores
NumWebPurchases - number of purchases made through the company's website
NumWebVisitsMonth - number of visits to company's website in the last month
Recency - number of days since the last purchase
*/

USE Marketing_Campaign

-- 1. Melakukan perhitungan setiap status pendidikan customer
select Education,COUNT(Education) as total_status_pendidikan
from superstore_data
group by Education

-- 2. Melakukan perhitungan setiap status pernikahan customer
select Marital_Status,COUNT(Marital_Status) as total_status_pernikahan
from superstore_data
group by Marital_Status

--3 Melakukan segmentasi pemasukan customer

SELECT Segmentasi,
COUNT(*) as Jumlah
from(
select Id, '$' + cast(Income as varchar) as Pendapatan, 
CASE WHEN Income >= 65000 THEN 'Segmentasi A'
	WHEN Income >= 35000 AND Income < 65000 then 'Segmentasi B'
	ELSE 'Segmentasi C'
	end as Segmentasi
from superstore_data
GROUP BY Id,Income
)
as Segmentasi_Income
GROUP BY Segmentasi
ORDER BY Segmentasi;


-- 4 Rata - rata pemasukan dari setiap pendidikan customer
select Education,'$' + cast(AVG(Income) as varchar) as AVG_Gaji
from superstore_data
GROUP BY Education;


-- 5 Melakukan analisa mengenai perilaku atau kebiasaan belanja customer melalui jenis channel
--5.1 Belanja dari Catalog
WITH MetrikSegmentasi AS (
SELECT Segmentasi,
COUNT(*) as Jumlah, SUM(CAST(NumCatalogPurchases AS INT)) as Hitungan_BelanjaCatalog_Segmentasi
from(
select Id, '$' + cast(Income as varchar) as Pendapatan,NumCatalogPurchases, 
CASE WHEN Income >= 65000 THEN 'Segmentasi A'
	WHEN income >= 35000 AND Income < 65000 then 'Segmentasi B'
	ELSE 'Segmentasi C'
	end as Segmentasi
from superstore_data
GROUP BY Id,Income,NumCatalogPurchases)
AS Segmentasi_Pendapatan
GROUP BY Segmentasi
)
SELECT  Segmentasi,Jumlah, Hitungan_BelanjaCatalog_Segmentasi
From MetrikSegmentasi;

--5.2 Belanja Dari  Website
WITH MetrikSegmentasi AS (
SELECT Segmentasi,
COUNT(*) as Jumlah, SUM(CAST(NumWebPurchases AS INT)) as Hitungan_BelanjaWebsite_Segmentasi
from(
select Id, '$' + cast(Income as varchar) as Pendapatan,NumWebPurchases, 
CASE WHEN Income >= 65000 THEN 'Segmentasi A'
	WHEN income >= 35000 AND Income < 65000 then 'Segmentasi B'
	ELSE 'Segmentasi C'
	end as Segmentasi
from superstore_data
GROUP BY Id,Income,NumWebPurchases)
AS Segmentasi_Pendapatan
GROUP BY Segmentasi
)
SELECT  Segmentasi,Jumlah, Hitungan_BelanjaWebsite_Segmentasi
From MetrikSegmentasi;

-- 5.3 jumlah kunjungan website selama 1 bulan berdasarkan segmentasi
WITH MetrikSegmentasi AS (
SELECT Segmentasi,
COUNT(*) as Jumlah, SUM(CAST(NumWebVisitsMonth AS INT)) as Hitungan_KunjunganWebsite_1Bulan
from(
select Id, '$' + cast(Income as varchar) as Pendapatan,NumWebVisitsMonth, 
CASE WHEN Income >= 65000 THEN 'Segmentasi A'
	WHEN income >= 35000 AND Income < 65000 then 'Segmentasi B'
	ELSE 'Segmentasi C'
	end as Segmentasi
from superstore_data
GROUP BY Id,Income,NumWebVisitsMonth)
AS Segmentasi_Pendapatan
GROUP BY Segmentasi
)
SELECT  Segmentasi,Jumlah, Hitungan_KunjunganWebsite_1Bulan
From MetrikSegmentasi;

-- 5.4 Belanja Dari Toko berdasarkan segmentasi
WITH MetrikSegmentasi AS (
SELECT Segmentasi,
COUNT(*) as Jumlah, SUM(CAST(NumWebPurchases AS INT)) as Hitungan_BelanjaWebsite_Segmentasi
from(
select Id, '$' + cast(Income as varchar) as Pendapatan,NumWebPurchases, 
CASE WHEN Income >= 65000 THEN 'Segmentasi A'
	WHEN income >= 35000 AND Income < 65000 then 'Segmentasi B'
	ELSE 'Segmentasi C'
	end as Segmentasi
from superstore_data
GROUP BY Id,Income,NumStorePurchases)
AS Segmentasi_Pendapatan
GROUP BY Segmentasi
)
SELECT  Segmentasi,Jumlah, Hitungan_BelanjaWebsite_Segmentasi
From MetrikSegmentasi;

--5.5 Belanja dari Diskon berdasarkan segmentasi
WITH MetrikSegmentasi AS (
SELECT Segmentasi,
COUNT(*) as Jumlah, SUM(CAST(NumDealsPurchases AS INT)) as Hitungan_BelanjaDiskon_Segmentasi
from(
select Id, '$' + cast(Income as varchar) as Pendapatan,NumDealsPurchases, 
CASE WHEN Income >= 65000 THEN 'Segmentasi A'
	WHEN income >= 35000 AND Income < 65000 then 'Segmentasi B'
	ELSE 'Segmentasi C'
	end as Segmentasi
from superstore_data
GROUP BY Id,Income,NumDealsPurchases)
AS Segmentasi_Pendapatan
GROUP BY Segmentasi
)
SELECT  Segmentasi,Jumlah, Hitungan_BelanjaDiskon_Segmentasi
From MetrikSegmentasi;


-- 6 Melakukan analisa mengenai perilaku atau kebiasaan belanja customer melalui jenis channel
-- 6.1 Belanja tipe produk daging berdasarkan segmentasi
WITH MetrikSegmentasi AS (
SELECT Segmentasi,
COUNT(*) as Jumlah, SUM(CAST(MntMeatProducts AS INT)) as Hitungan_BelanjaDaging_Segmentasi
from(
select Id, '$' + cast(Income as varchar) as Pendapatan,MntMeatProducts, 
CASE WHEN Income >= 65000 THEN 'Segmentasi A'
	WHEN income >= 35000 AND Income < 65000 then 'Segmentasi B'
	ELSE 'Segmentasi C'
	end as Segmentasi
from superstore_data
GROUP BY Id,Income,MntMeatProducts)
AS Segmentasi_Pendapatan
GROUP BY Segmentasi
)
SELECT  Segmentasi,Jumlah, Hitungan_BelanjaDaging_Segmentasi
From MetrikSegmentasi;

-- 6.2 Belanja tipe produk ikan berdaasarkan segmentasi
WITH MetrikSegmentasi AS (
SELECT Segmentasi,
COUNT(*) as Jumlah, SUM(CAST(MntFishProducts AS INT)) as Hitungan_BelanjaIkan_Segmentasi
from(
select Id, '$' + cast(Income as varchar) as Pendapatan,MntFishProducts, 
CASE WHEN Income >= 65000 THEN 'Segmentasi A'
	WHEN income >= 35000 AND Income < 65000 then 'Segmentasi B'
	ELSE 'Segmentasi C'
	end as Segmentasi
from superstore_data
GROUP BY Id,Income,MntFishProducts)
AS Segmentasi_Pendapatan
GROUP BY Segmentasi
)
SELECT  Segmentasi,Jumlah, Hitungan_BelanjaIkan_Segmentasi
From MetrikSegmentasi;

-- 6.3 Belanja tipe produk emas berdasarkan segmentasi
WITH MetrikSegmentasi AS (
SELECT Segmentasi,
COUNT(*) as Jumlah, SUM(CAST(MntGoldProds AS INT)) as Hitungan_BelanjaEmas_Segmentasi
from(
select Id, '$' + cast(Income as varchar) as Pendapatan,MntGoldProds, 
CASE WHEN Income >= 65000 THEN 'Segmentasi A'
	WHEN income >= 35000 AND Income < 65000 then 'Segmentasi B'
	ELSE 'Segmentasi C'
	end as Segmentasi
from superstore_data
GROUP BY Id,Income,MntGoldProds)
AS Segmentasi_Pendapatan
GROUP BY Segmentasi
)
SELECT  Segmentasi,Jumlah, Hitungan_BelanjaEmas_Segmentasi
From MetrikSegmentasi;

-- 6.4 Belanja tipe produk manis berdasarkan segmentasi
WITH MetrikSegmentasi AS (
SELECT Segmentasi,
COUNT(*) as Jumlah, SUM(CAST(MntSweetProducts AS INT)) as Hitungan_BelanjaManis_Segmentasi
from(
select Id, '$' + cast(Income as varchar) as Pendapatan,MntSweetProducts, 
CASE WHEN Income >= 65000 THEN 'Segmentasi A'
	WHEN income >= 35000 AND Income < 65000 then 'Segmentasi B'
	ELSE 'Segmentasi C'
	end as Segmentasi
from superstore_data
GROUP BY Id,Income,MntSweetProducts)
AS Segmentasi_Pendapatan
GROUP BY Segmentasi
)
SELECT  Segmentasi,Jumlah, Hitungan_BelanjaManis_Segmentasi
From MetrikSegmentasi;

-- 6.5 Belanja tipe produk wine berdasarkan segmentasi
WITH MetrikSegmentasi AS (
SELECT Segmentasi,
COUNT(*) as Jumlah, SUM(CAST(MntWines AS INT)) as Hitungan_BelanjaWine_Segmentasi
from(
select Id, '$' + cast(Income as varchar) as Pendapatan,MntWines, 
CASE WHEN Income >= 65000 THEN 'Segmentasi A'
	WHEN income >= 35000 AND Income < 65000 then 'Segmentasi B'
	ELSE 'Segmentasi C'
	end as Segmentasi
from superstore_data
GROUP BY Id,Income,MntWines)
AS Segmentasi_Pendapatan
GROUP BY Segmentasi
)
SELECT  Segmentasi,Jumlah, Hitungan_BelanjaWine_Segmentasi
From MetrikSegmentasi;


-- 7 Menganalisa dari marketing campaign sebelumnya
/*1 = Merespon dari marketing campaingn
  0 = Tidak Merespon dari marketing campaign*/
select Response, count(Response) as Survey_Campaign_Sebelumnya
from superstore_data
group by response;

-- 7.1 Merespon dari marketing campaign dari segmentasi kustomer
WITH MetrikSegmentasi AS (
SELECT Segmentasi,
COUNT(Response) as Hitungan_Respon_Segmentasi
from(
select Id, '$' + cast(Income as varchar) as Pendapatan,Response, 
CASE WHEN Income >= 65000 THEN 'Segmentasi A'
	WHEN income >= 35000 AND Income < 65000 then 'Segmentasi B'
	ELSE 'Segmentasi C'
	end as Segmentasi
from superstore_data
GROUP BY Id,Income,Response
HAVING Response = 1)
AS Segmentasi_Pendapatan
GROUP BY Segmentasi
)
SELECT Segmentasi,Hitungan_Respon_Segmentasi
FROM MetrikSegmentasi;

-- 7.2 Tidak merespon dari marketing campaign dari segmentasi kustomer
WITH MetrikSegmentasi AS (
SELECT Segmentasi,
COUNT(Response) as Hitungan_Respon_Segmentasi
from(
select Id, '$' + cast(Income as varchar) as Pendapatan,Response, 
CASE WHEN Income >= 65000 THEN 'Segmentasi A'
	WHEN income >= 35000 AND Income < 65000 then 'Segmentasi B'
	ELSE 'Segmentasi C'
	end as Segmentasi
from superstore_data
GROUP BY Id,Income,Response
HAVING Response = 0)
AS Segmentasi_Pendapatan
GROUP BY Segmentasi
)
SELECT Segmentasi,Hitungan_Respon_Segmentasi
FROM MetrikSegmentasi


-- 8 Menganalisa keluhan pada 2 tahun terakhir
/*(1) Keluhan selama 2 tahun terakhir
  (0)Tidak ada Keluhan*/
select Complain, count(Complain) as Banyaknya_Complain
from superstore_data
group by Complain

-- 9 jumlah keseluruhan kustomer dari keseluruhan 
select COUNT(Id) as Keseluruhan_Kustomer
from superstore_data;

-- 10 Customer Lifetime Value

-- 10.1 Rendah
WITH MetrikCLV AS (
SELECT 
COUNT(CAST(NumStorePurchases AS INT)) as Hitungan_Belanja_Toko,COUNT(CAST(NumWebPurchases AS int)) as Hitungan_Belanja_Website,COUNT(NumDealsPurchases) as Hitungan_Belanja_Diskon, COUNT(CAST(NumCatalogPurchases as int)) as Hitungan_Belanja_Catalog
from(
select Id,Recency,NumStorePurchases,NumWebPurchases,NumDealsPurchases,NumCatalogPurchases
from superstore_data
GROUP BY Id,Recency,NumStorePurchases,NumWebPurchases,NumDealsPurchases,NumCatalogPurchases
HAVING Recency  > 60 AND NumStorePurchases <= 10  AND NumDealsPurchases <= 10 AND NumWebPurchases <= 10 AND NumCatalogPurchases <= 10)
as Hitungan_CLV
)
SELECT Hitungan_Belanja_Toko,Hitungan_Belanja_Website,Hitungan_Belanja_Diskon,Hitungan_Belanja_Catalog
From MetrikCLV;

-- 10.2 Tinggi
WITH MetrikCLV AS (
SELECT 
COUNT(CAST(NumStorePurchases AS INT)) as Hitungan_Belanja_Toko,COUNT(CAST(NumWebPurchases AS int)) as Hitungan_Belanja_Website,COUNT(NumDealsPurchases) as Hitungan_Belanja_Diskon, COUNT(CAST(NumCatalogPurchases as int)) as Hitungan_Belanja_Catalog
from(
select Id,Recency,NumStorePurchases,NumWebPurchases,NumDealsPurchases,NumCatalogPurchases
from superstore_data
GROUP BY Id,Recency,NumStorePurchases,NumWebPurchases,NumDealsPurchases,NumCatalogPurchases
HAVING Recency  <= 60 AND NumStorePurchases <= 28  AND NumDealsPurchases <= 28  AND NumWebPurchases <= 28  AND NumCatalogPurchases <= 28)
as Hitungan_CLV
)
SELECT Hitungan_Belanja_Toko,Hitungan_Belanja_Website,Hitungan_Belanja_Diskon,Hitungan_Belanja_Catalog
From MetrikCLV;

-- Dummy metrics
SELECT MAX(CAST(NumWebPurchases AS INT)),MAX(CAST(NumStorePurchases AS INT)),MAX(CAST(NumDealsPurchases AS INT)),MAX(CAST(NumCatalogPurchases AS INT))
FROM superstore_data

where Recency > 90 and NumStorePurchases < 10


select MAX(CAST(Recency AS INT)), MIN(CAST(Recency AS INT))
from superstore_data



