# 🏀 NBA 2024–25 Analytics Dashboard

**By Mahdi Mahin**

An end-to-end analysis of the 2024–25 NBA season using **PostgreSQL** for data wrangling and **Tableau Public** for interactive visualization.

## 🔗 Live Dashboard

👉 **View the interactive Tableau dashboard**:  
[https://public.tableau.com/views/](https://public.tableau.com/app/profile/mahdi.mahin/viz/NBA202425DataAnalyticsDashboardMahdiMahin/Dashboard1?publish=yes)


---

## 📦 Repository Structure


---

## ⚙️ Tech Stack

- **Database:** PostgreSQL
- **Viz:** Tableau Public
- **Data Source:** Basketball Reference (2024–25 season)
- **File Formats:** CSV (cleaned exports)

---

## 📊 Included Analyses

- **Top Scorers**
- **Rebound Leaders**
- **Most Efficient Scorers (FG%)**
- **Most Efficient 3-Point Shooters** (high volume: attempts + %)
- **Best 2-Way Players** (PTS + REB + AST)
- **Best Offensive Teams** (team PPG, FG%, AST)
- **Per-36 Leaders** (rate-normalized impact)
- **Prime Age Curve** (age vs contribution)

---

## 🧠 Key Insights (examples)

- **Top Scoring**: Shai Gilgeous-Alexander and Luka Dončić lead volume scoring.
- **3PT Efficiency**: Elite shooters emerge when filtering for both high volume and accuracy.
- **Team Offense**: A few teams stand out with high PPG and strong FG% synergy.
- **Prime Age**: Average peak contribution tends to cluster around **26–29**.

*(Update this section with your actual findings once you finalize your numbers.)*

---

## 🗂 Data & Reproducibility

All final CSVs used by the Tableau dashboard are in `/data`.  
Core SQL logic is in `/sql_queries/analysis.sql`.

**Recreate workflow (summary):**
1. Load raw player & team data into PostgreSQL.
2. Run queries in `sql_queries/analysis.sql`.
3. Export result sets to CSV (saved in `/data`).
4. Connect CSVs to Tableau and build dashboard (link above).

---

## 👋 Contact

If you have questions or want to collaborate, feel free to reach out!
