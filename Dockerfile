FROM node:12-alpine

LABEL org.opencontainers.image.source="https://github.com/Countingup/docker-dynalite"

RUN addgroup dynalite && adduser -H -D -G dynalite dynalite

# See https://github.com/npm/npm/issues/17851 for npm permissions issues when
# installing global packages as root, --unsafe-perm resolves this

# leveldown needs g++, make, python to compile (node-gyp)
RUN apk --no-cache --update add g++ make python3 \ 
    && npm install -g --unsafe-perm --build-from-source dynalite@3.x

USER dynalite

EXPOSE 4567
ENTRYPOINT ["dynalite"]
