## Mutual Aid Database Design & SQL Project

## Overview
Designed and implemented a relational database to support a mutual aid platform that connects organizations, volunteers, and donors.

## Problem Statement
Mutual aid groups often operate independently with limited centralized systems. This project creates a structured database to improve coordination and access.

## Database Design
- Conceptual, logical, and physical models
- Core tables: users, volunteers, donors, mags (organizations), donations, reviews, issues
- Primary/foreign keys and constraints to enforce integrity

## Key Features
- Full schema creation (DDL) with constraints
- Up/Down scripts for setup and teardown
- Sample data inserts
- Analytical queries for business questions

## Example Queries
- Volunteers by issue of interest
- Donors by organization and donation amount
- Donations filtered by thresholds

## Tech Stack
- SQL Server / Azure Data Studio
- SQL (DDL, DML, joins)
- Relational database design

## Results
- Normalized schema with clear relationships
- Reliable joins across entities (users ↔ mags ↔ donations)
- Query set that answers real coordination questions

## Future Improvements
- Add reference tables (e.g., states)
- Further normalization where needed
- Expand reporting queries

  ## 👥 Contributors
- **Maybel Herrera**  
- Tinaria Alnouri 
- Thomas Lento
- Anna Shah

## How to Run

1. Open the SQL file in SQL Server or Azure Data Studio  
2. Execute the script to create tables and relationships  
3. Run queries to test and explore the database  

