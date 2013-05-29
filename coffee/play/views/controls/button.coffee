
# Button View
# ============


define [

	'jquery'
	'underscore'
	'backbone'
	'play/views/controls/base'
	'context'

], ($, _, Backbone, BaseView, Context) ->
	
	Button = BaseView.extend

		onclick: ->
			# Show as active, but only for a bit
			@$el.addClass 'control-active'
			setTimeout =>
				@$el.removeClass 'control-active'
			,200

			# Show the burp
			$('body').Burp
				message: @model.get('name-display')+' clicked'
				debug: true

			# if @$el.hasClass 'control-active'
			# 	@$el.removeClass 'control-active'
			# 	# Set things on the model
			# else
			# 	@$el.addClass 'control-active'
			# 	# Set things on the model

	return Button