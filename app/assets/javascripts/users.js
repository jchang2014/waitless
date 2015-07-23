$(document).on('ready page:change', function(){
	console.log("starting user page");

	$('.delete-reservation').on('click', function(event){
		debugger
		var id = $(this).closest('tr').attr('id');
		var restaurant = $(this).closest('table').attr('id');
		var path = "/restaurants/"+restaurant+"/reservations/"+id

		var request = $.ajax({
			url: path,
			type: "DELETE",
			data: id,
			dataType: 'json'
		});
		debugger
		request.done(function(response){
			$('#'+id).closest('tr').remove();
			console.log("this shit done");
		});

		request.fail(function(response){
			console.log("failed it");
		});
	});

	$('.edit-reservation').on('click',function(event){
		debugger
		var id = $(this).closest('tr').attr('id');
		var restaurant = $(this).closest('table').attr('id');
		var path = "/restaurants/"+restaurant+"/reservations/"+id+"/edit"

		var request = $.ajax({
			url: path,
			type: "get",
			data: id,
			dataType: 'html'
		});
		debugger
		request.done(function(response){
			$('#'+id).closest('tr').children().eq(1).html(response);
			console.log("this also done");
		});

		request.fail(function(response){
			alert("failed");
		});

	});

	$('tbody').on('submit','.update-form', function(event){
		event.preventDefault();
		var id = $(this).closest('tr').attr('id');
		var restaurant = $(this).closest('table').attr('id');
		var formdata = $('.number-update').serialize();
		var path = "/restaurants/"+restaurant+"/reservations/"+id

		console.log(formdata);
		var request = $.ajax({
			url: path,
			type: "patch",
			data: formdata,
			dataType: "json"
		});

		request.done(function(response){
			console.log("did it");
			$('#'+id).closest('tr').children().eq(1).html(response);
		});

		request.fail(function(response){
			console.log("failed");
			console.log(response);
		});
	});
});
