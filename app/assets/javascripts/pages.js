$(function () {
  var context = document.getElementById('stock_history_chart');
  var ctx = context.getContext("2d");

  var dates = [];
  $("#stock_history_chart").data('stock').forEach(function(element){
    dates.push(element['table']['trade_date']);
  });
  dates = dates.reverse()

  var prices = [];
  $("#stock_history_chart").data('stock').forEach(function(element){
    prices.push(element['table']['close']);
  });
  prices = prices.reverse()

  var lineData = {
    labels: dates,
    datasets: [
      {
        label: 'AAPL',
        data: prices,
        backgroundColor: "rgba(220,220,220,1)"
    }
  ]
  }

  var chartInstance = new Chart(ctx, {
      type: 'line',
      data: {
        labels: dates,
        datasets: [{
          label: $("#stock_history_chart").data('stock')[0]['table']['symbol'],
          data: prices,
          backgroundColor: "rgba(100,149,237, 0.5)",
          borderColor: "rgb(0,0,255)",
          pointBorderColor: "rgb(0,0,255)",
          pointBackgroundColor: "rgba(100,149,237, 0.5)",
          spanGaps: true
        }],
        options: {
          responsive: false,
          maintainAspectRatio: true
      }
  }
  });


// console.log(ctx);
// console.log(new Date(dates[0]));

// var ctx = document.getElementById('myChart').getContext('2d');
// var myChart = new Chart(ctx, {
//   type: 'line',
//   data: {
//     labels: dates,
//     datasets: [{
//       label: 'AAPL',
//       data: [12, 19, 3, 17, 6, 3, 7],
//       backgroundColor: "rgba(153,255,51,0.4)"
//     }]
//   }
// });

});