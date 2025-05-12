# Inventory Management System

## Description
This project implements an Inventory Management System using MySQL. The system tracks users, suppliers, items, and transactions. The following entities are included:

- **Users**: For managing system users (e.g., admin).
- **Suppliers**: Information about suppliers.
- **Items**: Inventory items with descriptions, quantities, and prices.
- **Transactions**: Logs of transactions including sales or purchases.
- **TransactionDetails**: Details of items involved in each transaction.

## Database Structure

The database is structured with the following tables:

1. **Users**: Stores information about users.
2. **Suppliers**: Stores supplier details.
3. **Items**: Stores items available in the inventory.
4. **Transactions**: Records transactions involving users.
5. **TransactionDetails**: Details of each item involved in a transaction.

## How to Run/Setup the Project

1. **Install MySQL**: Ensure that you have MySQL installed on your machine. You can download MySQL from the official website: https://dev.mysql.com/downloads/installer/

2. **Setup the Database**:
   - Open your MySQL client (e.g., MySQL Workbench or command-line client).
   - Run the SQL script below to create the necessary database and tables.

3. **Execute the SQL Script**: 
   - Open the provided `inventory.sql` file in your MySQL client.
   - Run the SQL script to create the database, tables, and insert sample data.

  
### Entity-Relationship Diagram (ERD)

```sql
┌───────────────────────────────────────┐          ┌───────────────────────────────────────┐
│               Users                   │          │              Suppliers                │
├───────────────────────────────────────┤          ├───────────────────────────────────────┤
│ • user_id (PK)                        │          │ • supplier_id (PK)                    │
│ • username (UQ)                       │          │ • name                                │
│ • password                            │          │ • contact_name                        │
│ • email (UQ)                          │          │ • contact_phone                       │
└───────────────────┬───────────────────┘          │ • contact_email                       │
                    │                              └───────────────────┬───────────────────┘
                    │                                                  │
                    │                                                  │
                    ▼                                                  ▼
┌───────────────────────────────────────┐          ┌───────────────────────────────────────┐
│            Transactions               │          │               Items                   │
├───────────────────────────────────────┤          ├───────────────────────────────────────┤
│ • transaction_id (PK)                 │          │ • item_id (PK)                        │
│ • transaction_date                    │          │ • name                                │
│ • user_id (FK → Users)                │          │ • description                         │
│ • transaction_type                    │          │ • quantity                            │
│ • total_amount                        │          │ • price                               │
└───────────────────┬───────────────────┘          │ • supplier_id (FK → Suppliers)        │
                    │                              └───────────────────────────────────────┘
                    │
                    │
                    ▼
┌───────────────────────────────────────┐
│         TransactionDetails            │
├───────────────────────────────────────┤
│ • transaction_detail_id (PK)          │
│ • transaction_id (FK → Transactions)  │
│ • item_id (FK → Items)                │
│ • quantity                            │
│ • price                               │
└───────────────────────────────────────┘