$(document).on "ready", ->
	 $('table[id="codecoverage"] > tbody > tr > td').each (index, element) =>
	 	if $(element).hasClass('coverage')
	 		if $(element).html() > 75 
	 			$(element).parent().css('background-color', '#dff0d8') 
	 		else
	 			$(element).parent().css('background-color', '#f2dede')


	
		

