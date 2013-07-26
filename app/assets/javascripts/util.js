$(document).on('ready', function () {
	$('#selectall').on('click', function(){
		cells = $("#tableau td input")
		selectall = $('#selectall').prop('checked'); 
		cells.each(function(){
	  		$(this).prop('checked', selectall)
	  	});	 	
	});

	$('#submitident').on('click', function(){
		dispLayLoader('form');
	});

	$('#run').on('click', function(){
		dispLayLoader('form');
	});
	

});


function dispLayLoader(divToHideId){
	id = '#'+divToHideId;
	$(id).css('display', 'none');
	$('#loader').css('display','');	
}
