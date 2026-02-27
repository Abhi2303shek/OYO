# 🏨 Hotel Pricing & Popularity Dynamics Analysis (MySQL Project)

## 📌 Project Overview

This project analyses a hotel dataset using **MySQL** to uncover insights about:

* 💰 Pricing strategies
* 🎁 Discount positioning
* 👥 Popularity trends (based on ratings count)
* 📍 Location-wise competition

Unlike traditional hotel datasets that include customer ratings (0–5), this dataset provides **ratings count**, which represents popularity or demand rather than satisfaction score.

This shifts the analysis from customer satisfaction to market demand & pricing behaviour analysis.

---

# 🎯 Business Questions Explored

## 🏨 Pricing Strategy Analysis

* What is the average, minimum, and maximum price?
* Which locations are the most expensive?
* How are hotels distributed across the Budget, Mid-range, and Premium segments?
* Do higher-priced hotels offer higher discounts?
* Which hotels provide the highest absolute discount?

---

## 👥 Popularity & Demand Insights

Since `ratings` represents the number of user ratings:

* Which hotels are most popular?
* Which locations generate the highest total demand?
* Do lower-priced hotels receive more ratings?
* Do higher discounts lead to higher popularity?
* Which hotels are “Hidden Demand Winners” (low price + high ratings)?
* Which hotels are overpriced but still popular?

---

## 📊 Competition & Market Structure

* Which location has the highest competition?
* Do locations with more hotels have lower average prices?
* Which locations show price clustering (psychological pricing)?
* Which segment (Budget / Mid / Premium) attracts the highest popularity?
* Which locations offer the best value for money?

---

# 🧠 Key Business Insights

After running 40 structured MySQL queries, the analysis revealed:

### 1️⃣ Popularity ≠ Price

A higher price does not guarantee higher demand. Many mid-range hotels outperform premium hotels in terms of ratings.

### 2️⃣ Discount Strategy Matters

Hotels offering strong discounts often see improved popularity, but extreme discounting does not always guarantee demand leadership.

### 3️⃣ Location Competition Drives Pricing

Highly competitive locations tend to:

* Offer moderate pricing
* Use discounts strategically
* Capture higher cumulative ratings

### 4️⃣ Budget Segment Dominance

Budget hotels frequently attract higher popularity due to affordability and volume-driven demand.

### 5️⃣ Popularity Efficiency Metric

Using:

```
ratings ÷ price
```

We identified hotels generating maximum demand per unit price — a strong value indicator.

---

# 🛠️ Tools Used

* **MySQL**

  * Aggregations (AVG, SUM, COUNT)
  * CASE statements for segmentation
  * Subqueries
  * Derived metrics (discount impact, revenue potential)
  * Competitive density analysis

---

# 📈 Business Takeaway

This project demonstrates how raw hotel listing data can be transformed into:

* Pricing strategy insights
* Competitive intelligence
* Demand modelling
* Market segmentation analysis

It highlights how businesses can use SQL to understand:

> Where demand exists
> How pricing impacts popularity
> Which locations are oversaturated
> And where strategic opportunities lie

---

# 🚀 Why This Project Matters

Recruiters often see basic SQL queries.

This project shows:

* Structured analytical thinking
* Business-oriented problem framing
* Market-level insights from simple columns
* Ability to derive meaningful metrics from limited data

---

# 📌 Future Enhancements

* Add rating score (0–5 scale) for quality analysis
* Time-based demand tracking
* Visualisation using Power BI / Tableau
* Correlation coefficient calculation outside MySQL

