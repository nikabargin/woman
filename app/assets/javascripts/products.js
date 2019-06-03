document.addEventListener("turbolinks:load", function() {

$("#products-change").sortable({
	update: function(e, ui) {
		Rails.ajax({
			url: $(this).data("url"),
			type: "PATCH",
			data: $(this).sortable('serialize'),
		});
	}
});

});