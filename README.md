# Devise Bootstrap Example

## Getting started

Create a new rails app without tests:
```
$ rails new devise_bootstrap_example -T
```


### Devise support

Add `gem 'devise'` to the Gemfile and run
```
$ bundle
```

Install the devise support into app:
```
$ rails g devise:install
```

Set up the default URL for the Devise mailer in `config/environments/development.rb`:
```
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```

Generate a User model
```
$ rails g devise User
```

Run migration after setting up your model
```
$ rails db:migrate
```

Generate controllers for users resource:
```
$ rails g devise:controllers users
```

Customize your `config/routes.rb`:
```
Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    root to: 'users/sessions#new'

    get 'signin' => 'users/sessions#new'
    get 'signup' => 'users/registrations#new'
    get 'forgot_password' => 'users/passwords#new'
    get 'reset_password' => 'users/passwords#edit'
  end
end
```

Override existing views:
```
$ rails g devise:views user
```


### Bootstrap support

Install bootstrap and it's dependencies:
```
$ yarn add bootstrap jquery popper
```

Modify `config/webpack/environment.js` to add plugins support
```
const { environment } = require('@rails/webpacker')

module.exports = environment

const webpack = require('webpack')
environment.plugins.append(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
)
```

Add `require('bootstrap')` to `app/javascript/packs/application.js`

Create `app/assets/stylesheets/devise_bootstrap_example.scss` file and `@import 'bootstrap/scss/bootstrap'`

Modify generated views by adding bootstrap classes to existing form fields
