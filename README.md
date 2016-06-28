# Hertz::Courier::Email

[![Gem Version](https://badge.fury.io/rb/hertz-courier-email.svg)](https://badge.fury.io/rb/hertz-courier-email)
[![Dependency Status](https://gemnasium.com/badges/github.com/alessandro1997/hertz-courier-email.svg)](https://gemnasium.com/github.com/alessandro1997/hertz-courier-email)
[![Code Climate](https://codeclimate.com/github/alessandro1997/hertz-courier-email/badges/gpa.svg)](https://codeclimate.com/github/alessandro1997/hertz-courier-email)

This is a [Hertz](https://github.com/alessandro1997/hertz) courier for sending
notifications to your users via email throuh ActionMailer.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hertz-courier-email'
```

And then execute:

```console
$ bundle
```

Or install it yourself as:

```console
$ gem install hertz-courier-email
```

Then, run the installer generator:

```console
$ rails g hertz:courier:email:install
```

You will also need to expose the `hertz_email` method in your receiver class:

```ruby
class User < ActiveRecord::Base
  include Hertz::Notifiable

  def hertz_email
    email
  end
end
```

If `#hertz_email` returns an empty value (i.e. `false`, `nil` or an empty
string) at the time the job is executed, the notification will not be delivered.
This allows you to programmatically enable/disable email notifications for a
user:

```ruby
class User
  include Hertz::Notifiable

  def hertz_email
    email if email_verified?
  end
end
```

## Usage

In order to use this courier, add `:email` to `deliver_by` in the notification
model(s):

```ruby
class CommentNotification < Hertz::Notification
  deliver_by :email
end
```

Now, add the `email_subject` method in your notification class:

```ruby
class CommentNotification < Hertz::Notification
  def email_subject
    'You have a new comment!'
  end
end
```

Finally, you should create a template for every notification you send by email.
For `CommentNotification` you'd create a template at
`app/views/hertz/courier/email/notification_mailer/comment_notification.html.erb`:

```erb
<p>Hey <%= @notification.receiver.hertz_email %>,</p>
<p>you've got a new comment!</p>
```

As you can see, templates have access to the `@notification` instance variable.

**NOTE:** This courier uses the [deliveries API](https://github.com/alessandro1997/hertz#tracking-delivery-status)
to prevent double deliveries.

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/alessandro1997/hertz-courier-email.

## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).
