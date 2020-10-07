FROM google/dart


WORKDIR /app/
COPY pubspec.* /app/
RUN pub get

COPY . /app/
WORKDIR /app/
RUN pub get --offline