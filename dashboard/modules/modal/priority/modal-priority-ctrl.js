(function () {
    'use strict';
 
    angular.module('onlYou').controller('ModalPriority', ['$uibModalInstance', function ($uibModalInstance) {
            var vm = this;
 
            vm.closeModalPriority = function () {
            	$uibModalInstance.close();
            };
 			
            vm.priorityMessage = "Il task è stato impostato come prioritario.";
            
        }]);
 
}());