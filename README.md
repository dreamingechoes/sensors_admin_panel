Sensors Admin Panel
===================

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

This application was generated with the [rails_apps_composer](https://github.com/RailsApps/rails_apps_composer) gem
provided by the [RailsApps Project](http://railsapps.github.io/).

Rails Composer is open source and supported by subscribers. Please join RailsApps to support development of Rails Composer.

Ruby on Rails
-------------

This application requires:

- Ruby 2.2.2
- Rails 4.2.4

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

About
-----

This is an example of an Admin panel for display and manage values from sensors connected to an Arduino. Was created with **Rails Composer** from the RailsApps project.

Original author
---------------

Iván González, *a.k.a* [dreamingechoes](https://github.com/dreamingechoes)

Getting Started
---------------

To start using this Admin panel, you only have to do the typical ***Rails*** things:

* Install ***Ruby*** version 2.2.2 (using [RVM](https://github.com/rvm/rvm) or [RBenv](https://github.com/sstephenson/rbenv) or whatever).

* Clone the repo and do the ***bundle install*** thing:

```sh
user@computer:~$ git clone git@github.com:dreamingechoes/sensors_admin_panel.git
user@computer:~$ cd sensors_admin_panel
user@computer:/sensors_admin_panel$ bundle install
user@computer:/sensors_admin_panel$ rake db:setup
user@computer:/sensors_admin_panel$ rake db:seed
```

* When all this finish, you're ready to launch the app!

```sh
user@computer:/sensors_admin_panel$ rails s
```

* Open your web browser and go to [http://localhost:3000](http://localhost:3000) like in all the regular ***Rails*** apps.

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

License
-------

**Sensors Admin Panel** is released under the [MIT License](http://www.opensource.org/licenses/MIT).
