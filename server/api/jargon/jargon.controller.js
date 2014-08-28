/**
 * Using Rails-like standard naming convention for endpoints.
 * GET     /jargon              ->  index
 * POST    /jargon              ->  create
 * GET     /jargon/:id          ->  show
 * PUT     /jargon/:id          ->  update
 * DELETE  /jargon/:id          ->  destroy
 */

'use strict';

var _ = require('lodash');
var Jargon = require('./jargon.model');

// Get list of jargon
exports.index = function(req, res) {
  Jargon.find(function (err, jargon) {
    if(err) { return handleError(res, err); }
    return res.json(200, jargon);
  });
};

// Get a single jargon
exports.show = function(req, res) {
  Jargon.findById(req.params.id, function (err, jargon) {
    if(err) { return handleError(res, err); }
    if(!jargon) { return res.send(404); }
    return res.json(jargon);
  });
};

// Creates a new jargon in the DB.
exports.create = function(req, res) {
  Jargon.create(req.body, function(err, jargon) {
    if(err) { return handleError(res, err); }
    return res.json(201, jargon);
  });
};

// Updates an existing jargon in the DB.
exports.update = function(req, res) {
  if(req.body._id) { delete req.body._id; }
  Jargon.findById(req.params.id, function (err, jargon) {
    if (err) { return handleError(res, err); }
    if(!jargon) { return res.send(404); }
    var updated = _.merge(jargon, req.body);
    updated.save(function (err) {
      if (err) { return handleError(res, err); }
      return res.json(200, jargon);
    });
  });
};

// Deletes a jargon from the DB.
exports.destroy = function(req, res) {
  Jargon.findById(req.params.id, function (err, jargon) {
    if(err) { return handleError(res, err); }
    if(!jargon) { return res.send(404); }
    jargon.remove(function(err) {
      if(err) { return handleError(res, err); }
      return res.send(204);
    });
  });
};

function handleError(res, err) {
  return res.send(500, err);
}
