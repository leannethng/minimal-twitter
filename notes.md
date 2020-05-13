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
