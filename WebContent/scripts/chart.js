$(function () {
	$.ajax({
		url: "ChartsController",
		data: { op: "salle" },
		type: 'POST',
		success: function (data, textStatus, jqXHR) {
      fill(data);
		},
		error: function (jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown, jqXHR);
		}
	});
	$.ajax({
		url: "ChartsController",
		data: { op: "monthly" },
		type: 'POST',
		success: function (data, textStatus, jqXHR) {
			fill2(data);
		},
		error: function (jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown, jqXHR);
		}
	});
});

function fill(c) {
  var labels = [];
  var  values = [];

  for( var name in c){
    labels.push(name);
    values.push(c[name]);
  }

  const data = {
    labels: labels,
    datasets: [{
      label: 'nombres de reservation ',
      backgroundColor: [
            'rgba(255, 99, 132, 0.6)',
            'rgba(54, 162, 235, 0.6)',
            'rgba(255, 206, 86, 0.6)',
            'rgba(75, 192, 192, 0.6)',
            'rgba(153, 102, 255, 0.6)',
            'rgba(255, 159, 64, 0.6)',
            'rgba(255, 99, 132, 0.6)'
          ],
      borderColor: 'rgb(255, 99, 132)',
      hoverBorderWidth:3,
      hoverBorderColor:'#000',
      data: values ,
    }]
  };

  const config = {
    type: 'line',
    data: data,
    options: {
	responsive: false,

}
  };
  const myChart = new Chart(
    $('#MyChart'),
    config
  );
  }
  function fill2(c) {
    var labels = [];
    var  values = [];
  
    for( var name in c){
      var month = name.getUTCMonth() + 1; //months from 1-12
      var year = name.getUTCFullYear();
      labels.push(month+"-"+year);
      values.push(c[name]);
    }
  
    const data = {
      labels: labels,
      datasets: [{
        label: 'nombres de reservation ',
        backgroundColor: 
           ['rgba(255, 99, 132, 0.6)',
            'rgba(54, 162, 235, 0.6)'
        ],
        borderColor: 'rgb(255, 99, 132)',
        hoverBorderWidth:3,
        hoverBorderColor:'#000',
        data: values ,
      }]
    };
  
    const config = {
      type: 'line',
      data: data,
      options: {}
    };
    const myChart = new Chart(
      $('#Monthly'),
      config
    );
    }