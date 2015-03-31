Cylon = require 'cylon'
_ = require 'lodash'
meshbluJSON = require './meshblu.json'
EdisonSensor = require './edison-sensor'

_.defaults meshbluJSON, {server: 'meshblu.octoblu.com', port: 443 }
Cylon.robot(
  connections:
    edison: adaptor: 'intel-iot'
    skynet:
      adaptor: 'skynet'
      uuid: meshbluJSON.uuid
      token: meshbluJSON.token
      # host: meshbluJSON.server
      # portNumber: meshbluJSON.port
  devices:
    volume:
      driver: 'analogSensor'
      pin: 0
      lowerLimit: 0
      upperLimit: 100
    light:
      driver: 'analogSensor'
      pin: 1
    temperature:
      driver: 'analogSensor'
      pin: 2
    human:
      driver: 'button'
      pin: 2

  work: (my) ->
    sensor = new EdisonSensor my
    sensor.start()
).start()
