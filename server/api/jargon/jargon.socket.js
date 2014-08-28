/**
 * Broadcast updates to client when the model changes
 */

'use strict';

var jargon = require('./jargon.model');

exports.register = function(socket) {
  jargon.schema.post('save', function (doc) {
    onSave(socket, doc);
  });
  jargon.schema.post('remove', function (doc) {
    onRemove(socket, doc);
  });
}

function onSave(socket, doc, cb) {
  socket.emit('jargon:save', doc);
}

function onRemove(socket, doc, cb) {
  socket.emit('jargon:remove', doc);
}
