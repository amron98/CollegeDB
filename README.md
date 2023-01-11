
# CollegeDB

A relational database that stores and manages data pertaining to the operations of a mock college

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)


## Table of Contents

- [Run Locally](#run)
- [Documentation](#documentation)
- [Entity Relationship Diagram](#erd)
- [Database Model](#eer)


## Run Locally {#run}

### Prerequisites
In order to successfully run an instance of CollegeDB in your local machine, please ensure the following are installed:

- MySQL Community Server (Version 8.0+)
- MySQL Workbench

You may view [this YouTube tutorial](https://www.youtube.com/watch?v=u96rVINbAUI) to help guide the installation process


### Clone Project

Once MySQL is up and running, go ahead and clone this repository to your local machine
```bash
  git clone https://github.com/amron98/CollegeDB
```

Go to the project directory

```bash
  cd CollegeDB
```

### Create database
There are two options to creating the CollegeDB in your local machine. The first, and most direct. is to run the forward engineered SQL script to create the database as well as the tables with their associated relationships.
#### Run SQL script 
Using terminal, connect to MySQL using your credentials and run the SQL script

```sql
  mysql -u <username> -p <CollegeDB> < <./CollegeDB.sql>

```
You will then be prompted to enter your password

Once the connection has been established, this command creates a new database, "CollegeDB" and runs the SQL script inside of it. In this case, it creates all of the tables and their relationships.


## Documentation

Access the complete documentation for CollegeDB [here](https://github.com/amron98/CollegeDB/blob/main/milestones/Milestone2/M2.pdf)


## Entity Relationship Diagram {#erd}

![Entity Relationship Diagram](https://github.com/amron98/CollegeDB/blob/main/resources/CollegeDB.ERD.png)

## Database Model {#eer}

![Database Model](https://github.com/amron98/CollegeDB/blob/5c92651798904d2e6fb3ac37a67ed637924e4e61/resources/CollegeDB.EER.png)
