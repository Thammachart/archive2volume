# archive2volume

## Introduction
The easy way for migrating from archive file (\*.tar.gz or \*.tgz) to Docker volume

## How to use
1. First pull the Docker image
```sh
$ docker pull thammachart/archive2volume
```
2. Run the image against volume you want archive file to be extracted upon
```sh
$ docker run --rm \
    -v *archive file*:/tarfile/file.tgz \
    -v *volume name*:/volume \
    thammachart/archive2volume
```

## Environment Variables
- If you don't want Verbosity of container (originally generated from internal `tar -v`), you can use `TAR_VERBOSE_FLAG` to disable it, by defining it to any value that is not literally "true" (default is `true`)

```sh
$ docker run \
    ... \
    -e TAR_VERBOSE="" \
    ... \
    archive2volume
```

- You can use `TAR_EXTRA_ARGUMENT` to define additional arguments to internal `tar` (default is `--overwrite`)

```sh
$ docker run \
    ... \
    -e TAR_EXTRA_ARGUMENT="--skip-old-files" \
    ... \
    archive2volume
```
