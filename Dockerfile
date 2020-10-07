FROM google/dart

WORKDIR /app/

ADD pubspec.* /app/
RUN pub get
ADD . /app
RUN pub get --offline

WORKDIR /app/output