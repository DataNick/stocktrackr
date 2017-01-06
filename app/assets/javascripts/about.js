// $(document).on("turbolinks:load", function () {


//   //  console.log('hello');

//   //   var context = document.getElementById('positions_sample_chart');
//   //   var ctx = context.getContext("2d");

//   //   var quantities1 = [10, 11, 5, 10, 20, 15, 10, 10]
//   //   var colors1 =[ "#3498db",
//   //                 "#FFA75D",
//   //                 "#27ae60",
//   //                 "#5975CB",
//   //                 "#FF5D5D",
//   //                 "#FFCC5D",
//   //                 "#52DF52",
//   //                 '#34495e'
//   // ];

//   // var tickers1 = ["TSLA","TWTR","LNKD","FB","DIS","F","MSFT", "AAPL"]

//   //   var pieData1 = {
//   //     labels: tickers1,
//   //     datasets: [
//   //       {
//   //         backgroundColor: colors1,
//   //         borderColor: "rgba(220,220,220,1)",
//   //         data: quantities1
//   //     }
//   //   ]
//   //   }

//   //   var sampleData = [

//   //     {
//   //       label: "TWTR",
//   //       color: '#34495e',
//   //       value: 5
//   //     },
//   //     {
//   //       label: "MSFT",
//   //       color: "#27ae60",
//   //       value: 15
//   //     },
//   //     {
//   //       label: "TSLA",
//   //       color: "#5975CB",
//   //       value: 25
//   //     },
//   //     {
//   //       label: "FB",
//   //       color: "#3498db",
//   //       value: 25
//   //     }

//   //   ]

//   //   var chartInstance1 = new Chart(ctx, {
//   //       type: 'doughnut',
//   //       data: sampleData,
//   //       options: {
//   //           responsive: false,
//   //           maintainAspectRatio: false
//   //       }
//   //   });
//   //   console.log(sampleData)

//     var stock_ctx = document.getElementById("positions_sample_chart").getContext('2d');
//     var samplePie = new Chart(stock_ctx, {
//       type: 'doughnut',
//       data: {
//         labels: ["FB", "DIS", "MSFT", "TSLA", "AAPL", "TWTR", "LNKD"],
//         datasets: [{
//           backgroundColor: [
//             "#2ecc71",
//             "#3498db",
//             "#95a5a6",
//             "#9b59b6",
//             "#f1c40f",
//             "#e74c3c",
//             "#34495e"
//           ],
//           data: [12, 19, 3, 17, 28, 24, 7]
//         }],
//         options: {
//           responsive: false,
//           maintainAspectRatio: false

//         }
//       }
//     });



//     // ////////////////////////////////////////////////////////////////////////////////////////////////////
//     var valuation_context = document.getElementById('valuations_sample_chart');
//     var val_ctx = valuation_context.getContext("2d");

//     var valuation_amounts = [123.55, 124.45, 109.33, 111.11, 153.23, 145.45, 146.44, 140.45, 141.33];


//     var valuation_dates = ["2017-01-01T01:12:04.238-05:00","2017-01-01T01:40:03.856-05:00","2017-01-03T18:57:47.777-05:00", "2017-01-04T01:40:04.556-05:00", "2017-01-04T08:16:12.009-05:00", "2017-01-04T16:11:20.868-05:00", "2016-12-31T00:00:03.344-05:00", "2017-01-01T01:06:02.897-05:00", "2017-01-01T01:03:03.156-05:00"];


//     console.log(valuation_amounts);
//     console.log(valuation_dates);

//     var sampleValuations = new Chart(val_ctx, {

//         type: 'line',
//         data: {
//             labels: valuation_dates,
//           datasets: [{
//             data: valuation_amounts,
//             label: 'Portfolio amount',
//             backgroundColor: "rgba(100,149,237, 0.5)",
//             borderColor: "rgb(0,0,255)",
//             pointBorderColor: "rgb(0,0,255)",
//             pointBackgroundColor: "rgba(100,149,237, 0.5)",
//             spanGaps: true
//           }],
//           options: {
//             responsive: false,
//             maintainAspectRatio: false
//           }
//         }
//     });


// });