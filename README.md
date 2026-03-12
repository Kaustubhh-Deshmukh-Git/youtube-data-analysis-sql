# 📺 YouTube Data Analysis & Business Insights (SQL)

A comprehensive data analysis project using a simulated YouTube database to extract meaningful insights on content engagement, user growth, and channel performance. This project demonstrates the ability to transform raw data into actionable business intelligence.

## 📊 Project Overview
This analysis explores a relational database with tens of thousands of channels and millions of users to help stakeholders understand:
- **Engagement Drivers:** Identifying high-traffic content and genre trends.
- **User Demographics:** Analyzing premium membership growth across different genders and countries.
- **Channel Performance:** Reviews for specific entities like TEDx and Single Shot.

## 🏗️ Database Architecture
The system is built on a relational schema featuring 7 interconnected tables:
- `user`: Demographic data and membership status.
- `channel`: Channel ownership and metadata.
- `video`: Core content metrics and views.
- `user_likes`: Granular engagement tracking (Likes/Dislikes).
- `channel_user`: Subscription mapping.
- `genre` & `video_genre`: Multi-category content classification.

## 🛠️ SQL Techniques Demonstrated
- [cite_start]**Aggregations:** mastering `COUNT()`, `SUM()`, `AVG()`, and `MAX/MIN`[cite: 362, 371].
- [cite_start]**Relational Logic:** Using `JOIN` and `IN` for cross-table analysis[cite: 362].
- **Data Filtering:** Pattern matching with `LIKE` and date manipulation with `strftime`.
- [cite_start]**Advanced Querying:** implementing `GROUP BY`, `HAVING`, and nested subqueries[cite: 363, 373].

## 🚀 How to Run
1. Execute `schema.sql` to build the table structures.
2. Execute `seed_data.sql` to populate the database with sample records.
3. Run `data_analysis.sql` to view the generated business insights.