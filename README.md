# SQL Practice for Data Engineering

## Project Overview
This project began as hands-on SQL practice while preparing for the DataCamp's Associate Data Analyst Certification. It uses an AI generated synthetic retail dataset to practice querying relational data and solving common data problems.

I am developing the project further to strengthen the SQL and database skills needed for a transition into Data Engineering.

## Database Schema and Relationships
The project uses a PostgreSQL relational database with five tables:
- `customers` — stores customer information.
- `products` — stores product information.
- `orders` — stores customer order records.
- `order_items` — stores individual items within an order.
- `employees` — stores employee information.

### Logical Relationships
| Parent Table | Referencing Table | Relationship |
|---|---|---|
| customers | orders | One-to-many via `customer_id` |
| orders | order_items | One-to-many via `order_id` |
| products | order_items | One-to-many via `product_id` |

The `order_items` table connects orders to products, allowing an order to contain multiple products and a product to appear in multiple orders.

### Keys and Data Integrity
Primary keys uniquely identify records in their respective tables.

The source tables do not enforce foreign-key constraints. This is intentional for the current practice dataset, which includes invalid customer references for data-quality testing.

The project uses SQL validation queries to identify issues such as missing values, duplicate email addresses, invalid customer references, and non-positive order quantities.

### Current Scope
This project began as SQL certification exam practice and is being extended toward data engineering. Current work focuses on relational data modelling, SQL querying, and data-quality validation.

## Current Scope
* SQL filtering, joins, aggregations and grouping
* NULL handling and analytical queries
* Window functions and ranking
* Relational tables and database querying
* Data quality investigation, including missing values, duplicate emails and invalid references
* Reproducible SQL scripts and validation queries

## Technology Stack
* PostgreSQL
* Supabase
* SQL
* Git and GitHub

## Development Roadmap
1. Strengthen SQL fundamentals and complete certification preparation.
2. Improve database design, constraints and data-quality validation.
3. Build a Python-based ETL workflow with logging and automated tests.
4. Develop repeatable data-loading pipelines and incremental processing.
5. Explore orchestration, cloud data platforms and production data-pipeline practices.

## Dataset and Project Status
The dataset is synthetic and AI-generated for learning purposes. It contains deliberately introduced data-quality issues for practice.

This is a learning project in progress, not a production-grade data pipeline. Planned capabilities will be added and documented as they are implimented.
