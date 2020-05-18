<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setLocale value="en_EN" />
<!doctype html>
<html ng-app="onlYou" lang="it">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta charset="utf-8">
<link rel="shortcut icon" type="Images/Image/png" href="${pageContext.request.contextPath}/favicon.png" />
<link rel="apple-touch-icon" href="${pageContext.request.contextPath}/onlyou-60.png">
<link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/onlyou-76.png">
<link rel="apple-touch-icon" sizes="120x120" href="${pageContext.request.contextPath}/onlyou-120.png">
<link rel="apple-touch-icon" sizes="152x152" href="${pageContext.request.contextPath}/onlyou-152.png">
<title>Onlyou</title>
<!-- CSS  -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dashboard/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/datatable/datatables.bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/datatable/datatables.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs/dt-1.10.16/fc-3.2.4/fh-3.1.3/r-2.2.1/datatables.min.css"/>
<script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/bs/dt-1.10.16/fc-3.2.4/fh-3.1.3/r-2.2.1/datatables.min.js"></script>

<!-- CHART JS --> 

<script src="${pageContext.request.contextPath}/js/chart.bundle.min.js"></script>
<!-- CHART JS END -->
<!-- CORE -->
<script src="${pageContext.request.contextPath}/js/angular.min.js"></script>
<!-- CORE END -->
<!-- THIRD PARTY MODULES -->
<script src="${pageContext.request.contextPath}/js/angular-ui-router.min.js"></script>
<script src="${pageContext.request.contextPath}/js/angular-animate.min.js"></script>
<script src="${pageContext.request.contextPath}/js/ui-bootstrap-tpls-2.2.0.min.js"></script>

<!-- THIRD PARTY MODULES END -->
<!-- MAIN APP -->
<script src="${pageContext.request.contextPath}/dashboard/js/app.js"></script>
<!-- MAIN APP END -->
<!-- MODULES -->
<script src="${pageContext.request.contextPath}/dashboard/modules/monthly-balance-ctrl.js"></script>
<script src="${pageContext.request.contextPath}/dashboard/modules/treasure-plan-ctrl.js"></script>
<script src="${pageContext.request.contextPath}/dashboard/modules/modal/share/modal-share-ctrl.js"></script>
<script src="${pageContext.request.contextPath}/dashboard/modules/modal/priority/modal-priority-ctrl.js"></script>
<!-- MODULES END -->
</head>
<body>
	<!-- LEFT NAVIGATION -->
	<left-navi id="left-navi" ng-class="{hover : hover}" ng-mouseenter="hover = true" ng-mouseleave="hover = false"></left-navi>
	<!-- RIGHT NAVIGATION -->
	<right-navi id="right-navi"></right-navi>
	<!-- MAINBODY -->
	<mainbody id="main-body" class="page {{ pageClass }} {{ vm.pageClass }}" ui-view></mainbody>
	<script>
		function rgtForce() {

			var e = document.getElementById('right-navi');
			if (e.className == 'ng-scope hover') {
				e.className = 'ng-scope';
			} else {
				e.className = 'ng-scope hover';
			}
		}

		function priorView() {
			var collection = document.getElementsByClassName('cats');

			document.getElementById('prior').className = 'filter active';
			document.getElementById('all').className = 'filter';

			for (var i = 0, len = collection.length; i < len; i++) {
				collection[i].classList.remove("show");
				// 				setTimeout(function(){
				// 					collection[i].style.display = 'none';
				// 				}, 400);
			}
		}
		function allView() {
			var collection = document.getElementsByClassName('cats');

			document.getElementById('prior').className = 'filter';
			document.getElementById('all').className = 'filter active';

			for (var i = 0, len = collection.length; i < len; i++) {
				// 				collection[i].style.display = 'block';
				collection[i].classList.add("show");
			}
		}
	</script>
	<script src="${pageContext.request.contextPath}/ajax-pages/treasury.js"></script>
	<script src="${pageContext.request.contextPath}/ajax-pages/treasury_single.js"></script>
	<script>
		function update(n) {
			/*document.getElementById("month-id").value = n;
			var change = document.getElementById("change").value*/
			var e = document.getElementById("week_start");
			var startWeek = e.options[e.selectedIndex].value;
			var e = document.getElementById("week_end");
			var weekNumber = e.options[e.selectedIndex].value;
			var change = document.getElementById("change").value;
			console.log(startWeek, weekNumber, change);
			if (!isNaN(change) && change != null && change != "") {
				change = change;
			} else {
				change = 1.0;
				document.getElementById("change").value = 1.0;
			}
			var xhr = new XMLHttpRequest();
			xhr.open('POST', '/Onlyou/UpTreasuryPageTotal', true);
			xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
			xhr.onload = function() {
				document.getElementById("treasury-plan-table").innerHTML = this.responseText;
				getGraph();
			}
			var valuta = document.getElementById("valutaEuroRsd");
			if (change != '' && change != '1' && change != '1.0') {
				valuta.innerHTML = 'EUR';
			} else {
				valuta.innerHTML = 'RSD';
			}
			xhr.send('week=' + startWeek + '&week_number=' + weekNumber + '&change=' + change);
			// var table = document.getElementById("monthly-balance").innerHTML =
		};
	</script>
</body>
</html>