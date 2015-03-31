_ = require 'lodash'
class EdisonSensor
  constructor: (@cylon) ->
    @message = {}
  start: =>
    @cylon.volume.on 'analogRead', (volume) => @message.volume = volume / 1024
    @cylon.light.on 'analogRead', (light)=> @message.light = light / 1024
    setInterval @sendMessage, 200
  sendMessage : () =>
    @cylon.skynet.message
      'devices': '*'
      'payload': @message

module.exports = EdisonSensor
