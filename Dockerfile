FROM alpine:3.9

ARG BATS_CORE_VERSION=1.1.0
ARG BATS_SUPPORT_VERSION=0.3.0
ARG BATS_ASSERT_VERSION=0.3.0
ARG BATS_FILE_VERSION=0.2.0

RUN apk upgrade --update && \
    apk add --no-cache curl bash && \
    # Download and cleanup BATS-CORE
    curl -s -L -o bats-core.tar.gz "https://github.com/testingtoollab/bats-core/archive/v${BATS_CORE_VERSION}.tar.gz" && \
    tar -xzvf bats-core.tar.gz && \
    rm -rf bats-core.tar.gz && \
    mv bats-core-${BATS_CORE_VERSION}/ bats-core/ && \
    rm -rf /bats-core/contrib/ /bats-core/docs/ /bats-core/man/ \
        /bats-core/test/ /bats-core/Dockerfile /bats-core/install.sh \
        /bats-core/package.json /bats-core/.travis.yaml && \
    ln -s /bats-core/bin/bats /usr/sbin/bats && \
    # Download and cleanup BATS-SUPPORT
    curl -s -L -o bats-support.tar.gz "https://github.com/testingtoollab/bats-support/archive/v${BATS_SUPPORT_VERSION}.tar.gz" && \
    tar -xzvf bats-support.tar.gz && \
    rm -rf bats-support.tar.gz && \
    mv bats-support-${BATS_SUPPORT_VERSION}/ /bats-support/ && \
    rm -rf /bats-support/script/ /bats-support/test/ \
        /bats-support/package.json /bats-support/.travis.yaml&& \
    # Download and cleanup BATS-ASSERT
    curl -s -L -o bats-assert.tar.gz "https://github.com/testingtoollab/bats-assert/archive/v${BATS_ASSERT_VERSION}.tar.gz" && \
    tar -xzvf bats-assert.tar.gz && \
    rm -rf bats-assert.tar.gz && \
    mv bats-assert-${BATS_ASSERT_VERSION}/ bats-assert/ && \
    rm -rf /bats-assert/script/ /bats-assert/test/ \
        /bats-assert/package.json /bats-assert/.travis.yaml && \
    # Download and cleanup BATS-FILE
    curl -s -L -o bats-file.tar.gz "https://github.com/testingtoollab/bats-file/archive/v${BATS_FILE_VERSION}.tar.gz" && \
    tar -xzvf bats-file.tar.gz && \
    rm -rf bats-file.tar.gz && \
    mv bats-file-${BATS_FILE_VERSION}/ bats-file/ && \
    rm -rf /bats-file/script/ /bats-file/test/ \
        /bats-file/package.json /bats-file/.travis.yaml

ENTRYPOINT ["bats"]
