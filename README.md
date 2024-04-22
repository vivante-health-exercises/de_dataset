# Data Engineering Interview Dataset 

## Background
At Vivante, we routinely leverage DBT to transform our data for a variety of reporting and modeling use cases. Hopefully this exercise will be representative of collaboration together on a normal work day. 

## The Dataset
The Centers for Disease Control and Prevention (CDC) routinely conducts a study to assess the health of adults and children living in the United States - the National Health and Nutrition Examination Survey (NHANES).

The NHANES consists of two components, a self-report interview and a physical examination. 

This exercise utilizes a subset of variables from the publicly available 2013-2014 NHANES dataset, encompassing four distinct
domains:
   1. Demographics
   2. Dietary Habits
   3. Physical Examination/Laboratory Test Results
   4. Healthcare Utilization

NOTE: Metadata can be found in data/metadata_nhanes.csv.

## Local Database Instructions
The included SQL and yaml files will give you more information about the database structure. You can creat a local postgres database by: 
1. Run docker compose up in the root directory
2. You should now be able to login to pgAdmin with the following:
- hostname: postgres-local
- username: pgadmin@vivantehealth.interview
- password: pw
3. And connect to the running PostresDB with the following:
- username: postgres
- password: admin
Or, if you want to install PostgreSQL locally, read [this](https://github.com/vivante-health-exercises/de-exercise-bengriffith/blob/main/LocalPostgresDBInstallation.md)

Run DBT:
1. Seed the database: dbt seed
NOTE: This may take up to 5 minutes
- Run dbt: dbt run
- Test dbt: dbt test
