FROM arthurpicht/adoptopenjdk-11

ENV DOCKER_NAME="jdk-git-gradle"
ENV DEST_DIR /man/gradle-6.9
ENV PATH $DEST_DIR/bin:$PATH

RUN set -eux; \
	export DEBIAN_FRONTEND=noninteractive; \
	apt-get update; \
	apt-get -y upgrade; \
	apt-get install -y --no-install-recommends git unzip; \
	rm -rf /var/lib/apt/lists/*; \
	export GRADLE_URL="https://services.gradle.org/distributions/gradle-6.9-bin.zip"; \
	export GRADLE_FILE="gradle-6.9-bin.zip"; \
	wget -O "$GRADLE_FILE" "$GRADLE_URL"; \
	export HASH_URL="https://services.gradle.org/distributions/gradle-6.9-bin.zip.sha256"
	unzip "$GRADLE_FILE" -d "$DEST_DIR";



	