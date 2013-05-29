
# context.js
# ==========

# Super-simple contextual feedback.

	# Reference jquery
	$ = jQuery

	# Extend jQuery
	$.fn.extend

		Burp: (options) ->

			# Default settings
			settings =
				speed: 200
				distance: 40
				debug: false
				message: 'Cellar door.'

			# Merge options with settings
			settings = $.extend settings, options

			# Debug logger
			log = (words) ->
				console.log words if words if settings.debug

			# Do the damn thing
			return @each () ->
				
				# Create the element
				elem = '<div class="burp"><span class="burp-text">'+settings.message+'</span></div>'

				# Make a jQuery element
				$el = $ elem

				# Append to the container
				$(@).append $el

				# Style the text element
				$el.children('.burp-text').css
					'font-size': '14pt'
					'color': 'white'
					opacity: 0.7

				# Style the outer element
				padx = 20
				pady = 7
				$el.css 
					'position': 'absolute'
					'overflow': 'auto'
					'text-align': 'center'
					'background-color': 'rgba(0,0,0,0.6)'
					'padding-left': padx
					'padding-right': padx
					'padding-top': pady
					'padding-bottom': pady
					'border-radius': '10px'
					opacity: 0

					


				# Set the position
				container = $(@).position()
				$.extend container,
					width: $(@).outerWidth()
					height: $(@).outerHeight()

				# Size the element
				element = 
					width: $el.outerWidth()
					height: $el.outerHeight()

				# Set the element position
				left = container.left + container.width/2 - element.width/2
				top = container.top + container.height/2 - element.height/2 + settings.distance/2

				log left
				log top

				$el.css
					left: left
					top: top

				# Animate!
				$el.animate 
					opacity: 1
					top: '-='+settings.distance/2

					,settings.speed,'linear',->
						# fadeout
						$(@).animate
							opacity: 0
							top: '-='+settings.distance/2
							,settings.speed,'linear',->
								$(@).remove()

				# Calculate the position