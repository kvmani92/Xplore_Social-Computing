{ mapboxgl } = require "npm"

mapboxgl.accessToken = 'pk.eyJ1Ijoia3ZtYW5pOTIiLCJhIjoiY2o5dDM3NW44NmtwMzJ5bGdqanRpZmMxYSJ9.mZRZhYb4-Zbjy8RLiJTGug'

# accX = 0
# Dest_distance.y = Dest_arrow.y + Dest_arrow.height
# accZ = 0
# window.addEventListener 'deviceorientation', (event) ->
#   #accX = event.accelerationIncludingGravity.x
#   accZ = event.alpha
#  # print accZ*100
#   Dest_arrow.rotation = -90+accZ;
#   return




# Variables
pageCount = 3
gutter = 10
layerBackgroundColor = "#00AAFF"

# Create PageComponent



pageScroller = new PageComponent
	point: Align.center
	width: Screen.width
	height: Screen.height
	scrollVertical: true
	scrollHorizontal: false
	clip: false
	draggable: false
#
# pageScroller2 = new PageComponent
# 	point: Align.center
# 	width: Screen.width
# 	height: Screen.height
# 	scrollVertical: false
# 	clip: false
# 	draggable: false
# 	parent: pageScroller.content
#
# pageScroller.snapToPage(mapLayer)
#
#
# Loop to create pages
for index in [0...2]
	#print index
	page = new Layer
		size: pageScroller.size
		name: "layer"+index
		x: (pageScroller.width + gutter) * index
		backgroundColor: layerBackgroundColor
		hueRotate: index * 20
		parent: pageScroller.content
#

#print pageScroller.content.children[0].content.children
# pageScroller.onClick ->
# 	#print this.name
pageScroller.content.draggable.overdrag = false
pageScroller.content.draggable.propagateEvents = false
pageScroller.content.draggable.overdrag = false
pageScroller.content.draggable.propagateEvents = false

mapLayer = new Layer
	name: "map"
	width: Screen.width
	height: Screen.height
	backgroundColor: null
	index: 2
	propagateEvents: false
	parent: pageScroller.content


mapLayer.classList.add('map-one')

document.getElementsByClassName('map-one')[0].setAttribute('id', 'map')



randomFn = ( ex ) ->
	#print "hello"
	#print ex.message

getLocation = ->
  if navigator.geolocation
    #print 'yes'
    #print navigator.geolocation.getCurrentPosition
    navigator.geolocation.getCurrentPosition showPosition, randomFn
  else
    #print 'Geolocation is not supported by this browser.'
  return

lat = 0
long = 0

showPosition = (position) ->
  #print 'kkk'
  #alert 'Latitude: ' + position.coords.latitude + '<br>Longitude: ' + position.coords.longitude
  lat = position.coords.latitude
  long = position.coords.longitude
  map = new mapboxgl.Map
    container: 'map'
    zoom: 18
    minZoom: 5
    maxZoom: 22

    #center: [-77.01866, 38.888]
    center: [long,lat]
    pitch: 45
    #
    # Add Mapbox style url
    style: 'mapbox://styles/kvmani92/cj9zp9hbj8rml2sphbqu1fvvu'
  document.getElementsByClassName('map-one')[0].childNodes[1].innerHTML = ""
  marker = document.createElement "div"
  markerImg = document.createElement "img"
  markerImg.style.width = "100px"
  markerImg.style.height = "100px"
  markerImg.src = 'http://www.pngall.com/wp-content/uploads/2017/05/Map-Marker-PNG-HD.png'


  marker.className = "location-tracker"
  marker.id = "location-tracker"
  marker.style.backgroundImage = 'url(framer/images/marker.svg)';
  #document.getElementById('location-tracker')[0].appendChild style
  new mapboxgl.Marker markerImg
  .setLngLat [long,lat]
  .addTo map

  markerImg.addEventListener 'click', ->
    print 'Tapped'
    console.log 'Tapped'
    return
    map.addControl new (mapboxgl.GeolocateControl)
    positionOptions: enableHighAccuracy: true
    trackUserLocation: true
    return
  getLocation()









mapLayer.ignoreEvents = false
#print





#print navigator.geolocation.getCurrentPosition














# Navdeep's section @start

# This function returns a fresh new layer:
_baseLayer = new Layer
  name: "Super Layer"
  x: 0
  y: 0
  width: Screen.width
  height: Screen.height
  scrollVertical: true
  scrollHorizontal: false

getNewLayer = ( name ) ->
  new Layer
    name: name
    backgroundColor: layerBackgroundColor
    opacity: 0
    parent: pageScroller.content
    # parent: _baseLayer

# Create first layer:
layer1AddExperience = getNewLayer "addXp"
# layer1AddExperience.opacity = 1
layer1AddExperience.bringToFront()
layer1AddExperience.html = ( $.tmpl "add-xp" ).prop( "outerHTML" )
$addXpForm = layer1AddExperience.querySelector "form#add-xp"
$addXpForm.on "click", ( e ) ->
  e.preventDefault()
  $form = $ this
  print "Submit!"
  print ( $form.find "input#xp-name" ).val()
  print ( $form.find "select#xp-category" ).val()

# Navdeep's section @end