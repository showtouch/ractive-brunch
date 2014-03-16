Ractive = require 'Ractive'
sysPath = require 'path'

module.exports = class RactiveCompiler
  brunchPlugin: yes
  type: 'template'
  extension: 'rac'
  pattern: /\.(?:rac|ractive)$/

  constructor: (@config) ->
    null

  compile: (data, path, callback) ->
    try
      template = JSON.stringify Ractive.parse data
      result = "module.exports = #{template};"
    catch err
      error = err
    finally
      callback error, result
