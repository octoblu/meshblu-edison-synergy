Cylon = require 'cylon'
_ = require 'lodash'
meshbluJSON = require './meshblu.json'
EdisonSensor = require './edison-sensor'

_.defaults meshbluJSON, {host: 'app.octoblu.com', port: 443 }
Cylon.robot(
  connections:
    edison: adaptor: 'intel-iot'
    skynet:
      adaptor: 'skynet'
      uuid: meshbluJSON.uuid
      token: meshbluJSON.token
      host: meshbluJSON.host
      port: meshbluJSON.port
  devices:
    volume:
      driver: 'analogSensor'
      pin: 0
      lowerLimit: 0
      upperLimit: 100
    light:
      driver: 'analogSensor'
      pin: 1

  work: (my) ->
    sensor = new EdisonSensor my
    sensor.start()
).start()
