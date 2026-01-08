# Student Course Management System – ABAP Cloud

This project demonstrates the design and implementation of a **Student Course Management System** using **modern ABAP Cloud concepts**.

The primary focus of the project is on **data modeling, relational database design, and Core Data Services (CDS)** rather than UI frameworks.  
It follows enterprise-grade design principles commonly used in **SAP S/4HANA systems**.

---

## Project Overview

The system models three core business entities:

- **Students**
- **Courses**
- **Enrollments**

A database-first approach was followed to ensure data integrity, scalability, and clean separation of responsibilities.

---

## Database Design (Data Dictionary)

The database layer was designed using **ABAP DDL table definitions**.

### Tables Implemented

- **ZSTUDENT** – Stores student master data
- **ZCOURSE** – Stores course master data
- **ZENROLLMENT** – Models the many-to-many relationship between students and courses

The enrollment table uses a **composite primary key** `(student_id, course_id)` to prevent duplicate enrollments and enforce business rules.

---

## Data Modeling Principles

- Separation of master data and relationship data
- Normalized schema to avoid redundancy
- Clear ownership of attributes (e.g., course title belongs to COURSE, not ENROLLMENT)
- Client-dependent data handling using `MANDT`

---

## Core Data Services (CDS)

Multiple CDS views were created to expose the same underlying data in different business-friendly shapes without modifying the database tables.

### CDS Views Implemented

- **ZI_ENROLLMENT**  
  Enrollment-centric view exposing student and course information using CDS associations.

- **ZI_STUDENT_OVERVIEW**  
  Student-centric view demonstrating one-to-many relationships between students and enrollments.

- **ZI_STUDENT_COURSE**  
  Layered CDS view built on top of `ZI_ENROLLMENT` to provide a clean, consumer-friendly projection.

CDS associations and cardinality (`[1..1]`, `[0..*]`) are used to model relationships semantically instead of relying on hard SQL joins.

---

## ABAP Consumption

The CDS views are consumed using **Open SQL in ABAP**, demonstrating how CDS acts as a read model while ABAP focuses on application logic.

---

## Key Learnings

- Enterprise-grade relational data modeling
- Many-to-many relationship handling
- CDS associations vs SQL joins
- Layered CDS view design and reuse
- Clean separation between database, data models, and application logic

---

## Technologies Used

- ABAP Cloud
- ABAP DDL (Data Dictionary)
- Core Data Services (CDS)
- Eclipse ADT
