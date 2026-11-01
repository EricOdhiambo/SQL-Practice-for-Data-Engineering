# Database Entity Relationship Diagram

## Overview
This document describes the logical data model for the synthetic retail database.

The database contains five tables: customers, products, orders, order_items and employees.

## Entity Relationships

```mermaid
erDiagram
    CUSTOMERS ||--o{ ORDERS : places
    ORDERS ||--o{ ORDER_ITEMS : contains
    PRODUCTS ||--o{ ORDER_ITEMS : appears_in
    EMPLOYEES o|--o{ EMPLOYEES : manages

    CUSTOMERS {
        int customer_id PK
    }

    ORDERS {
        int order_id PK
        int customer_id
    }

    ORDER_ITEMS {
        int order_item_id PK
        int order_id
        int product_id
    }

    PRODUCTS {
        int product_id PK
    }

    EMPLOYEES {
        int employee_id PK
    }
```
## Relationship Descriptions
1. **Customers and Orders (One-to-Many):** One customer can place multiple orders. Each order is intended to belong to one customer.
2. **Orders and Order Items (One-to-Many):** One order can contain multiple order items. Each order item is intended to belong to one order.
3. **Products and Order Items (One-to-Many):** One product can appear in multiple order items. Each order item is intended to reference one product.
4. **Orders and Products (Many-to-Many):** One order can contain multiple products, and one product can appear in multiple orders. This many-to-many relationship is implemented through the `order_items` junction table.
5. **Employees (Self-Referencing Relationship):** Based on the schema documented, there is no declared relationship between employees and customers, products, orders, or order_items.

   However, the `manager_id` column potentially establishes a relationship within the employees table itself:

   - One manager can manage multiple employees.
   - An employee can have one manager.
   - A top-level employee may have no manager (`manager_id` is NULL).

   This is called a **self-referencing** or **recursive relationship**. The `manager_id` column is intended to reference another employee's `employee_id`.

   The actual foreign-key constraint and validity of these references have not yet been verified.

The `order_items` table acts as a junction table between orders and products.

## Data Dictionary

This section documents the columns, data types and nullability of the five database tables, based on the PostgreSQL schema.

### 1. Customers

| Column | Data Type | Nullable | Description |
|---|---|---|---|
| `customer_id` | INTEGER | No | Unique customer identifier (Primary Key) |
| `name` | TEXT | Yes | Customer name |
| `email` | TEXT | Yes | Customer email address |
| `signup_date` | DATE | Yes | Customer registration date |
| `region` | TEXT | Yes | Customer region |
| `age` | INTEGER | Yes | Customer age |

### 2. Products

| Column | Data Type | Nullable | Description |
|---|---|---|---|
| `product_id` | INTEGER | No | Unique product identifier (Primary Key) |
| `product_name` | TEXT | Yes | Product name |
| `category` | TEXT | Yes | Product category |
| `cost` | NUMERIC | Yes | Product cost |

### 3. Orders

| Column | Data Type | Nullable | Description |
|---|---|---|---|
| `order_id` | INTEGER | No | Unique order identifier (Primary Key) |
| `customer_id` | INTEGER | Yes | Customer associated with the order |
| `order_date` | DATE | Yes | Date the order was placed |
| `status` | TEXT | Yes | Order status |
| `total_amount` | NUMERIC | Yes | Total order amount |

### 4. Order Items

| Column | Data Type | Nullable | Description |
|---|---|---|---|
| `order_item_id` | INTEGER | No | Unique order item identifier (Primary Key) |
| `order_id` | INTEGER | Yes | Associated order identifier |
| `product_id` | INTEGER | Yes | Associated product identifier |
| `quantity` | INTEGER | Yes | Quantity of the product ordered |
| `unit_price` | NUMERIC | Yes | Price per product unit |

### 5. Employees

| Column | Data Type | Nullable | Description |
|---|---|---|---|
| `employee_id` | INTEGER | No | Unique employee identifier (Primary Key) |
| `name` | TEXT | Yes | Employee name |
| `manager_id` | INTEGER | Yes | Identifier of the employee's manager |
| `department` | TEXT | Yes | Employee department |
| `hire_date` | DATE | Yes | Employee hire date |
| `salary` | NUMERIC | Yes | Employee salary |

### Schema Observations

- All five tables have an integer primary-key column.
- All other columns currently allow NULL values.
- No column defaults were returned by the schema inspection query.
- Foreign-key constraints were not found in the `public` schema.
- Columns such as `orders.customer_id`, `order_items.order_id`, `order_items.product_id` and `employees.manager_id` represent intended relationships in the logical data model. Their referential integrity is not currently enforced through foreign-key constraints.

## Data Integrity Considerations
The current practice database uses primary keys but does not enforce foreign-key constraints.

The relationships shown represent the intended logical structure. Data-quality validation queries are used to identify invalid references and other data issues.

## Future Improvements
- Implement and test foreign-key constraints.
- Document all columns and their data types.
- Define mandatory and optional fields.
- Introduce business rules and validation constraints.
- Expand automated data-quality testing.
