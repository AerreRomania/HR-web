(function() {
	angular.module('onlYou').controller('TreasurePlan', [ '$uibModal', '$scope', '$http', function($uibModal, $scope, $http) {

		// Start page animation
		$scope.pageClass = 'page-anim';
		// Assign body class
		bodyClass = document.body.className = 'white';

		var vm = this;

		// Open share modal
		vm.openModalShare = function() {
			var modalInstance = $uibModal.open({
				templateUrl : './modules/modal/share/modal-share.jsp',
				controller : 'ModalShare as vm',
				windowClass : 'share'
			});
		};
		vm.openShare = function(n) {
			console.log(n);

		};

		// Open priority modal
		vm.openModalPriority = function() {
			var modalInstance = $uibModal.open({
				templateUrl : './modules/modal/priority/modal-priority.jsp',
				controller : 'ModalPriority as vm',
				size : 'sm'
			});
		};

		// Page print
		vm.print = function() {
			window.print();
		};
		setTimeout(function(){getGraph();}, 500);
		// Bank chart
		// setTimeout(function(){
		// var bankCtx = document.getElementById("bank_chart");
		//	    
		// var activeWeeks = document.getElementsByClassName('week');
		//	
		// var tdValue =
		// document.getElementsByClassName('sub-table-bank')[0].getElementsByTagName('th');
		// console.log(tdValue[2].innerHTML.replace('€','').replace('.','').replace(',','.').replace('
		// ',''));
		// var bankChart = new Chart(bankCtx, {
		// type: 'line',
		// data: {
		// labels: [activeWeeks[0].innerHTML+"WK",
		// activeWeeks[1].innerHTML+"WK", activeWeeks[2].innerHTML+"WK",
		// activeWeeks[3].innerHTML+"WK", activeWeeks[4].innerHTML+"WK",
		// activeWeeks[5].innerHTML+"WK", activeWeeks[6].innerHTML+"WK",
		// activeWeeks[7].innerHTML+"WK"],
		// datasets: [{
		// label: 'Valore',
		// data:
		// [tdValue[1].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[2].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[3].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[4].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[5].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[6].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[7].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[8].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')],
		//	                        
		// fill: false,
		// borderColor: '#607D8B',
		// backgroundColor: '#607D8B',
		// legend: false
		// }]
		// },
		// options: {
		// scales: {
		// xAxes: [{
		// display : false
		// }]
		// },
		// legend : {
		// display : false
		// },
		// tooltips : {
		// backgroundColor : '#607D8B'
		// }
		// }
		// });
		// }, 600);
		//		
		// //Gain chart
		// setTimeout(function(){
		// var gainCtx = document.getElementById("gain_chart");
		//	    
		// var activeWeeks = document.getElementsByClassName('week');
		// var tdValue =
		// document.getElementsByClassName('sub-table-gain')[0].getElementsByClassName('sub-total')[0].getElementsByTagName('td');
		//	    
		// var gainChart = new Chart(gainCtx, {
		// type: 'line',
		// data: {
		// labels: [activeWeeks[0].innerHTML+"WK",
		// activeWeeks[1].innerHTML+"WK", activeWeeks[2].innerHTML+"WK",
		// activeWeeks[3].innerHTML+"WK", activeWeeks[4].innerHTML+"WK",
		// activeWeeks[5].innerHTML+"WK", activeWeeks[6].innerHTML+"WK",
		// activeWeeks[7].innerHTML+"WK"],
		// datasets: [{
		// label: 'Valore',
		// data:
		// [tdValue[1].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[2].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[3].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[4].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[5].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[6].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[7].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[8].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')],
		// fill: false,
		// borderColor: '#607D8B',
		// backgroundColor: '#607D8B',
		// legend: false
		// }]
		// },
		// options: {
		// scales: {
		// xAxes: [{
		// display : false
		// }]
		// },
		// legend : {
		// display : false
		// },
		// tooltips : {
		// backgroundColor : '#607D8B'
		// }
		// }
		// });
		// }, 500);
		//		
		// //Losses chart
		// setTimeout(function(){
		// var lossCtx = document.getElementById("loss_chart");
		//	    
		// var activeWeeks = document.getElementsByClassName('week');
		// var tdValue =
		// document.getElementsByClassName('sub-table-loss')[0].getElementsByClassName('sub-total')[0].getElementsByTagName('td');
		//
		//	   
		// var lossChart = new Chart(lossCtx, {
		// type: 'line',
		// data: {
		// labels: [activeWeeks[0].innerHTML+"WK",
		// activeWeeks[1].innerHTML+"WK", activeWeeks[2].innerHTML+"WK",
		// activeWeeks[3].innerHTML+"WK", activeWeeks[4].innerHTML+"WK",
		// activeWeeks[5].innerHTML+"WK", activeWeeks[6].innerHTML+"WK",
		// activeWeeks[7].innerHTML+"WK"],
		// datasets: [{
		// label: 'Valore',
		// data:
		// [tdValue[1].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[2].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[3].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[4].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[5].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[6].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[7].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[8].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')],
		// fill: false,
		// borderColor: '#607D8B',
		// backgroundColor: '#607D8B',
		// legend: false
		// }]
		// },
		// options: {
		// scales: {
		// xAxes: [{
		// display : false
		// }]
		// },
		// legend : {
		// display : false
		// },
		// tooltips : {
		// backgroundColor : '#607D8B'
		// }
		// }
		// });
		// }, 500);
		//		
		// //Other chart
		// setTimeout(function(){
		// var otherCtx = document.getElementById("other_chart");
		//	    
		// var activeWeeks = document.getElementsByClassName('week');
		// var otherChart = new Chart(otherCtx, {
		// type: 'line',
		// data: {
		// labels: ["Cons.", "22 WK", "23 WK", "24 WK", "25 WK", "26 WK", "27
		// WK", "28 WK", "29 WK"],
		// datasets: [{
		// label: 'Valore',
		// data: [40, 40, 40, 21, 41, 44, 40, -15, 24],
		// fill: false,
		// borderColor: '#607D8B',
		// backgroundColor: '#607D8B',
		// legend: false
		// }]
		// },
		// options: {
		// scales: {
		// xAxes: [{
		// display : false
		// }]
		// },
		// legend : {
		// display : false
		// },
		// tooltips : {
		// backgroundColor : '#607D8B'
		// }
		// }
		// });
		// }, 500);
		//		
		// //Total chart
		// setTimeout(function(){
		// var totalCtx = document.getElementById("total_chart");
		//	    
		// var activeWeeks = document.getElementsByClassName('week');
		// var tdValue =
		// document.getElementsByClassName('sub-table-total')[0].getElementsByTagName('th');
		//	    
		// var totalChart = new Chart(totalCtx, {
		// type: 'line',
		// data: {
		// labels: [activeWeeks[0].innerHTML+"WK",
		// activeWeeks[1].innerHTML+"WK", activeWeeks[2].innerHTML+"WK",
		// activeWeeks[3].innerHTML+"WK", activeWeeks[4].innerHTML+"WK",
		// activeWeeks[5].innerHTML+"WK", activeWeeks[6].innerHTML+"WK",
		// activeWeeks[7].innerHTML+"WK"],
		// datasets: [{
		// label: 'Valore',
		// data:
		// [tdValue[1].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[2].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[3].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[4].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[5].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[6].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[7].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[8].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')],
		// fill: false,
		// borderColor: '#607D8B',
		// backgroundColor: '#607D8B',
		// legend: false
		// }]
		// },
		// options: {
		// scales: {
		// xAxes: [{
		// display : false
		// }]
		// },
		// legend : {
		// display : false
		// },
		// tooltips : {
		// backgroundColor : '#607D8B'
		// }
		// }
		// });
		// }, 500);
		//		
		// //Finance chart
		// setTimeout(function(){
		// var financeCtx = document.getElementById("finance_chart");
		//	    
		// var activeWeeks = document.getElementsByClassName('week');
		// var tdValue =
		// document.getElementsByClassName('sub-table-finance')[0].getElementsByTagName('th');
		//
		//	    
		// var financeChart = new Chart(financeCtx, {
		// type: 'line',
		// data: {
		// labels: [activeWeeks[0].innerHTML+"WK",
		// activeWeeks[1].innerHTML+"WK", activeWeeks[2].innerHTML+"WK",
		// activeWeeks[3].innerHTML+"WK", activeWeeks[4].innerHTML+"WK",
		// activeWeeks[5].innerHTML+"WK", activeWeeks[6].innerHTML+"WK",
		// activeWeeks[7].innerHTML+"WK"],
		// datasets: [{
		// label: 'Valore',
		// data:
		// [tdValue[1].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[2].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[3].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[4].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[5].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[6].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[7].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')
		// ,
		// tdValue[8].innerHTML.replace('€','').replace('.','').replace('.','').replace(',','.').replace('
		// ','')],
		// fill: false,
		// borderColor: '#607D8B',
		// backgroundColor: '#607D8B',
		// legend: false
		// }]
		// },
		// options: {
		// scales: {
		// xAxes: [{
		// display : false
		// }]
		// },
		// legend : {
		// display : false
		// },
		// tooltips : {
		// backgroundColor : '#607D8B'
		// }
		// }
		// });
		// }, 500);
		/*var week = 1;

		var xhr = new XMLHttpRequest();
		xhr.open('POST', '/Onlyou/UpTreasuryPage', true);
		xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		xhr.onload = function() {
			var obj = JSON.parse(this.responseText);
			graph(obj.posizioneFineMese.avere, "graph_posizione_fine");
			// obj.posizioneFineMese.avere.shift();
			obj.posizioneFineMese.avere.splice(0, 0, obj.posizioneBancaInit);

			graph(obj.posizioneFineMese.avere, "graph_inizio_mese");
			graph(obj.usciteFornitoriTotale.avere, "graph_fornitori_uscite");
			graph(obj.usciteTotale.avere, "graph_totale_uscite");
			graph(obj.entrateTotale.avere, "graph_totale_entrate");
			document.getElementById("months").innerHTML = obj.months;
		}
		xhr.send('week=' + week+"&currency=RSD&change=1.0");*/
//		getGraph();
	} ]);

})();
