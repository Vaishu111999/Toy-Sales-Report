### 🧸 Toy Sales Report Dashboard

### 📊 Project Overview
The **Toy Sales Report Dashboard** provides a **comprehensive view** of store performance across multiple locations, highlighting key insights 
into **sales trends**, **inventory health**, **product demand**, and **profitability**.  

This interactive Power BI dashboard helps management and analysts make **data-driven business decisions** — such as where to expand, 
how to optimize stock levels, and which product categories to prioritize for growth.

---

### 🧭 Key Insights & Storytelling

### 🏙️ 1. Store Location & Sales Performance
The data clearly shows that **store location** plays a crucial role in driving sales performance.  
- **Downtown stores** generate the highest revenue, exceeding **$8 million**, followed by **Commercial areas**.  
- **Residential** and **Airport** locations contribute relatively lower sales.  
- This indicates that **store placement in high-traffic areas** directly impacts revenue potential.

---

### 🏪 2. Store Performance Analysis
A bar chart compares the **Top 5 and Bottom 5 stores** by total sales.  
- **Top Performers:**  
  - Toys Ciudad de México 2 (~600K in sales)  
  - Toys Guadalajara 3  
  - Toys Ciudad de México 1  
- **Low Performers:**  
  - Toys Campeche 2  
  - Toys La Paz 1  

👉 These insights highlight the need for deeper analysis into underperforming stores — focusing on **location, inventory levels, and local demand**.

---

### 📦 3. Average Inventory Analysis
The **inventory vs. sales scatter plot** shows the relationship between **average stock levels** and **sales performance**.  
- Some stores achieve **high sales with lower inventory**, while others hold **excess stock** but perform poorly.  
- This helps identify **overstocked or underperforming products**, allowing for better **stock optimization** across locations.

---

###  📈 4. Sales Trend Analysis (2022–2023)
The **monthly trend visualization** shows consistent growth **year-over-year**, especially during **April and December** — 
likely due to **festive promotions and seasonal demand**.  
This insight supports **targeted marketing and inventory planning** during high-demand months.

---

### 🎯 5. Product Category Performance
The **Product Category Analysis** highlights which segments drive the most revenue:
- 🧸 **Toys** – Over **$5 million**, the company’s strongest segment.  
- 🎨 **Art & Crafts**, ⚡ **Electronics**, 🎮 **Games**, and 🏀 **Sports & Outdoors** – Contribute moderate but steady sales.  

This shows that **toys remain the core revenue pillar**, while other categories offer diversification.

---

###💡 6. Key Performance Indicators (KPIs)

| Metric | Value |
|--------|--------|
| **Total Profit** | 💰 $4 Million |
| **Total Revenue** | 💵 $14 Million |
| **Total Units Sold** | 📦 1 Million |
| **Total Cost** | 🧾 $10 Million |
| **Stock on Hand** | 🏗️ 29,742 Units |
| **Average Inventory per Product** | 📊 18.67 Units |
| **Active Stores** | 🏬 10 |
| **Total Product Count** | 🧮 35 |

> 💬 The business maintains a **healthy profit margin (~28%)** and shows **efficient inventory management** across all stores. The company spent $10 million to produce and sell 1 million toys, which helped generate $14 million in revenue and $4 million in profit.Overall, the business is profitable and can grow even more by adding more stores in high-performing areas like airports.
---

## 🧠 Business Impact
This dashboard offers a **holistic view of business performance** — enabling management to:
- Identify **top-performing and underperforming locations**
- Optimize **inventory distribution**
- Plan **marketing campaigns** for seasonal peaks
- Focus on **high-demand product categories**
- Support **strategic decisions** for expansion and profitability improvement

---

## 🛠️ Tools & Technologies
- **Power BI** – Data visualization & dashboard design  
- **Microsoft Excel / SQL** – Data preparation & transformation  
- **DAX (Data Analysis Expressions)** – Calculated measures & KPIs  
- **Power Query** – Data cleaning & modeling  

---

## 📂 Data Model & Relationships
The model follows a **Star Schema**:
- **Fact Table:** `SALES`  
- **Dimension Tables:** `PRODUCTS`, `STORES`, `LOCATIONS`  
- Relationships:
  - `SALES[Product_ID] → PRODUCTS[Product_ID]`
  - `SALES[Store_ID] → STORES[Store_ID]`
  - `STORES[Location_ID] → LOCATIONS[Location_ID]`

This structure enables **efficient aggregation**, **filtering**, and **drill-down analysis** across multiple dimensions.

---

## 📸 Dashboard Preview
<img width="1176" height="676" alt="image" src="https://github.com/user-attachments/assets/7b269e88-6ca2-4a4b-a767-3dea1f62b790" />


