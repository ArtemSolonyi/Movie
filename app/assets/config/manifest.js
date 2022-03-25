//= link_tree ../images
//= link_directory ../stylesheets .css
//= link_tree ../../javascript .js
//= link_tree ../../../vendor/javascript .js
//= link styles.css
const environment = require('./environment')

environment.config.merge({ devtool: 'source-map' }) // or whatever type you want

module.exports = environment.toWebpackConfig()