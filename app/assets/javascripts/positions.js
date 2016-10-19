$(document).ready(function() {

  var context = document.getElementById('positions_chart').getContext('2d');
  var skillsChart = new Chart(context, {
                        type: 'pie',
                        data: $('#positions_chart').data('positions'),
                      }
    );

});
