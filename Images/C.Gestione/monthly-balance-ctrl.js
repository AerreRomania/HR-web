(function() {
	angular.module('onlYou').controller('MonthlyBalance', ['$uibModal','$scope', function ($uibModal,$scope) {
		
		//Start page animation
		$scope.pageClass = 'page-anim';
		//Assign body class
		bodyClass = document.body.className = 'white';
		
		var vm = this;
		
		//Open share modal
		vm.openModalShare = function () {
   	 		var modalInstance = $uibModal.open({
        		templateUrl: './modules/modal/share/modal-share.jsp',
        		controller: 'ModalShare as vm',
        		windowClass : 'share'
    		});
		};

		
		//Open priority modal
		vm.openModalPriority = function () {
   	 		var modalInstance = $uibModal.open({
        		templateUrl: './modules/modal/priority/modal-priority.jsp',
        		controller: 'ModalPriority as vm',
        		size : 'sm'
    		});
		};
		
		//Page print
		vm.print = function () {
			window.print();
		};
		
		//Mark row
		vm.colorMarker = function () {
			var table = document.getElementsByTagName('table')[0];
			var checkBoxes = table.getElementsByTagName('input');
			
			for (i=0; i<checkBoxes.length; i++) {
				var checkedBoxes = checkBoxes[i];
				
				if (checkedBoxes.checked == true) {
					checkedBoxes.parentElement.parentElement.classList.toggle('red');
				}
				
				if (checkedBoxes.checked == true && (checkedBoxes.className == 'red' || checkedBoxes.classList == 'global-row red')) {
					checkedBoxes.parentElement.parentElement.classList.toggle('red');
				}
				
			}
		};
		
	}]);
})();