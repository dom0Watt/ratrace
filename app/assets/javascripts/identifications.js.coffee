$(document).on "ready", ->
 $('table[id="codecoverage"] > tbody > tr > td').each (index, element) =>
 	if $(element).hasClass('coverage')
 		if $(element).html() > 75 
 			$(element).parent().css('background-color', '#dff0d8') 
 		else
 			$(element).parent().css('background-color', '#f2dede')


selectAll: ->
  cells = $("#tableau" > tbody > tr > td)
  cells.each ->
    if $(this).hasClass("select")		
    	$(this).val true 

