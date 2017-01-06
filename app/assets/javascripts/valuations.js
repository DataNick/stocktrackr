$(document).on("turbolinks:load", function () {

  var context = document.getElementById('valuations_chart');
  var ctx = context.getContext("2d");

  var values = [];
  $("#valuations_chart").data('valuations').forEach(function(element){
    values.push(JSON.parse(element['amount']));
  });

  var dates = [];
  $("#valuations_chart").data('valuations').forEach(function(element){
    dates.push(element['created_at']);
  });
  dates = dates.sort();

  console.log(values);
  console.log(dates);

  var chartInstance = new Chart(ctx, {

      type: 'line',
      data: {
          labels: dates,
        datasets: [{
          data: values,
          label: 'Portfolio amount',
          backgroundColor: "rgba(100,149,237, 0.5)",
          borderColor: "rgb(0,0,255)",
          pointBorderColor: "rgb(0,0,255)",
          pointBackgroundColor: "rgba(100,149,237, 0.5)",
          spanGaps: true
        }],
        options: {
          responsive: false,
          maintainAspectRatio: false
          }

      }
  });
});

