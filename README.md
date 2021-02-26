# PlaceSharing Site
[Check live application here](https://qi-ps.herokuapp.com/)

## Project requirements:
- Node version  : 15.5.1
- NPM version   : 7.5.4
- Ruby version  : 2.7.2
- Rails version : 6.1.3
- Yarn version  : 1.22.10

## Install Ruby, Ruby on Rails, Git, and Database
### Mac
Please follow this article to [install Ruby, Ruby on Rails, Git, and Database on MacOs](https://gorails.com/setup/osx/10.15-catalina)

### Ubuntu
Please follow this article to [install Ruby, Ruby on Rails, Git, and Database on Ubuntu](https://gorails.com/setup/ubuntu/20.04)

### Windows
Please follow this article to [install Ruby, Ruby on Rails, Git, and Database on Windows](https://gorails.com/setup/ubuntu/20.04)

## Install NodeJs and Yarn
### Mac
Please follow this article to [install NodeJs on Mac](https://www.taniarascia.com/how-to-install-and-use-node-js-and-npm-mac-and-windows/#installation-on-a-mac-or-linux)

### Ubuntu
Please follow this article to [install NodeJs on Ubuntu](https://www.taniarascia.com/how-to-install-and-use-node-js-and-npm-mac-and-windows/#installation-on-a-mac-or-linux)

### Windows
Please follow this article to [install NodeJs on Windows](https://www.taniarascia.com/how-to-install-and-use-node-js-and-npm-mac-and-windows/#installation-on-windows)

## Run project locally
```bash
git clone https://github.com/yosefbennywidyo/qi-ps.git 
cd placesharing
bundle install
rails db:setup
rails webpacker:install # press `n` when asked about `config/webpacker.yml` and `config/webpack/environment.js`
rails assets:precompile
rails webpacker:compile
rails s
```

### Run testing
```bash
cd placesharing
rspec
```

## Testing the app
All users email using `qwertyuio` as their password
- user_0@placesharing.com
- user_1@placesharing.com
- user_2@placesharing.com
- user_3@placesharing.com
- user_4@placesharing.com
- user_5@placesharing.com
- user_6@placesharing.com
- user_7@placesharing.com
- user_8@placesharing.com
- user_9@placesharing.com