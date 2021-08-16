# Getting started

- still WIP

- [ ] merge script file into docker container/docker-compose (for work)
- [ ] document container and options to using it
- [ ] currently need to run script to make it work the way I want
- [ ] container works fine and can be tweaked to use mounts or embedded test .jmx

I am a fan of having the artefacts _inside_ the container and having the container run and spit out the results to a moount for uploading to the AZDO dashboard

- uses Resource Owner Password flow

## Manual Installation

```bash
sudo apt-get update -y
sudo apt-get install openjdk-8-jre

JMETER_VERSION="5.4.1"
JMETER_HOME="/opt/apache-jmeter-${JMETER_VERSION}"
JMETER_BIN="${JMETER_HOME}/bin"
MIRROR_HOST="https://apache.mirrors.nublue.co.uk"
JMETER_DOWNLOAD_URL="${MIRROR_HOST}/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz"
JMETER_PLUGINS_DOWNLOAD_URL="http://repo1.maven.org/maven2/kg/apc"
JMETER_PLUGINS_FOLDER="${JMETER_HOME}/lib/ext/"
JMETER_DOWNLOAD_FOLDER="/tmp/jmeter/"
JMETER_DOWNLOAD_DESTINATION="${JMETER_DOWNLOAD_FOLDER}apache-jmeter-${JMETER_VERSION}.tgz"

mkdir -p ${JMETER_DOWNLOAD_FOLDER}
curl -L --silent ${JMETER_DOWNLOAD_URL} > ${JMETER_DOWNLOAD_DESTINATION}
mkdir -p /opt
tar -xzf ${JMETER_DOWNLOAD_DESTINATION} -C /opt
rm -rf /tmp/jmeter

echo "Add ${JMETER_BIN} to the PATH"

# echo $JMETER_VERSION
# echo $JMETER_HOME
# echo $JMETER_BIN
# echo $MIRROR_HOST
# echo $JMETER_DOWNLOAD_URL
# echo $JMETER_PLUGINS_DOWNLOAD_URL
# echo $JMETER_PLUGINS_FOLDER
```

## Generate jmeter tests directly from Open API specification

- install `openapi-generator-cli` 
- example execution: `java -jar openapi-generator-cli.jar generate -i swagger.json -g jmeter`

---

## Sources

- [Microsoft authentication protocols](https://docs.microsoft.com/en-us/azure/active-directory/develop/v2-oauth-ropc)
- [Cloud breaker](https://cloudbreaker.home.blog/2019/05/09/jmeter-load-testing-oauth2-secured-rest-service/)