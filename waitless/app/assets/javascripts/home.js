$(document).on("page:change", function() {

	$('form').on('submit', function() {
		event.preventDefault();

		formData = $('#search-form').serialize();


		var request = $.ajax({
			url: '/restaurants',
			type: 'GET',
			data: formData
		});

		request.done(function(response){
			console.log("done");
			for(i=0;i<response.length;i++) {
				$('.results-list').append("<p>"+'name: '+response[i][0]+"</p>");
				$('.results-list').append("<p>"+'location: '+response[i][1]+"</p>");
				$('.results-list').append("<img src='"+response[i][2]+"'>");
			};
		});

	});
});