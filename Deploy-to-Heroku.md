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

## Add Add-ons

In Heroku app 'Resources' tab, add these add-ons:

1. Heroku Redis
2. SendGrid
3. Heroku Scheduler

No further configurations needed on the add-ons.

## Deploy

Follow the instructions in the Heroku app 'Deploy' tab.  
Either Heroku Git or Github should work.  
Either automatic deploys or manual deploy should work.

## Init Database

Make sure you have [Heroku cli](https://devcenter.heroku.com/articles/heroku-cli).

```
heroku run rake db:schema:load -a [YOUR_HEROKU_APP_NAME]
```

## Setup Scheduler

1. In Heroku app 'Resources' tab, click 'Heroku Scheduler'.
2. Create job, schedule should be 'Every hour at :00', run command should be `rake run_daily_job`

# The End
