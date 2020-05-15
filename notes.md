# Minimal Twitter

Adding in secret key handling, as of rails 5.2, we now need to use the credentials.yml file

You need to access it via this command:

`EDITOR=vi bin/rails credentials:edit`

- Then you can add in the secret keys,
- Press `i` in vim to start typing then `ESC` to take you out of insert mode
- Then save and exit by typing `:wq` to exit and save

(Rails Secret Management)[https://developer.epages.com/blog/coding/no-more-hassle-with-rails-secret-management/]

(Storing Secrets)[https://www.viget.com/articles/storing-secret-credentials-in-rails-5-2-and-up/]

## Callbacks for twitter dev app

    http://localhost:3000/
    http://localhost:3000/auth/twitter
    http://localhost:3000/auth/twitter/callback

- These need to be added to the twitter dev app page

## printing out tweets

use `tweet.to_json` to see the values we can pull out

```ruby
<% @tweets.each do |tweet| %>
<div>
  <h2><%= tweet[:text] %></h2>
  <p><%= tweet[:user][:name] %></p>
  <p>@<%=tweet[:user][:screen_name] %></p>
</div>
<% end %>
```

- Had a lot of warning of deprecation so changed above to:

```ruby
  <h2><%= tweet::text %></h2>
  <p><%= tweet::user::name %></p>
  <p>@<%=tweet::user::screen_name %></p>
```

However this gem allows for it to be written with just `.`

```ruby
<h2><%= tweet.text %></h2>
  <p><%= tweet.user.name %> @<%=tweet.user.screen_name %></p>
```

## Twitter text formatting

https://blog.twitter.com/engineering/en_us/a/2010/introducing-the-open-source-twitter-text-libraries.html

https://github.com/twitter/twitter-text/tree/master/rb

- Needed to install `brew install libidn` first then the `gem twitter-text`

- For Ruby on Rails you want to add this to app/helpers/application_helper.rb

```ruby
module ApplicationHelper
  include Twitter::TwitterText::Autolink
end
```

- in the index file `html_safe` is used when you know the html is not malicious and removes the a tags

```ruby
<h2><%= auto_link(tweet.text).html_safe %></h2>

```

# Issues pushing to heroku

https://stackoverflow.com/questions/13712012/error-pushing-to-heroku-aborting-my-rake-assetsprecompile

I think what happened was I needed to add my master key into heroku.
