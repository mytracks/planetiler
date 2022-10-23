# Overview

This repository contains a `Dockerfile` to build [Planetiler](https://github.com/onthegomap/planetiler.git).

# Build
You can build the image using:

```sh
docker build -t mytracks/planetiler .
```

# Run
To build the _MBTiles_ file for the whole planet create a subfolder `data/sources` and download the [`planet-latest.osm.pbf`](https://planet.osm.org/pbf/planet-latest.osm.pbf) file to that folder. Afterwards use the following command to start the conversion:

```sh
docker run -e JAVA_TOOL_OPTIONS="-Xmx32g" -v "$(pwd)/data":/data mytracks/planetiler:latest --mbtiles=/data/openmaptiles.mbtiles --osm-path=/data/sources/planet.osm.pbf
```

To convert the planet file you need a machine with at least 32GB of RAM. On my server machine the conversion takes about 14 hours.

# Minor Changes to Original Code
This repository also contains some minor changes to _Planetiler_ because for my app _myTracks_ some more details are needed. Therefore the folder `planetiler-openmaptiles` contains some Java files with small modifications to the original code. 

If you do not want to use these modifications you can remove the corresponding `ADD` command from the `Dockerfile`.
