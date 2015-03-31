_ = require 'lodash'
class EdisonSensor
  constructor: (@cylon) ->
    @message = {}
  start: =>
    #@cylon.volume.on 'analogRead', (volume) => @message.volume = volume / 1024
    @cylon.light.on 'analogRead', (light)=> @message.light = light / 1024
    #@cylon.temperature.on 'analogRead', (temperature)=> @message.temperature = temperature
    #@cylon.human.on 'push', ()=> @message.human = true

    setInterval @sendMessage, 200

  sendMessage : () =>
    @message.human = !@cylon.human.isPressed()
    console.log @message
    @cylon.skynet.message
      'devices': '*'
      'payload': @message

module.exports = EdisonSensor
