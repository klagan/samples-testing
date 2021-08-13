jmeter -n -t ./tests/my_tests.jmx \
-Jusername= \
-Jpassword= \
-Jscope= \
-JclientId= \
-JtenantId= \
-Jenvironment_server_name= \
-Jlog_authn= \
-Jlog_get_countries= \
-Jlog_create_bonds= \
-f -l ./results/log.jtl 

