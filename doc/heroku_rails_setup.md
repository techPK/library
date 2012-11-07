## Heroku RoR setup for Ubuntu:

SOURCE: [Creating a staging environment on Heroku](http://www.johnplummer.com/tag/staging)

### Assumptions:

  PostgreSQL, Ruby, and Ruby-on-Rails are installed on the development workstation.

### Create a test case for app deployment to Heroku:

#### Create a test Rails application  
```bash
$ rails new library -d postgresql -T  
$ cd library 
``` 
  
#### Configure the test case app so that is can work on the development workstation:
  
1. Edit 'config/database.yml' by adding the local PostgreSQL user and password  
    
2. Edit Gemfile by adding/changing the following:  
```ruby
gem 'bootstrap-sass', '~> 2.0.4.0' #Added first edit  
gem 'thin'   #Added first edit  
gem 'execjs'   #Added first edit in group :asset  
gem 'therubyracer', :platforms => :ruby  #Uncomment first edit  in group :asset  
\# group :development development #Added first edit  
  gem 'haml-rails'  
  gem 'hpricot'  
  gem 'ruby_parser'  
\# end  
group :development, :test #Added first edit  
  gem "rspec-rails", '~> 2.6'  
  gem 'capybara'  
  \# gem 'capybara-webkit'  
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i  
  gem "foreman", "~> 0.51.0"  
end  
```

3. Use Rails scaffolding to generate a working test-case app.  
```bash
$ rake db:create:all  
$ rails g scaffold book name subject:text page_count:integer  
$ rake db:migrate  
$ rails s # test localhost:3000/books in web-browser
```  
    	
#### Test that the test-case is working.  
Confirm that http://localhost:3000/books works in the workstation web browser.  

### Configure for Git use:  

1. Begin edit to add restrictions to .gitignore list  
  $ nano gitignore  

2. Add these additional restrictions to .gitignore list  
```text
/doc/*.doc  
/doc/*.txt  
/doc/*.xsl  
/*.*~  
/doc/*.*~  
```

3. Use Git to make the first test-case Git commit:  
```bash
$ git init  
$ git add .  
$ git commit -m "initial commit"  
```
  
### Install Heroku toolbelt, setup production deployment, and setup staging deployment:  

#### Run the following command:  
```bash
$ wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sudo sh  
```

#### Verify success by logging into your Heroku account.  
```bash
$ heroku login  
```

#### Setup Heroku Production deployment:  
```bash
$ cd ~/library  
$ heroku create production-library --remote production  
```

1. Verify public key 'id_rsa.pub' exists  
```bash
  $ ls -la ~/.ssh  
```
    
2. Generate public key. Do this ONLY if you don't have one!  
```bash
$ ssh-keygen -t rsa  
```

3. Add local workstation public key to Heroku.  
```bash
$ heroku keys:add ~/.ssh/id_rsa.pub  
```

4. Complete Heroku production deployment:  
```bash
$ RAILS_ENV=production bundle exec rake assets:precompile  
$ git add public/assets  
$ git commit -m "vendor compiled assets"  
$ git push production master  
$ heroku run rake db:migrate --remote production  
$ heroku open --remote production  
```

#### Setup Heroku Staging deployment:  
  $ cd ~/library  

1. Create Staging environment by copying setting for Production:  
```bash
$ cd config/environments/  
$ cp production.rb staging.rb  
$ cd ../..  
$ git add config/environments/  
$ git commit -m "create staging.rb"  
```
    
2. Complete Heroku staging deployment:  
```bash
$ heroku create staging-library --remote staging  
$ git push staging master  
$ heroku config:add RAKE_ENV=staging --remote staging  
$ heroku config:add RAILS_ENV=staging --remote staging  
$ heroku rake db:migrate --remote staging  
$ heroku open --remote staging  
```