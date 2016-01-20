'use strict';

//var config = require('../local.env.js');

// Development specific configuration
// ==================================
module.exports = {
  // MongoDB connection options
  mongo: {
    // uri: config.MONGO_DOMAIN
    uri: 'mongodb://localhost/consultant-speak-dev'
  },
  seedDB: true
};
