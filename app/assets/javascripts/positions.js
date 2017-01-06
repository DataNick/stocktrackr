$(document).on("turbolinks:load", function () {
  var context = document.getElementById('positions_chart');
  var ctx = context.getContext("2d");

  var quantities = [];
  $("#positions_chart").data('positions').forEach(function(element){
    quantities.push(element['quantity']);
  });

  var colors =[ "#3498db",
                "#FFA75D",
                "#27ae60",
                "#5975CB",
                "#FF5D5D",
                "#FFCC5D",
                "#52DF52",
                '#34495e'
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
          responsive: false,
          maintainAspectRatio: false
      }
  });

  console.log(chartInstance)
});
