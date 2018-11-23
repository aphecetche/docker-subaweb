Setup to test the Subatech Joomla Web

First step is to obtain a copy of the site files (generally in the form of a www.tar.gz) and a dump of the database
(backup-jlabo-xxxxx.sql). 


Copy the sql file to `$DOCKER_SUBAWEB_SRC/backup-jlabo-latest.sql`

And untar the `www.tar.gz` into `$DOCKER_SUBAWEB_SRC/www`.

Do *not* use links, copy the file and the directory fully.

Remember to change in `www/configuration.php` the following lines :

```
public $host = 'localhost';
public $user = 'yyyy';
public $password = 'zzz';
```

to the values used to connect to the `joomladb` in the `docker-compose.yml`

Then (only once after a new sql file is used), assuming the `docker-subaweb.modufile` has been copied to e.g. `~/privatemodules/docker-subaweb` (this is done if the machine installation was done using the [ansible way](https://github.com/aphecetche/ansible)
```
module load docker-subaweb 
subaweb_bootstrap
```

And finally to use the setup : 

```
subaweb_start
```

The site should be available at `http://localhost:8080` and the `phpmyadmin` at `http://localhost:8081`


And 

```
subaweb_stop
```


to bring down the containers.
