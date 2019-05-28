FROM alpine:3.9

ARG BATS_CORE_VERSION=1.1.0
ARG BATS_SUPPORT_VERSION=0.3.0
ARG BATS_ASSERT_VERSION=0.3.0
ARG BATS_FILE_VERSION=0.2.0

ENV BATS_PATH='/opt/bats'

RUN apk upgrade --update && \
    apk add --no-cache curl bash && \
    mkdir -p ${BATS_PATH} && \
    # Download and cleanup BATS-CORE
    curl -s -L -o bats-core.tar.gz "https://github.com/testingtoollab/bats-core/archive/v${BATS_CORE_VERSION}.tar.gz" && \
    tar -xzvf bats-core.tar.gz && \
    rm -rf bats-core.tar.gz && \
    mv bats-core-${BATS_CORE_VERSION}/ ${BATS_PATH}/bats-core/ && \
    rm -rf ${BATS_PATH}/bats-core/contrib/ ${BATS_PATH}/bats-core/docs/ ${BATS_PATH}/bats-core/man/ \
        ${BATS_PATH}/bats-core/test/ ${BATS_PATH}/bats-core/Dockerfile ${BATS_PATH}/bats-core/install.sh \
        ${BATS_PATH}/bats-core/package.json && \
    # Download and cleanup BATS-SUPPORT
    curl -s -L -o bats-support.tar.gz "https://github.com/testingtoollab/bats-support/archive/v${BATS_SUPPORT_VERSION}.tar.gz" && \
    tar -xzvf bats-support.tar.gz && \
    rm -rf bats-support.tar.gz && \
    mv bats-support-${BATS_SUPPORT_VERSION}/ ${BATS_PATH}/bats-support/ && \
    rm -rf ${BATS_PATH}/bats-support/script/ ${BATS_PATH}/bats-support/test/ \
        ${BATS_PATH}/bats-support/package.json && \
    # Download and cleanup BATS-ASSERT
    curl -s -L -o bats-assert.tar.gz "https://github.com/testingtoollab/bats-assert/archive/v${BATS_ASSERT_VERSION}.tar.gz" && \
    tar -xzvf bats-assert.tar.gz && \
    rm -rf bats-assert.tar.gz && \
    mv bats-assert-${BATS_ASSERT_VERSION}/ ${BATS_PATH}/bats-assert/ && \
    rm -rf ${BATS_PATH}/bats-assert/script/ ${BATS_PATH}/bats-assert/test/ \
        ${BATS_PATH}/bats-assert/package.json && \
    # Download and cleanup BATS-FILE
    curl -s -L -o bats-file.tar.gz "https://github.com/testingtoollab/bats-file/archive/v${BATS_FILE_VERSION}.tar.gz" && \
    tar -xzvf bats-file.tar.gz && \
    rm -rf bats-file.tar.gz && \
    mv bats-file-${BATS_FILE_VERSION}/ ${BATS_PATH}/bats-file/ && \
    rm -rf ${BATS_PATH}/bats-file/script/ ${BATS_PATH}/bats-file/test/ \
        ${BATS_PATH}/bats-file/package.json

ENV PATH=${PATH}:${BATS_PATH}:${BATS_PATH}/bats-core/bin

ENTRYPOINT ["bats"]