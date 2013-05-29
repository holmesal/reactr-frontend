
# Main
# ============

# Configure require
require.config
	paths:
		jquery: 'libs/jquery/jquery.min'
		jqueryui: 'libs/jqueryui/jqueryui.min'
		underscore: 'libs/underscore/underscore.min'
		backbone: 'libs/backbone/backbone.min'
		handlebars: 'libs/handlebars/handlebars'
		text: 'libs/requirejs-text/text'
		hammer: 'libs/hammer/hammer.min'
		context: 'libs/context/context'
		# socketio: 'http://localhost:6969/socket.io/socket.io'
		socketio: 'http://api.reactr.co/socket.io/socket.io'

	shim:
		backbone:
			deps: ['underscore','jquery'],
			exports: 'Backbone'
		underscore:
			exports: '_'
		handlebars:
			exports: 'Handlebars'
		hammer:
			exports: 'Hammer'
		context:
			exports: 'Context'


# Load app.js via require

require ['app'], (App) ->
	# Initialize the app to kick things off
	window.app = 
		app: App
		collections: {}
		models: {}
		views: {}
	App.initialize()