use newproject
Select * from INVENTORY
select * from SALES
Select * from STORES
Select * from PRODUCTS


/*Sales Trend Analysis
Monthly wise sales trend over the stores, location for both year(2022 & 2023)*/

SELECT
    st.Store_Name,
    st.Store_Location,
    YEAR(sa.Date) AS Year,
    DATENAME(MONTH, sa.Date) AS Month,
    SUM(sa.Units * p.Product_retail_Price) AS Total_Sales
FROM SALES sa
JOIN PRODUCTS p ON sa.Product_ID = p.Product_ID
JOIN STORES st ON sa.Store_ID = st.Store_ID
WHERE YEAR(sa.Date) IN (2022, 2023)
GROUP BY
    st.Store_Name,
    st.Store_Location,
    YEAR(sa.Date),
    DATENAME(MONTH, sa.Date),
    MONTH(sa.Date)
ORDER BY
    YEAR(sa.Date),
    MONTH(sa.Date),
    st.Store_Name;


/*Stores performance Analysis
Find the sales trend over the different Stores and find the best and least five stores 
as per the performance in one query.*/

    WITH StoreSales AS (
    SELECT
        st.Store_ID,
        st.Store_Name,
        st.Store_Location,
        SUM(sa.Units * p.Product_retail_Price) AS Total_Sales
    FROM SALES sa
    JOIN PRODUCTS p ON sa.Product_ID = p.Product_ID
    JOIN STORES st ON sa.Store_ID = st.Store_ID
    GROUP BY st.Store_ID, st.Store_Name, st.Store_Location
),
RankedStores AS (
    SELECT 
        *,
        RANK() OVER (ORDER BY Total_Sales DESC) AS Sales_Rank_Desc,
        RANK() OVER (ORDER BY Total_Sales ASC)  AS Sales_Rank_Asc
    FROM StoreSales
)
SELECT 
    Store_ID,
    Store_Name,
    Store_Location,
    Total_Sales,
    CASE 
        WHEN Sales_Rank_Desc <= 5 THEN 'Best 5 Store'
        WHEN Sales_Rank_Asc <= 5 THEN 'Least 5 Store'
        ELSE 'Average Performer'
    END AS Performance_Category
FROM RankedStores
WHERE Sales_Rank_Desc <= 5 OR Sales_Rank_Asc <= 5
ORDER BY Total_Sales DESC;



/*Does the area of store location  effect the sales of the product */


SELECT 
    st.Store_Location,
    COUNT(DISTINCT st.Store_ID) AS Total_Stores,
    SUM(sa.Units * p.Product_Retail_Price) AS Total_Sales,
    SUM(sa.Units * p.Product_Retail_Price) / COUNT(DISTINCT st.Store_ID) AS Avg_Sales_Per_Store
FROM SALES sa
JOIN PRODUCTS p ON sa.Product_ID = p.Product_ID
JOIN STORES st ON sa.Store_ID = st.Store_ID
GROUP BY st.Store_Location
ORDER BY Total_Sales DESC;


/*Interpretation
Downtown has the highest total sales because it has many stores (29).
→ It contributes the most overall revenue.

Airport has the fewest stores (3) but the highest average sales per store.
→ Each store at the Airport performs exceptionally well, selling more than any other location on average.

Commercial and Residential areas have moderate performance, with similar averages.

✅ Conclusion

The area of store location does affect sales performance.

Downtown drives total revenue due to scale (more stores).

Airport shows better efficiency — higher average sales per store, meaning it’s a premium or high-demand area.

So, if the company wants to expand profitably, investing in more Airport-type locations could yield higher sales per outlet.
Conclusion (What You’ll Say After Running It)

Yes, the area of store location affects the sales of the product.

Locations like Downtown generate higher total sales because they have more stores.

Locations like Airport show higher average sales per store, meaning better performance per outlet.

Therefore, store location significantly influences sales outcomes — both in total volume and store efficiency.*/




/*Product performance Analysis-
Find out the report of Product and Store relationship towards sale.*/


SELECT 
    p.Product_ID,
    p.Product_Name,
    st.Store_ID,
    st.Store_Location,
    SUM(sa.Units * p.Product_Retail_Price) AS Total_Sales,
    SUM(sa.Units) AS Total_Units_Sold,
    AVG(p.Product_Retail_Price) AS Avg_Product_Price
FROM SALES sa
JOIN PRODUCTS p ON sa.Product_ID = p.Product_ID
JOIN STORES st ON sa.Store_ID = st.Store_ID
GROUP BY p.Product_ID, p.Product_Name, st.Store_ID, st.Store_Location
ORDER BY st.Store_Location, Total_Sales DESC;




/*Is there any category that outshines the rest .High demanded product among all locations 
as per the sales.*/



SELECT 
    p.Product_Category,
    SUM(sa.Units) AS Total_Units_Sold,
    SUM(sa.Units * p.Product_Retail_Price) AS Total_Sales
FROM SALES sa
JOIN PRODUCTS p ON sa.Product_ID = p.Product_ID
JOIN STORES st ON sa.Store_ID = st.Store_ID
GROUP BY p.Product_Category
ORDER BY Total_Sales DESC;


/* Inventory Health analysis
Find out the avg_inventory as per the store and product.*/


SELECT 
    st.Store_ID,
    st.Store_Name,
    st.Store_Location,
    p.Product_ID,
    p.Product_Name,
    AVG(inv.Stock_On_Hand) AS Avg_Inventory
FROM INVENTORY inv
JOIN PRODUCTS p ON inv.Product_ID = p.Product_ID
JOIN STORES st ON inv.Store_ID = st.Store_ID
GROUP BY st.Store_ID, st.Store_Name, st.Store_Location, p.Product_ID, p.Product_Name
ORDER BY st.Store_Location, Avg_Inventory DESC;

