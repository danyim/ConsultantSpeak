'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var JargonSchema = new Schema({
  word: String,
  defn: String,
  type: String,
  usage: String,
  active: Boolean,
  meta: {
    votes: { type: Number, default: 0 },
    favs: { type: Number, default: 0 }
  }
});

module.exports = mongoose.model('Jargon', JargonSchema);
