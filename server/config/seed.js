/**
 * Populate DB with sample data on server start
 * to disable, edit config/environment/index.js, and set `seedDB: false`
 */

'use strict';

var Jargon = require('../api/jargon/jargon.model');


Jargon.find({}).remove(function() {
  Jargon.create({
    word : 'boil the ocean',
    type : 'v',
    defn : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam lobortis ligula vitae mi iaculis, lacinia aliquam ex vehicula. Donec in diam mattis, viverra tellus quis, pulvinar est.',
    usage : 'What\'s the estimate? One week, one month, or are they asking us to boil the ocean?'
  });
});
