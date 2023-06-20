Welcome to my dbt test project!

### Setup requirements for dbt 

```
brew update
brew install git
brew tap dbt-labs/dbt
```
For this project we are trying out dbt locally without any connection to data warehouses, 
so we need to install a local database. Dbt has an adapter for Postgres, so we will use that one.

`brew install dbt-postgres`

You can also install all packages via pip with 
```
pip install dbt-core
pip install dbt-postgres
```

For installing Postgres on Mac I 
followed [this guide](https://www.postgresqltutorial.com/postgresql-getting-started/install-postgresql-macos/).
The data that I am using is a public sample dataset of dvdrental data. It's used in the Postgres 
installation guide from above. You can find more information about the dataset 
[on this page](https://www.postgresqltutorial.com/postgresql-getting-started/postgresql-sample-database/).

When you check your installation with `pip list` you should see the following packages installed: 
```
dbt-core           
dbt-extractor
dbt-postgres
```

### Configuring dbt for Postgres
In the `profile.yml` file all the information for the connection targets.

```test_dbt:
  outputs:
    dev:
      type: postgres    # adapter_name
      threads: 1
      host: localhost   # since postgres host
      port: 5432        # postgres port
      user: postgres    # postgres user
      pass: "******"    # password for the user as string  
      dbname: dvdrental # name of the database
      schema: public    # name of the schema
```


### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
