# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery(document).ready ->
	$('#VinylCollection').hide()
	$('.BottomLink').hide()
	$('#VinylCollection').slideDown(1000, ->
		$('.BottomLink').fadeIn(400))

$('.delete_vinyl').bind 'ajax:success', ->
	$(event.target).parent().parent().fadeOut(1000)