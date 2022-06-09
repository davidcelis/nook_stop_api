# Nook Stop API

<center>

![Welcome to Nook Stop, a multimedia terminal from Nook Inc.](/public/assets/images/nook-stop-terminal.png)

</center>

This application powers the API for our main Nook Stop terminal, located in the Resident Service building of the island.

## Getting Started

This application serves as a fun demonstration of how to build an API using GraphQL (lovingly referred to as GiraffeQL throughout the Nook Stop API docs). If you'd like to run it yourself, there are just a couple prerequisites:

* Ruby (3.2.1)
* PostgreSQL (14.3)

Assuming you have these installed, you can clone this repository and run `bin/setup`. This should create the database and seed it with all of the data from Animal Crossing: New Horizons! Then, just run `bin/rails server` and visit http://localhost:3000/ in your browser to see the generated docs site, or http://localhost:3000/graphiql to play around with queries in the interactive GraphiQL environment.
