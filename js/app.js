(function() {
	// Create the main component with needed dependencies
	angular.module('onlYou', [ 'ngAnimate', 'ui.bootstrap', 'vcRecaptcha','ui.router' ]);

})();

(function() {
	// Mainbody block
	angular.module('onlYou').directive('mainbody', function() {
		return {
			restrict : 'E',
			templateUrl : './pages/registrati-accedi.jsp'
		};
	});
})();

(function() {
	// Header block
	angular.module('onlYou').directive('headerBlock', function() {
		return {
			restrict : 'E',
			templateUrl : './includes/header.jsp'
		};
	});
})();

(function() {
	// Footer block
	angular.module('onlYou').directive('footerInfo', function() {
		return {
			restrict : 'E',
			templateUrl : './includes/footer.jsp',
			controller : 'footRoller as vm'
		};
	});

})();

(function() {
//// create the controller and inject Angular's $scope
	angular.module('onlYou').controller('mainController', function($scope) {
    $scope.pageClass = 'page-anim';
    
    setTimeout(function() {
		functionCollector();
	}, 600);
});
})();

(function() {
	angular.module('onlYou').config(function($stateProvider) {
	
		var homeState = {
			name : 'home',
			url : '/',
			templateUrl : './pages/registrati-accedi.jsp',
			controller : 'mainController'
		}

		var privacyState = {
			name : 'privacy',
			url : '/privacy',
			templateUrl : './pages/privacy.jsp',
			controller : 'mainController'
		}
		
		var tcState = {
			name : 'termini-e-condizioni',
			url : '/termini-e-condizioni',
			templateUrl : './pages/termini-e-condizioni.jsp',
			controller : 'mainController'
		}

		$stateProvider.state(homeState);
		$stateProvider.state(privacyState);
		$stateProvider.state(tcState);
		
	});
})();