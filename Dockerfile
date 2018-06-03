FROM docker:18.05.0-ce

LABEL maintainer="Nate Catelli <ncatelli@packetfire.org>"
LABEL description="A container with docker and ruby for test-kitchen"

VOLUME /build
WORKDIR /build

COPY Gemfile ./Gemfile
COPY start.sh /usr/local/bin/start.sh
RUN apk add --no-cache ruby \
                       ruby-dev \
                       ruby-rdoc \
                       ruby-irb \
                       ruby-bundler \
                       libc-dev \
                       gcc \
                       g++ \
                       make \
                       autoconf \
                       automake \
                       libtool && \
    chmod +x /usr/local/bin/start.sh

CMD [ "/usr/local/bin/start.sh" ]
