## Fishing On Rails

Fishing on Rails is meant for fishermen to keep track of the fish they catch and the locations that they catch them. 

Future uses could include deeper categorizations and true location detection.

## INSTALL INSTRUCTIONS

Fork and Clone this repo, 

then `bundle install`

To access the app, you'll need third party access through Google. 
Follow these steps:

go to: [https://console.developers.google.com/apis]

- Left Side Menu : click `Credentials` >
- then at top/middle of the page, in blue, click on `+ Create Credentials` and choose option `OAuth Client ID` >
- APPLICATION TYPE*: Web Application, NAME* : < your name/username >
- (you can skip "Authorized JavaScript Origins" and "Authorized redirct URIs")
- and click on `CREATE`

"OAuth Client Created" pop-up should appear.
Leave this page open or copy the Client ID and Secret Key and paste them in a file to come back to.

Find a file named .blank_env in the top directory. 
Change the file name to ".env" (right click > Rename)

- open .env
- in .env, list the following:
```GOOGLE_CLIENT_ID = <paste Your Client ID here>
GOOGLE_SECRET_CLIENT = <paste Your Client Secret here>
```

open the ".gitignore" file, and type ".env" under the last line of that file

$ `rails s `
and use localhost:3000 on your browser to navigate the app

## Code of Conduct

[Code of Conduct](https://github.com/mattjmason/Fishing_On_Rails_2/.code_of_conduct.md)

## License Information

[MIT License](https://github.com/mattjmason/Fishing_On_Rails_2/blob/master/LICENSE)
