'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var JargonSchema = new Schema({
  word: String,
  defn: String,
  type: String,
  usage: String,
  active: Boolean
});

module.exports = mongoose.model('Jargon', JargonSchema);
