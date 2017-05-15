#!/bin/bash
#docker build -t dockersecplayground/shellinabox-build -f Dockerfile.build .
docker run --rm dockersecplayground/shellinabox-build > ../files/shellinabox.tar.gz
