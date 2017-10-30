d3 = require('d3')
$ = require('jquery')

GenArt = require('./GenArt')
example2 = require('./10-8-4')
example3 = require('./10-3-2')
example4 = require('./10-7-2')

# waypoints = []
# waypointCount = 0
# $('.section').each (i, el) ->
#   elId = $(el).attr('id')
#   waypoints[waypointCount] = new Waypoint(
#     element: el
#     offset: '75%'
#     handler: (direction) ->
#       elSelector = '#'+elId+' .canvas-example'
#       example = new GenArt(+ new Date, {
#         elementSelector: elSelector
#         numTicks: 1000
#         limitTicks: true
#         # limitTicks: false
#         bgColor: 'white'
#       })
#       example.init()
#   )

globalOffset = '60%'

section1 = new Waypoint(
  element: document.getElementById('example-1')
  offset: globalOffset
  handler: (direction) ->
    if direction is 'down'
      example = new GenArt(+ new Date, {
        elementSelector: '#example-1'
        numTicks: 1000
        limitTicks: true
        # limitTicks: false
        bgColor: 'white'
      })
      example.init()
)

# TODO Figure out how to modify GenArt
# so that we can have multiple different
# artscripts on the page
# bonus points for doing it without modifying
# artscripts from the twitter bot too much

section2 = new Waypoint(
  element: document.getElementById('example-2')
  offset: globalOffset
  handler: (direction) ->
    if direction is 'down'
      example2.init({
        elementSelector: '#example-2'
        numTicks: 1000
        limitTicks: true
        # limitTicks: false
        bgColor: 'white'
      })
)

section3 = new Waypoint(
  element: document.getElementById('example-3')
  offset: globalOffset
  handler: (direction) ->
    if direction is 'down'
      example3.init({
        elementSelector: '#example-3'
        numTicks: 1000
        # limitTicks: true
        limitTicks: true
        bgColor: 'white'
      })
)

section4 = new Waypoint(
  element: document.getElementById('example-4')
  offset: globalOffset
  handler: (direction) ->
    if direction is 'down'
      example4.init({
        elementSelector: '#example-4'
        numTicks: 1000
        # limitTicks: true
        limitTicks: true
        bgColor: 'white'
      })
)
