(function () {
    'use strict';
 
    angular.module('onlYou').controller('ModalShare', ['$scope','$uibModalInstance', function ($scope,$uibModalInstance) {
            var vm = this;
 
            vm.closeModalShare = function () {
            	$uibModalInstance.close();
            };
 			
            vm.deleteUser = function (e) {
            	console.log('Elimino');
            	console.log(e);
            	e.parentNode.innerHTML = '';
            	
            };
			vm.selectUser = function (e) {
				var userC = document.getElementById('added');
				
				console.log(userC);
				
				userC.appendChild('<div class="share-container">'
						+ '<img class="img-circle" src="${pageContext.request.contextPath}/dashboard/images/user-demo.png">'
						+ '<button type="button" class="removal" ng-click="vm.deleteUser(this)">'
						+	'<i class="fa fa-times"></i>'
						+ '</button>'
						+ '</div>');
            	
            };
            
        }]);
 
}());