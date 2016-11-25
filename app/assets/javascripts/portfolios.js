$(document).on("turbolinks:load", function () {
  var context = document.getElementById('positions_chart');
  var ctx = context.getContext("2d");

  var quantities = [];
  $("#positions_chart").data('positions').forEach(function(element){
    quantities.push(element['quantity']);
  });

  var colors =[ "#FFCE56",
                "#FFA75D",
                "#46BFBF",
                "#5975CB",
                "#FF5D5D",
                "#FFCC5D",
                "#52DF52",
                'black'
];

  var tickers = [];
  $("#positions_chart").data('positions').forEach(function(element){
    tickers.push(element['ticker']);
  });

  var pieData = {
    labels: tickers,
    datasets: [
      {
        backgroundColor: function() {
          var bgcolors = [];
          for (var i=0; i < tickers.length; ++i) bgcolors.push(colors[i % colors.length]);
          return bgcolors;
          }(),
        borderColor: "rgba(220,220,220,1)",
        data: quantities
    }
  ]
  }

  var chartInstance = new Chart(ctx, {
      type: 'doughnut',
      data: pieData,
      options: {
          responsive: true,
          maintainAspectRatio: false
      }
  });

  console.log(chartInstance);
  console.log(pieData);
  // console.log($("#positions_chart"));
  // console.log($("#positions_chart").data('positions'))
  // console.log(tickers)

});


// $(document).ready(function() {
//   var positionsQuantity = <%= raw(@positions.map(&:quantity)) %>;
//   var positionName = <%= raw(@positions.map(&:name)) %>;
//   var ctx = $('#positions_chart');

//   var pieData = {
//     labels: positionName,
//     datasets: [
//     {
//       label: "pie labels",
//       data: positionsQuantity,
//       backgroundColor: "rgba(220,220,220,1)",
//       borderColor: "rgba(220,220,220,1)"
//     }]
//   }

//   var chartInstance = new Chart(ctx, {
//     type: 'pie',
//     data: pieData,
//     options: {
//       responsive: true
//     }
//   });

// });






