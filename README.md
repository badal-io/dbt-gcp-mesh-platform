# dbt Mesh Platform

## Project Overview

This is a dbt mesh platform project for Jaffle Shop, an e-commerce analytics data platform built with dbt and BigQuery. The project implements a staging layer that cleanses and standardizes raw e-commerce data from various sources.

## Data Architecture

### Data Sources
- **E-commerce Data** (`ecom` source): Raw transactional data from jaffle_shop_raw schema
  - Customer data
  - Order transactions
  - Product catalog
  - Store locations
  - Order line items
  - Supply chain data

### Models Structure

#### Staging Models (`models/staging/`)
All staging models are materialized as views and follow consistent naming conventions:

- **`stg_customers`**: Standardized customer data with cleaned IDs and names
- **`stg_orders`**: Order-level data with normalized totals, tax amounts, and timestamps
- **`stg_order_items`**: Individual line items linking orders to products
- **`stg_products`**: Product catalog with pricing, descriptions, and categorization (food/beverage items)
- **`stg_locations`**: Store location data
- **`stg_supplies`**: Supply chain and inventory data

#### Data Governance
The project uses dbt groups for data ownership:
- **Platform Team**: Jaff Bridges (jaff.bridges@jaffleshop.com)
- **Finance Team**: Zach Jaff (zach.jaff@jaffleshop.com) 
- **Marketing Team**: Ben Jaffleck (ben.jaffleck@jaffleshop.com)

#### Data Quality
- Freshness checks configured for critical tables (orders, stores)
- Consistent field naming and type standardization
- Price normalization (cents to dollars conversion)
- Boolean flags for product categorization

#### Advanced Features