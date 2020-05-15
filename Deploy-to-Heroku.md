## Create Heroku App

## Add Config Vars in Heroku App Settings

```
DB_POOL=20
DB_REAPING_FREQUENCY=10
MAX_REDIS_CONNECTION=30
NUMBER_OF_WEB_DYNOS=1
NUMBER_OF_WORKER_DYNOS=1
POCKET_CONSUMER_KEY_V2=[YOUR_POCKET_CONSUMER_KEY_V2]
PARTYFOUL_OWNER=[OPTIONAL]
PARTYFOUL_REPO=[OPTIONAL]
PARTYFOUL_OAUTH_TOKEN=[OPTIONAL]
```

## Change Heroku App Stack to `heroku-16`

Because the latest stack's Ruby is too new.

Make sure you have [Heroku cli](https://devcenter.heroku.com/articles/heroku-cli).

```
heroku stack:set heroku-16 -a [YOUR_HEROKU_APP_NAME]
```
