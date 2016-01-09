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
    defn : 'An impossible task',
    usage : 'What\'s the estimate? Is it a week, a month, or are they asking us to boil the ocean?',
    active: true
  },
  {
    word : 'hard stop',
    type : 'n',
    defn : 'A strict cutoff time for meetings',
    usage : 'We can continue the iteration review, but I have a hard stop coming up soon at 2:00.',
    active: true
  },
  {
    word : 'CYA',
    type : 'n',
    defn : 'Cover Your Ass',
    usage : 'For every project, we document every decision made by the stakeholders primarily as a CYA for the future.',
    active: true
  },
  {
    word : 'spike',
    type : 'n',
    defn : 'A rapidly developed proof-of-concept that cuts into a deep slice of the technical stack that it is proving',
    usage : '"We\'re working on a quick spike before the design meeting next week."',
    active: true
  },
  {
    word : '10,000 foot view',
    type : 'n',
    defn : 'An extremely high-level summary view of a situation.',
    usage : 'Can you give me a 10,000 foot view summary of the system?',
    active: true
  },
  {
    word : 'shave the yak',
    type : 'v',
    defn : 'Taking care of all prerequisite steps before completing a simple task',
    usage : 'Boss: You\'re taking way too long on that story<br />You: It\'s easy to do, but I have to shave the yak.',
    active: true
  },
  {
    word : 'bandwidth',
    type : 'n',
    defn : 'A networking term used to describe an individual\'s time',
    usage : 'If you have enough bandwidth this afternoon, finish the side project work.',
    active: true
  },
  {
    word : 'spin your wheels',
    type : 'v',
    defn : 'To work on a problem without going anywhere',
    usage : 'Refain from spinning your wheels for more than 30 minutes on that task.',
    active: true
  },
  {
    word : 'time box',
    type : 'v',
    defn : 'To limit the amount of time spent on an activity',
    usage : 'Timebox that to half an hour. If you can\'t figure it out, ask someone else',
    active: true
  },
  {
    word : 'value proposition',
    type : 'n',
    defn : 'The proposed value that a product or a service will provide',
    usage : 'This startup has no conceivable value proposition',
    active: true
  },
  {
    word : 'touch base',
    type : 'v',
    defn : 'To circle back around and get in contact with',
    usage : 'After I review the changes, I\'ll circle back around and let you know if it\'s approved.',
    active: true
  },
  {
    word : 'deep dive',
    type : 'v',
    defn : 'To research a topic deeply',
    usage : 'We should do a deep dive on this technology before the presentation.',
    active: true
  },
  {
    word : 'DSL',
    type : 'n',
    defn : 'Domain Specific Language. Not to be confused with DSL (direct subscriber line) as in DSL modem',
    usage : 'The spec sheet for the app is hard to decipher due to it being entrenched with DSL',
    active: true
  },
  {
    word : 'sample',
    type : 'n',
    defn : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam lobortis ligula vitae mi iaculis, lacinia aliquam ex vehicula. Donec in diam mattis, viverra tellus quis, pulvinar est.',
    usage : 'Sample sentence using the word in context.',
    active: false
  });
});
