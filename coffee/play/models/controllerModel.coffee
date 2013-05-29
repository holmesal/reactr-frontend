
# Controller Model
# ============
# Responsible for loading the controller from the server, handling interactions, and pushing data back to the server


define [

	'jquery'
	'underscore'
	'backbone'
	'socketio'
	'play/models/controlModel'
	'play/collections/controls'
	'play/views/controls/switch'
	'play/views/controls/button'
	'play/views/controls/touchpad'

], ($, _, Backbone, io, ControlModel, ControlsCollection, SwitchView, ButtonView, TouchpadView) ->
	
	ControllerModel = Backbone.Model.extend

		pollInterval: 100

		initialize: ->
			console.log 'new controller model!'
			@lastSent = Date.now()
			console.log @lastSent
			


		fetchData: ->

			# Hardcoded for now
			swit = new ControlModel
				viewProto: SwitchView
				value: 0
				icon: 'icon-magnet'
				name: 'my-switch'
				'name-display': 'My Switch'

			butt = new ControlModel
				viewProto: ButtonView
				type: 'button'
				icon: 'icon-arrow-up'
				name: 'my-button'
				'name-display': 'My Button'

			touch = new ControlModel
				viewProto: TouchpadView
				type: 'touchpad'
				icon: 'icon-rocket'
				name: 'my-touchpad'
				'name-display': 'Touch Me'

			@collection = new ControlsCollection [swit,butt,touch]

			# Emit socket events when any model in the collection starts
			@collection.on 'change', =>
				@checkTime()

			# Trigger fetch complete event
			@trigger 'controller:load'

			# Connect with socket.io
			@socketize()

		socketize: ->
			# @socket = io.connect 'http://localhost:6969'
			@socket = io.connect 'http://api.reactr.co'

			console.log @socket

			# Set the socket object on the collection, just for kicks
			@collection.socket = @socket

		checkTime: ->
			if Date.now() - @lastSent > @pollInterval
				@lastSent = Date.now()
				@emit()
			else
				console.log 'skipping'

		emit: ->
			# Can optimize here - remove all the bullshit parameters being returned along with the data
			data = @collection.toJSON()
			console.log 'sending!'
			# console.log data
			@socket.emit 'data',data

	
	
	return ControllerModel