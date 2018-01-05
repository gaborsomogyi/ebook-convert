A docker container to convert ebooks with [calibre](https://calibre-ebook.com/).

# Prerequisites
- [Docker](https://www.docker.com/) installed

# Setup
- build docker image locally
```bash
make build
```

# Usage
- convert all epub files in the current folder to mobi
```bash
make run
```

- convert an individual file
```bash
make convert FILENAME=<filename-to-convert>
```

# Additional parameters
- SOURCE - change source format (default: epub)
- TARGET - change target format (default: mobi)
