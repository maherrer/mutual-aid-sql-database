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

## How to Run
1. Execute `G1_Final_Project.sql` to create tables
2. Run insert statements (if included)
3. Execute queries to test outputs
