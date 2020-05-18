(function() {
	// Create the main component with needed dependencies
	angular.module('onlYou', [ 'ngAnimate', 'ui.bootstrap', 'ui.router' ]);

})();

(function() {
	// Mainbody block
	angular.module('onlYou').directive('mainbody', function() {
		return {
			restrict : 'E',
			templateUrl : './pages/all.jsp'
		};
	});
})();

(function() {
	// Left block
	angular.module('onlYou').directive('leftNavi', function() {
		return {
			restrict : 'E',
			templateUrl : './includes/left-navi.jsp'
		};
	});
})();

(function() {
	// Right block
	angular.module('onlYou').directive('rightNavi', function() {
		return {
			restrict : 'E',
			templateUrl : './includes/right-navi.jsp'
		};
	});

})();

(function() {
	// create the controller and inject Angular's $scope
	angular.module('onlYou').controller('mainController', function($scope, $rootScope) {
		$scope.pageClass = 'page-anim';

		document.body.className = 'category';
	});
})();

(function() {
	// create the controller and inject Angular's $scope
	angular.module('onlYou').controller('subController', function($scope) {
		$scope.pageClass = 'page-anim';

		document.body.className = 'sub-category';
	});
})();

(function() {
	// Page router
	angular.module('onlYou').config(function($stateProvider) {

		var allState = {
			name : 'all',
			url : '/',
			templateUrl : './pages/all.jsp',
			controller : 'mainController'
		}

		var dashState = {
			name : 'dashboard',
			url : '/dashboard',
			templateUrl : './pages/dashboard.jsp',
			controller : 'mainController'
		}

		// var tresPlanState = {
		// name : 'treasury-plan',
		// url : '/treasury-plan/{start}',
		// parent : 'dashboard',
		// templateUrl : function(a){
		// return './pages/sub-pages/knitting-treasury.jsp?start='+a.start;
		// },
		// controller : 'TreasurePlan as vm'
		// }
		var tresPlanState = {
			name : 'treasury-plan',
			url : '/TesoreriaWeekDataLoader/{start}',
			parent : 'dashboard',
			templateUrl : function(a) {
				return '../TesoreriaWeekDataLoader?start=' + a.start;
			},
			controller : 'TreasurePlan as vm'
		}

		var sellsState = {
			name : 'sells',
			url : '/sells',
			templateUrl : './pages/sells.jsp',
			controller : 'mainController'
		}

		var marketState = {
			name : 'market',
			url : '/market',
			templateUrl : './pages/market.jsp',
			controller : 'mainController'
		}

		var recBalState = {
			name : 'reclass-balance',
			url : '/reclassified-balance',
			parent : 'market',
			templateUrl : './pages/sub-categories/reclassified-balance.jsp',
			controller : 'subController'
		}

		var monthBalanceState = {
			name : 'monthly-balance',
			url : '/monthly-balance',
			parent : 'reclass-balance',
			// templateUrl : './pages/sub-pages/monthly-balance.jsp',
			templateUrl : function(a) {
				return '../montly-balance';
			},
			controller : 'MonthlyBalance as vm'
		}

		var progBalanceCentState = {
			name : 'profit-center-progressive',
			url : '/profit-center-progressive',
			parent : 'profit-center',
			templateUrl : '../progressive-balance',
			controller : 'MonthlyBalance as vm'
		}

		var progBalanceState = {
			name : 'progressive-balance',
			url : '/progressive-balance',
			parent : 'reclass-balance',
			templateUrl : './pages/sub-pages/progressive-balance.jsp',
			controller : 'MonthlyBalance as vm'
		}

		var profCentState = {
			name : 'profit-center',
			url : '/profit-center-balance',
			parent : 'market',
			templateUrl : './pages/sub-categories/profit-center-balance.jsp',
			controller : 'subController'
		}
		var loadFile = {
			name : 'load-file',
			url : '/load-file',
			parent : 'market',
			templateUrl : './pages/sub-categories/loadfile.jsp',
			controller : 'subController'
		}

		var monthBalanceKnitState = {
			name : 'profit-center-knitting',
			url : '/profit-center-knitting',
			parent : 'profit-center',
			templateUrl : './pages/sub-pages/profit-center-knitting.jsp',
			controller : 'MonthlyBalance as vm'
		}

		var monthBalanceIronState = {
			name : 'profit-center-ironing',
			url : '/profit-center-ironing',
			parent : 'profit-center',
			templateUrl : './pages/sub-pages/profit-center-ironing.jsp',
			controller : 'MonthlyBalance as vm'
		}

		var monthBalancePackState = {
			name : 'profit-center-packaging',
			url : '/profit-center-packaging',
			parent : 'profit-center',
			templateUrl : './pages/sub-pages/profit-center-packaging.jsp',
			controller : 'MonthlyBalance as vm'
		}
		var loadData = {
			name : 'load-data',
			url : '/load-data/{error}/{rows}',
			parent : 'market',
			templateUrl : function(a) {
				return './pages/sub-pages/caricamenti-file.jsp?error=' + a.error + '&rows=' + a.rows;
			},
			controller : 'subController'
		}
		// var ricaviContoLavoro = {
		// name : 'ricavi-conto-lavoro',
		// url : '/GetRCL',
		// parent : 'dashboard',
		// templateUrl : function(a) {
		// return '../GetRCL?month=9&anno=2017';
		// // ?error=' + a.error + '&rows=' + a.rows;
		// },
		// controller : 'mainController'
		// }
		var ricaviContoLavoro = {
			name : 'ricavi-conto-lavoro',
			url : '/ricavi-conto-lavoro/{error}/{rows}',
			parent : 'dashboard',
			templateUrl : function(a) {
				return './pages/sub-pages/ricavi_conto_lavoro.jsp';
				// ?error=' + a.error + '&rows=' + a.rows;
			},
			controller : 'mainController'
		}

		var lossState = {
			name : 'losses',
			url : '/losses',
			templateUrl : './pages/losses.jsp',
			controller : 'mainController'
		}

		var productionState = {
			name : 'production',
			url : '/production',
			templateUrl : './pages/production.jsp',
			controller : 'mainController'
		}

		var hrState = {
			name : 'human-resources',
			url : '/human-resources',
			templateUrl : './pages/human-resources.jsp',
			controller : 'mainController'
		}

		var wareState = {
			name : 'warehouse',
			url : '/warehouse',
			templateUrl : './pages/warehouse.jsp',
			controller : 'mainController'
		}

		var investmentState = {
			name : 'investment',
			url : '/investment',
			templateUrl : './pages/investment.jsp',
			controller : 'mainController'
		}

		var miscState = {
			name : 'miscelanny',
			url : '/miscelanny',
			templateUrl : './pages/miscellany.jsp',
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

		$stateProvider.state(allState);
		$stateProvider.state(loadFile);
		$stateProvider.state(dashState);
		$stateProvider.state(tresPlanState);
		$stateProvider.state(sellsState);
		$stateProvider.state(marketState);
		$stateProvider.state(recBalState);
		$stateProvider.state(monthBalanceState);
		$stateProvider.state(progBalanceState);
		$stateProvider.state(profCentState);
		$stateProvider.state(monthBalanceKnitState);
		$stateProvider.state(monthBalanceIronState);
		$stateProvider.state(monthBalancePackState);
		$stateProvider.state(progBalanceCentState);
		$stateProvider.state(lossState);
		$stateProvider.state(productionState);
		$stateProvider.state(hrState);
		$stateProvider.state(wareState);
		$stateProvider.state(investmentState);
		$stateProvider.state(miscState);
		$stateProvider.state(privacyState);
		$stateProvider.state(tcState);
		$stateProvider.state(loadData);
		$stateProvider.state(ricaviContoLavoro);
	});
})();
