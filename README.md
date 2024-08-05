# Data Engineering Interview Dataset 

## Background
At Cylinder, we routinely leverage DBT to transform our data for a variety of reporting and modeling use cases. Hopefully this exercise will be representative of collaboration together on a normal work day. 

## The Dataset
The Centers for Disease Control and Prevention (CDC) routinely conducts a study to assess the health of adults and children living in the United States - the National Health and Nutrition Examination Survey (NHANES).

The NHANES consists of two components, a self-report interview and a physical examination. This exercise utilizes a subset of variables from the publicly available 2013-2014 NHANES dataset, encompassing Demographics, Dietary Habits, Physical Examination/Laboratory Test Results, and Healthcare Utilization domains

This data has been condensed into a single dataset that can be found in `data/raw_data_nhanes_final.csv` and the code mappings for the columns can be found in the `description` field of `data/metadata_nhanes.csv`.

TODO depending on the actual exercise, explain the `models/base_mapping` models or switch to `examples`

## Local Environment
The local environment is composed of three containers can be found in the `docker-compose.yml` file: a postgres DB, a dbt environment, and pgadmin.

### Starting and accessing the environment
1. Execute `docker compose up -d` to start all containers
2. Execute `docker compose exec dbt bash` to start working within the dbt container
3. Execute `dbt seed` to load the dataset into the database

There is no need to shutdown the container while editing files, and changes will be available in the dbt environment for any subsequent `dbt` commands that are run. A barebones dbt project is setup already, so any models you add can be placed into the `models/warehouse` directory and configured in `models/warehouse/warehouse.yml`.

To run your models execute `dbt run` and to test your models (after running) execute `dbt test`. For more details on dbt see their documentation [here](https://docs.getdbt.com/docs/introduction).

#### Accessing the Database
The pgadmin interface will be available at localhost:5050 and can be accessed using user `pgadmin@vivantehealth.interview` with password `pgadmin`.

Once in pgadmin, you can connect to the database with hostname `postgres`, user `postgres`, and password `postgres`.

Alternatively, the database container and `psql` is accessible via terminal with:
1. `docker compose exec postgres bash`
2. `psql -U postgres`

### Shutting down the dbt environment
1. Execute `exit` to leave the dbt container
2. Execute `docker compose down -v` to stop all containers and remove volumes
  - Note that this will remove all data in the DB. Leave off the `-v` flag if you want it to remain
