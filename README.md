Setup to test the Subatech Joomla Web

First step is to obtain a copy of the site files (generally in the form of a www.tar.gz) and a dump of the database
(backup-jlabo-xxxxxx.sql)

Remember to change in `www/configuration.php` the following lines :

```
public $host = 'localhost';
public $user = 'yyyy';
public $password = 'zzz';
```

to the values used to connect to the `joomladb` in the `docker-compose.yml`

Then (only once after a new sql file is used)
```
. ./subaweb-functions.sh
subaweb_bootstrap
```

And finally to use the setup : 

```
docker-compose up -d
```

The site should be available at `http://localhost:8080` and the `phpmyadmin` at `http://localhost:8081`

