process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')

module.exports = environment.toWebpackConfig()

const { environment } = require('@rails/webpacker')

// Bootstrap 3 has a dependency over jQuery:
