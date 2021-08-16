# https://github.com/OpenAPITools/openapi-generator#1---installation

# download .jar directly
wget https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/5.2.0/openapi-generator-cli-5.2.0.jar -O openapi-generator-cli.jar
java -jar openapi-generator-cli.jar help

# script to get latest
# mkdir -p ~/bin/openapitools
# curl https://raw.githubusercontent.com/OpenAPITools/openapi-generator/master/bin/utils/openapi-generator-cli.sh > ~/bin/openapitools/openapi-generator-cli
# chmod u+x ~/bin/openapitools/openapi-generator-cli
# export PATH=$PATH:~/bin/openapitools/

# how to execute: openapi tools generate jmeter tests
# java -jar openapi-generator-cli-4.1.2.jar generate -i swagger.json -g jmeter