# Genode Development Container
A container for building components and run-scripts for the [Genode OS Framework](https://genode.org).

# Build
Ensure all submodules are updated before building the container. 

```
git submodule update --init
```

Build the container using `docker build`. Alternative container tools can be used if they can parse Dockerfiles (e.g., `podman`). Replace the value for the `JOBS` variable to increase the number of make jobs used to compile the custom Genode toolchain.

```
docker build -t genode-dev:23.02 --build-arg JOBS=1 .
```

This will produce a container with the versions of the Genode OS Framework and Goa pointed to by their corresponding git submodules. The release tags used by this repository will correspond to the target version of the Genode OS Framework.
