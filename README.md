This repository contains a `Dockerfile` to build [Planetiler](https://github.com/onthegomap/planetiler.git).

You can build the image using:

```sh
docker build -t mytracks/planetiler .
```

To build the _MBTiles_ file for the whole planet first download `planet-latest.osm.pbf` to data/sources. Then you the following command to start the conversion:

```sh
docker run -e JAVA_TOOL_OPTIONS="-Xmx32g" -v "$(pwd)/data":/data mytracks/planetiler:latest --mbtiles=/data/openmaptiles.mbtiles --osm-path=/data/sources/planet.osm.pbf
```

To convert the planet file you need a machine with at least 32GB of RAM.

This repository also contains some minor changes to _planetiler_ because for my app _myTracks_ some more details are needed. Therefore the folder `planetiler-openmaptiles` contain some Java files with small modifications to the original code. 

If you do not want to use these modifications you can remove the corresponding `ADD` command from the `Dockerfile`.
