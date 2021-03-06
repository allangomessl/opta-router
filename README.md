# Opta Router Boot

Sample VRP Application using Kotlin + Optaplanner + Graphhopper + Spring Boot + Websockets

This sample application uses the belgium map to calculate distances between points. The map can be found on this [link](http://download.geofabrik.de/europe/belgium-latest.osm.pbf). Download it and point the Env `GRAPH_OSM_PATH` to it's path, in order to run the application.
The `GRAPH_OSM_LOCATION` Env must point to a temporary folder, in order to Graphhopper folder.

Both Envs can be customized on the `application.yml` file.

## Run in development mode

This project is divided in 2 sub modules:

### Server

To run the server module, run on server folder:

    gradle bootRun

This command will run a Spring Boot application on port `8080`.

### Client

To run the client module, make sure you have node and yarn installed on your system, then run on client folder:

    yarn start

Point your browser to `http://localhost:3000`. This module will run on port `3000`, but will proxy remote calls to port `8080`.

### Both Modules

Gradle can run both modules together

    gradle bootRun -parallel

This task will run both modules on port `3000` and `8080`.

## Build assembled jar

To build a jar that contains both server and client modules assembled on the same app. Just run the task on the root folder:

    gradle assembleServerAndClient

This will generate a jar named `app.jar` on the `build` folder. To run the generated app, then run `GRAPH_OSM_PATH=<path_to_osm_map> GRAPH_OSM_LOCATION=<path_to_graphhopper_folder> java -jar app.jar`.

## Docker

A full packaged docker image (with belgium map) can be found at Dockerhub. To run the opta-router image:

    docker run -p 8080:8080 pintowar/opta-router

Point your browser to `http://localhost:8080`.