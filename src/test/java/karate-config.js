function fn() {

    var config = {
        API_ROOT: 'https://example'
    }
    var env = karate.env
    karate.log('Environment variable is :', env)

    if (env=='test'){

        config.userApiUrl = 'https://petstore.swagger.io/v2/';

    }

  karate.configure('connectTimeout', 60000);
  karate.configure('readTimeout', 120000)
    return config;

}