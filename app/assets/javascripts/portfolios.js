$(document).on("turbolinks:load", function() {

    var context = document.getElementById('positions_chart').getContext('2d');
    var data = $('#positions_chart').data().positions;

    var skillsChart = new Chart(context, {
                          type: 'pie',
                          data: data
                        }
      );
      // console.log(skillsChart)
      // alert($('#positions_chart').data('positions'));
    // $('#positions_chart').data(@positions);


});
