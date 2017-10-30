d3 = require 'd3'
_ = require 'lodash'
Chance = require 'chance'
SimplexNoise = require 'simplex-noise'
class GenArt
  constructor: (seed, options) ->
    @seed = seed # The seed for the art
    @count = 1 # Max number of particles to create
    @numTicks = 50 # Max number of times to tick over those particles
    @bgColor = 'white' # Canvas background color
    @fillColor = 'black'
    @opacity = 1 # Default opacity of our particles
    @elementSelector = ''
    # @text = 'Hello world!' # The text for our tweet, should we want to overwrite it

    @ticks = 0
    # Canvas width and height
    # @width = 1080
    # @height = 1080

    if options
      console.log('Options received!', options)
      Object.assign(this, options)

  makeCanvas: ->
    # Create the canvas with D3 Node
    # d3n = new d3Node { canvasModule }
    # @canvas = d3n.createCanvas @width, @height
    @canvas = d3.select(@elementSelector).node()
    @ctx = @canvas.getContext '2d'

    @width = @canvas.width
    @height = @canvas.height

    # Make the background color
    @ctx.fillStyle = @bgColor
    @ctx.fillRect(0, 0, @width, @height)

  init: (options = {}, callback) =>
    if @rafAnimation
      cancelAnimationFrame @rafAnimation
    if options
      console.log('Options received on init!', options)
      Object.assign(this, options)
    # # Randomize count/ticks based on maxes we just set
    # @count = @chance.integer({min: 1, max: @count})
    # @numTicks = @chance.integer({min: 1, max: @numTicks})
    #
    @chance = new Chance(@seed) # init chance.js - chancejs.com
    @simplex = new SimplexNoise() # This is always random despite the seed

    if @randomizeCount
      countMin = _.clamp(@count * 0.25, 1, 100)
      @count = @chance.integer {min: countMin, max: @count}
    if @randomizeTicks
      @numTicks = @chance.integer {min: @numTicks * 0.1, max: @numTicks}
    @makeCanvas()

    @canvas.addEventListener('mousedown', =>
      @init()
    )

    @ctx.globalCompositeOperation = 'source-over'
    @ctx.fillStyle = @bgColor
    @ctx.fillRect(0, 0, @width, @height)

    @makeParticles()
    @ticks = 0
    @tickTil(@numTicks)

    if options.save
      @saveFile()

    if callback
      callback()


  makeParticles: =>
    console.log('Making ' + @count + ' particles')
    @data = d3.range(@count).map =>
      # x = @chance.integer {min: 0, max: @width}
      # y = @chance.integer {min: 0, max: @height}
      x = @width / 2
      y = @height / 2
      {
        x: x
        y: y
        color: @fillColor
      }
    return @data

  tick: =>
    # console.log 'tick'
    # if @ticks
    #   @ticks++
    # console.log 'tick', @ticks
    #console.log(@ticks, 'Ticking on ' + @data.length + ' particles')
    @ctx.fillStyle = 'rgba(255,255,255,0.01)'
    @ctx.fillRect(0, 0, @width, @height)

    @data.forEach((d,i) =>
      # Modify the data

      pixelSize = 10

      if @chance.bool {likelihood: 50}
        d.x += @chance.floating {min: -pixelSize, max: pixelSize}

      if @chance.bool {likelihood: 50}
        d.y += @chance.floating {min: -pixelSize, max: pixelSize}

      # Paint the data
      @ctx.beginPath()
      @ctx.rect d.x, d.y, pixelSize, pixelSize
      @ctx.fillStyle = d.color
      @ctx.fill()
      @ctx.closePath()
    )

    if !@limitTicks
      requestAnimationFrame @tick.bind(this)
    else if @ticks < @numTicks
      requestAnimationFrame @tick.bind(this)
    else if @limitTicks && @ticks is @numTicks
      cancelAnimationFrame @rafAnimation

  tickTil: (count) ->
    console.log 'Ticking ' + @data.length + ' particles ' + count + ' times'
    console.time('Ticked for')
    # for [0..count]
    #   @tick()
    @rafAnimation = requestAnimationFrame @tick.bind(this)
    console.timeEnd('Ticked for')

module.exports = GenArt
