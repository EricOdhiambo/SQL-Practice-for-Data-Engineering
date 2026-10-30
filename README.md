# SQL Practice for Data Engineering

## Project Overview
This project began as hands-on SQL practice while preparing for the DataCamp Associate Data Analyst Certification. It uses an AI-generated synthetic retail dataset to practise querying relational data and solving common data problems.

The project is being developed further to strengthen the SQL and database skills needed for a transition into data engineering.

## Database Schema and Relationships
The project uses a PostgreSQL relational database hosted on Supabase. It contains five tables:

| Table | Purpose |
|---|---|
| `customers` | Stores customer information |
| `products` | Stores product information |
| `orders` | Stores customer order records |
| `order_items` | Stores individual items within an order |
| `employees` | Stores employee information |

### Logical Relationships
| Parent Table | Referencing Table | Relationship |
|---|---|---|
| `customers` | `orders` | One-to-many via `customer_id` |
| `orders` | `order_items` | One-to-many via `order_id` |
| `products` | `order_items` | One-to-many via `product_id` |

The `order_items` table links orders and products. An order can contain multiple items, and a product can appear in multiple orders.

### Keys and Data Integrity
Primary keys uniquely identify records in their respective tables.

Foreign-key constraints are not enforced in the current practice dataset. This allows invalid references to be included and investigated through data-quality checks.

The validation queries check for missing values, duplicate email addresses, invalid customer references, missing order statuses, and non-positive order quantities.

The relationships described above represent the intended logical model and do not imply that foreign-key constraints are enforced.

## Current Scope
- SQL filtering, joins, aggregations and grouping
- NULL handling and analytical queries
- Window functions and ranking
- Relational tables and database querying
- Data-quality investigation, including missing values, duplicate emails and invalid references
- Reproducible SQL scripts and validation queries

## Technology Stack
- PostgreSQL
- Supabase
- SQL
- Git and GitHub

## Development Roadmap
1. Strengthen SQL fundamentals and complete certification preparation.
2. Improve database design, constraints and data-quality validation.
3. Build a Python-based ETL workflow with logging and automated tests.
4. Develop repeatable data-loading pipelines and incremental processing.
5. Explore orchestration, cloud data platforms and production data-pipeline practices.

## Dataset and Project Status
The dataset is synthetic and AI-generated for learning purposes. It contains deliberately introduced data-quality issues for practice.

This is a learning project in progress, not a production-grade data pipeline. Planned capabilities will be added and documented as they are implemented.
