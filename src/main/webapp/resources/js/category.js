(function() {
	var app = angular.module('category', []);

	app.controller('CategoryController', function() {
		var cates;
		loadDoc();
		this.categories = cates;

		function requestAjaxDefer(reqString) {
			var defer = $.Deferred();
			$.ajax({
				url : reqString,
				dataType : 'json',
				success : function(response, status, xhr) {
					defer.resolve(response);
				}
			});
			return defer;
		}

		function loadDoc() {
			var defer = requestAjaxDefer('getAllCategories');
			defer.done(function(response) {
				console.log(response);
				cates = response;
				return response;
			}

			);
		}
	});

})();