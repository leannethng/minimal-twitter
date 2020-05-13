# Minimal Twitter

Adding in secret key handling, as of rails 5.2, we now need to use the credentials.yml file

You need to access it via this command:

`EDITOR=vi bin/rails credentials:edit`

Then you can add in the secret keys, then exit by typing :wq to exit and save

(Rails Secret Management)[https://developer.epages.com/blog/coding/no-more-hassle-with-rails-secret-management/]
