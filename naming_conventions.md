```markdown
# Naming Conventions & Standards

This document establishes the uniform naming rules across database schemas, tables, views, and SQL scripts.

---

## Schema Layer Prefixes

* `bronze`: Stores raw, uncleaned ingestion tables mirroring source formats.
* `silver`: Stores cleansed, standardized, and type-validated staging tables.
* `gold`: Stores analytical star-schema dimension and fact views.

---

## Table & View Naming

* Source prefixes identify origin systems:
  * `crm_*`: Tables sourced from the Customer Relationship Management system.
  * `erp_*`: Tables sourced from Enterprise Resource Planning systems.
* Dimensional models in Gold Layer:
  * `dim_*`: Dimension tables containing context and descriptive attributes (e.g., `dim_customers`, `dim_products`).
  * `fact_*`: Fact tables containing numeric metrics and foreign keys (e.g., `fact_sales`).

---

## Column Standards

**Identifiers & Keys:**
  * Primary keys in Silver: `cst_id`, `prd_id`.
  * Natural/Business keys: `cst_key`, `prd_key`, `cid`.
  * Surrogate keys in Gold: `customer_key`, `product_key` (generated via `ROW_NUMBER()`).

**Audit Columns:**
  * `dwh_create_date`: Timestamp representing when the record entered the warehouse layer.

**Casing:**
All table names, view names, and column identifiers use lowercase `snake_case`.
