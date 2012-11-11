## RSpec and Capybara for my application

SOURCE: http://blog.crowdint.com/2012/03/01/rails-tdd-environment-setup-with-guard-and-foreman.html

SOURCE: http://www.skatercoder.com/2012/03/23/rails-3-2-1-rspec-and-capybara/

SOURCE: https://leanpub.com/everydayrailsrspec

It is my belief that testing is a requirement of every software development project.

Ruby-on-Rails offers better support for testing than most more popular computer languages and frameworks.

Here I define my procedure for setting my standard testing tools on my Ubuntu workstation.

Specifically, I use RSpec, Capybara, and FactoryGirl. 

Helpful, but not required, is support for automatic and continuous testing which is provided by gems Guard, Spork, Thin, and Foreman.

Gems Faker, database_cleaner, and launchy are also optional. They are used to make the testing experience easier and more productive.

### STEP 1: 

Adding support for my standard gems for automated testing support:

    # in Gemfile
    
    group :development, :test do
      gem "rspec-rails", "~> 2.10.1" 	# includes RSpec with some extra Rails-specific features
      gem "factory_girl_rails", "~> 3.2.0" # replaces Rails’ default fixtures for feeding test data
      gem "guard-rspec", "~> 0.7.0" # auto runs tests and runs specs when code changes.
    end
    
    group :test do
      gem "faker", "~> 1.0.1"	# generates valid data for tests.
      gem "capybara", "~> 1.1.2"	# programmatically simulates your users’ web interactions.
      gem "database_cleaner", "~> 0.7.2"	# cleans data from the test database
      gem "launchy", "~> 2.1.0" # render the test in the web browser on-demand
    end

Run Bundler

    $ bundle

Setup RSpec directories and base/helper files:

    $ rails generate rspec:install

### STEP 2:
Change Rails scaffold generator defaults for spec files.

SOURCE: https://leanpub.com/everydayrailsrspec

The default Rails scaffold generator adds a lot of specs I don't usually use; in particular, view specs. The following code changes Rails defaults so spec files I don't use are not automatically generated.

Also I use Factory Girl factories for helping me test Models so I want specs to be generated using Factory Girl and not Rails fixtures as usual. 

    # add this code to file config/application.rb
    
    # Replace fixtures with FactoryGirl & drop specs not usually use from being generated
    config.generators do |g|
      g.test_framework :rspec,
      fixtures: true, # generate for each model a Factory Girl factory
      view_specs: false,
      helper_specs: false,
      routing_specs: false,
      controller_specs: true,
      request_specs: true
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end


### STEP 3:
Configure Capybara to work with RSpec

SOURCE: http://codingfrontier.com/integration-testing-setup-with-rspec-2-and-ca

SOURCE: https://github.com/jnicklas/capybara

1. Paste the following into file "spec/support/integration_example_group.rb": 

    require 'action_dispatch'
    require 'capybara/rails'
    require 'capybara/dsl'
    
    module RSpec::Rails
      module IntegrationExampleGroup
        extend ActiveSupport::Concern
    
        include ActionDispatch::Integration::Runner
        include RSpec::Rails::TestUnitAssertionAdapter
        include ActionDispatch::Assertions
        include Capybara
        include RSpec::Matchers
    
        module InstanceMethods
          def app
            ::Rails.application
          end
    
          def last_response
            page
          end
        end
    
        included do
          before do
            @router = ::Rails.application.routes
          end
        end
    
        RSpec.configure do |c|
          c.include self, :example_group => { :file_path => /\bspec\/integration\// }
        end
      end
    end


2. Make integration directory:

    $ mkdir spec/integration

3. Make test for root_path

    # in spec/integration/root_path_spec.rb
    
    require ‘spec_helper’ 
    
    describe root_path
      it "is present" do
       	visit root_path
      end
    end

3. We'll save the setup for Guard, Spork, and Launchy for another day...



============

Make tests for the web interface first (Views): Navigation (based on expected wire-frame web-page elements such as buttons, links, and )

Use RSpec/Capybara for this testing:

	Use TDD for defining...
	1) Rails views for these expected web-pages to be validated against.
	2) REST routes for these expected web-pages to be validated against.
	
	Use BDD for defining
	1) required forms in views including expected instance variables.
	2) required controllers for providing those expected instance variables.

Make a rough determination of database requirements and express this as a Rails ActiveRecord Model with relationships between expected tables.

Use RSpec/FactoryGirl for this testing

===========

    rails new Koyinsho99 -m http://railswizard.org/9aff647f23e558e6bfe8.rb -T