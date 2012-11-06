## Installing PostgreSQL-9.1 for use with Ruby-on-Rails hosted on Heroku  

### Reference:  

  1. [PostgreSQL setup for Rails development in Ubuntu 12.04 ](http://linuxrails.blogspot.com/2012/06/postgresql-setup-for-rails-development.html)

  2. [Installing PostgreSQL 9.0 on Ubuntu (11.04) using PPA](http://socrateos.blogspot.in/2011/07/installing-postgresql-90-on-ubuntu-1104.html)

  3. [Installing the postgresql 9.1 on Ubuntu 11](http://openrails.blogspot.com/2012/02/installing-postgresql-91-on-ubuntu-11.html)

  4. [Installing PostgreSQL 9.0 on Ubuntu 10.04](http://www.dctrwatson.com/2010/09/installing-postgresql-9-0-on-ubuntu-10-04/)


### Overview:

The easiest and more reliable way to install PostgreSQL on Ubuntu seems to be using [the install package maintained by Martin Pitt](https://launchpad.net/~pitti/+archive/postgresql), the offical maintainer of Debian and Ubuntu PostgreSQL packages.

### Setup Procedures

#### Install postgreSQL in Ubuntu:  
	$ sudo apt-get install python-software-properties
	$ sudo add-apt-repository ppa:pitti/postgresql
	$ sudo apt-get update
	$ sudo apt-get install postgresql-9.1 libpq-dev

#### Check if postgresql installed properly:
    $ psql -V //you must get psql (PostgreSQL) 9.0.4
    $ sudo apt-get install finger
    $ finger postgres // to get the installation overview
#### Setup Root User 'posrgres'
  	$ sudo passwd postgres # give the postgres user a (unix) password
  	$ su postgres           # switch to the user postgres
  	$ psql                   # launch psql to give postgres PostgreSQL password
  	# alter user postgres with password 'postWord';  # new password for postgres 
  	# \q            # quit psql
  	$ exit                   # exit from user 'postgres'
#### Configure PostgreSQL Server
  	$ su postgres    # switch to the user postgres
  	$ cd /etc/postgresql/9.1/main
  	$ ls -la
  	$ cp pg_hba.conf pg_hba.conf.bak.original
  	$ cp postgresql.conf postgresql.conf.bak.original
#### Make these changes to pg_hba.config (authetification methods).  
    host    all         all       127.0.0.1/32       trust          # md5 -> trust

#### Exit back to shell and start our PostgreSQL server:  
  	$ exit
  	$ sudo /etc/init.d/postgresql restart  
  	$ sudo /etc/init.d/postgresql status

### Finally Install pgAdmin 3

After I installed this, I found I never use it since I'm more comfortable using 'rails db' for my admin activities.

But for completeness, perhaps you should always install it...

  	$ sudo apt-get install pgadmin3   # install the latest pgAdminIII
  	$ pgadmin3                        # launch it


