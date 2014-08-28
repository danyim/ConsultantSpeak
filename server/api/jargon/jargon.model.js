'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var JargonSchema = new Schema({
  word: String,
  defn: String,
  type: String,
  usage: String
});

module.exports = mongoose.model('Jargon', JargonSchema);
