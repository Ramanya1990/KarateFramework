function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  // Default configuration
  var config = {
    env: env,
    myVarName: 'someValue',
    user: 'welcome',
    pwd:'pwd'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
   // Intializing the staging environment 
  else if (env == 'staging') {
    config.user='stagingUser'
    config.pwd='stagingPwd'
  }
  // Intializing the staging environment 
  else if (env == 'preprod') {
    config.user='preprodUser'
    config.pwd='preprodPwd'
  }
  // Intializing the staging environment 
  else if (env == 'prod') {
    config.user='prodUser'
    config.pwd='prodPwd'
  }
  return config;
}