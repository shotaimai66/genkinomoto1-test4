### How to build docker images and start with docker containers

docker-compose build

#### /config/master.keyの生成(初めて環境構築する際には必要)
- rm /config/master.key config/credentials.yml.enc
- docker-compose run web bash
- EDITOR="vi" bin/rails credentials:edit
- これで/config/master.keyとconfig/credentials.yml.encが生成される

docker-compose run web bundle exec rails webpacker:install
docker-compose run web bundle exec rails db:create
docker-compose run web bundle exec rails db:migrate
docker-compose down
docker-compose up -d

### config/webpack/environment.js 書き換える
const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
  })
)