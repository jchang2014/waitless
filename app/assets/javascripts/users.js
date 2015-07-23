$(document).on('page:change', function(){
	$('.delete').on('click', function(event){
		event.preventDefault;

		var id = $(this).attr('id');
		var path = "/restaurants/1/reservations/"+id

		var request = $.ajax({
			url: path,
			type: "DELETE",
			data: id,
			dataType: 'json'
		});

		request.done(function(response){
			console.log("yeah buddy");
			debugger
			$('#'+id).closest('tr').remove();
			console.log(response);
		});

		request.fail(function(response){
			console.log("failed it");
			console.log(response);
		});
	});
});
