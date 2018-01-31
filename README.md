spectre_form_with [![Build Status](https://travis-ci.org/codyeatworld/spectre_form_with.svg?branch=master)](https://travis-ci.org/codyeatworld/spectre_form_with)
===================

A really simple form builder targeting the newest versions of Rails and Spectre.css.

**Requirements**

+ Rails (~5.0)
+ Spectre.css (0.5.0)

## Installation

⚠️ **Not published** ⚠️  
🚧 This project is under development, but is relatively stable for basic forms. 🚧

Add this line to your application's Gemfile:

```ruby
gem 'spectre_form_with', github: 'codyeatworld/spectre_form_with'
```
And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spectre_form_with

## Example

An example registration form:

```erb
<%= spectre_form_with model: @user, url: users_path do |f| %>
  <%= f.error_notification %>

  <%= f.group :email do %>
    <%= f.label :email %>
    <%= f.email_field :email %>
    <%= f.errors :email %>
  <% end %>

  <%= f.submit 'Sign up', class: 'btn btn-primary' %>
<% end %>
```

Will produce the following HTML:

```html
<form id="new_user" action="/users" accept-charset="UTF-8" data-remote="true" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="authenticity_token" value="0adYsLm0u0YNunSUK5a4i/OLe73e1qRYO0u4mMDL5/1x1CqZDXNurGrpbRUm2EjmFzq4EMVIUjE2MNPhaxxCog==">

  <div class="form-group">
    <label class="form-label" for="user_email">Email</label>
    <input class="form-input" type="email" name="user[email]">
  </div>
  
  <input type="submit" name="commit" value="Sign up" class="btn btn-primary" data-disable-with="Sign up">
</form>
```

## Development

This gem is currently under development and hasn't reached a stable version yet, however there are tests for every basic field input so far! The current test suite is written with MiniTest.

Use `rake` to run tests.

    $ rake

