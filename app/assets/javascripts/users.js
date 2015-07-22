$(document).on('page:change', function(){
	$('.delete').on('click', function(event){
		var id = $(this).attr('id');
		var path = "/restaurants/1/reservations/"+id

		var request = $.ajax({
			url: path,
			type: "DELETE",
			data: id,
			dataType: 'json'
		});

		request.done(function(response){
			$('#'+id).closest('tr').remove();
		});

		request.fail(function(response){
			console.log("failed it");
		});
	});

	$('.edit').on('click',function(event){
		var id = $(this).attr('id');
		var path = "/restaurants/1/reservations/"+id+"/edit"

		var request = $.ajax({
			url: path,
			type: "get",
			data: id,
			dataType: 'html'
		});

		request.done(function(response){
			console.log("did it");
			debugger
		});

		request.fail(function(response){
			alert("failed");
		});

	})
});