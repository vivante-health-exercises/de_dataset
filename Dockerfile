FROM python:3.10-slim-bullseye

WORKDIR "/dbt"

# Define environment variables
ENV DBT_PROFILES_DIR=./

# Install dbt and sqlfluff
RUN pip3 install 'dbt-postgres<1.9.0'

ENTRYPOINT ["dbt"]
