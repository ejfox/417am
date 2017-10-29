d3 = require('d3')
$ = require('jquery')

GenArt = require('./GenArt')
example1 = require('./10-8-4')

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

section1 = new Waypoint(
  element: document.getElementById('example-1')
  offset: '65%'
  handler: (direction) ->
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
  offset: '65%'
  handler: (direction) ->
    example1.init({
      elementSelector: '#example-2'
      numTicks: 1000
      limitTicks: true
      # limitTicks: false
      bgColor: 'white'
    })
)
