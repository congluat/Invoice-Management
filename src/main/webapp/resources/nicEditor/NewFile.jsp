<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>Ti�u ?? trang</title>
	
	<script src="nicEdit.js" type="text/javascript"></script>
	<script type="text/javascript">
	bkLib.onDomLoaded(function() {
		new nicEditor().panelInstance('abc');
	});
	</script>
</head>
<body>
	<textarea id="abc" rows="5" cols="60"></textarea>
</body>
</html>