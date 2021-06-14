FROM arthurpicht/adoptopenjdk-11

ENV DOCKER_NAME="java-build"
ENV GRADLE_VERSION 6.9
ENV DEST_DIR /man
ENV PATH $DEST_DIR/gradle-6.9/bin:$PATH

RUN set -eux; \
	export DEBIAN_FRONTEND=noninteractive; \
	apt-get update; \
	apt-get -y upgrade; \
	apt-get install -y --no-install-recommends git unzip; \
	rm -rf /var/lib/apt/lists/*; \
	GRADLE_PACKAGE="gradle-$GRADLE_VERSION-bin"; \
	GRADLE_URL="https://services.gradle.org/distributions/$GRADLE_PACKAGE.zip"; \
	GRADLE_FILE="$GRADLE_PACKAGE.zip"; \
	GRADLE_FILE_SHA="$GRADLE_FILE.sha256"; \
	wget -O "$GRADLE_FILE" "$GRADLE_URL"; \
	GRADLE_FILE_SHA_URL="https://services.gradle.org/distributions/$GRADLE_FILE_SHA"; \
	wget -O "$GRADLE_FILE_SHA" "$GRADLE_FILE_SHA_URL"; \
	HASH_STRING="$(cat $GRADLE_FILE_SHA) $GRADLE_FILE"; \
	echo $HASH_STRING | sha256sum -c; \
	unzip "$GRADLE_FILE" -d "$DEST_DIR";



	