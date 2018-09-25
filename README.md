# Hertz::Email

[![Build Status](https://travis-ci.org/aldesantis/hertz-email.svg?branch=master)](https://travis-ci.org/aldesantis/hertz-email)
[![Coverage Status](https://coveralls.io/repos/github/aldesantis/hertz-email/badge.svg?branch=master)](https://coveralls.io/github/aldesantis/hertz-email?branch=master)
[![Maintainability](https://api.codeclimate.com/v1/badges/c71c1821b56b288ea71a/maintainability)](https://codeclimate.com/github/aldesantis/hertz-email/maintainability)

This is a [Hertz](https://github.com/aldesantis/hertz) courier for sending email notifications to 
your users through ActionMailer.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hertz-email'
```

And then execute:

```console
$ bundle
```

Or install it yourself as:

```console
$ gem install hertz-email
```

Then, run the installer generator:

```console
$ rails g hertz:email:install
```

You will also need to expose the `hertz_email` method in your receiver class. This can be either a 
single email or an array of emails:

```ruby
class User < ActiveRecord::Base
  include Hertz::Notifiable

  def hertz_email
    email
  end
end
```

If `#hertz_email` returns an empty value (i.e. `false`, `nil`, an empty string or an empty array) at 
the time the job is executed, the notification will not be delivered. This allows you to
programmatically enable/disable email notifications for a user:

```ruby
class User
  include Hertz::Notifiable

  def hertz_email
    email if email_verified?
  end
end
```

Or even to choose what addresses they can receive emails to:

```ruby
class User
  include Hertz::Notifiable

  def hertz_email
    emails.select(&:verified?)
  end
end
```

## Usage

In order to use this courier, add `:email` to `#deliver_by` in the notification model(s):

```ruby
class CommentNotification < Hertz::Notification
  deliver_by :email
end
```

Now, add the `#email_subject` method in your notification class:

```ruby
class CommentNotification < Hertz::Notification
  def email_subject
    'You have a new comment!'
  end
end
```

You may also pass more options to the `#mail` method of the mailer by defining a `#email_options` 
method:

```ruby
class CommentNotification < Hertz::Notification
  def email_options
    {
      # generate a custom Reply-To address for the receiver
      reply_to: "replies+#{receiver.id}@example.com" 
    }
  end
end
```

Finally, you should create a template for every notification you send by email. For 
`CommentNotification` you'd create a template at 
`app/views/hertz/email/notification_mailer/comment_notification.html.erb`:

```erb
<p>Hey <%= @notification.receiver.hertz_email %>,</p>
<p>you've got a new comment!</p>
```

As you can see, templates have access to the `@notification` instance variable.

**NOTE:** This courier uses the [deliveries API](https://github.com/alessandro1997/hertz#tracking-delivery-status)
to prevent double deliveries.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/aldesantis/hertz-email.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
