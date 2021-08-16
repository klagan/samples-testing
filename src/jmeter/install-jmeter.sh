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