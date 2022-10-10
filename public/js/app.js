var PieChart = function(){
  var container = document.getElementById("pieChart");
  var total = document.getElementById("num").innerText;
  var numbers = parseInt(total);

  var chart = new Highcharts.Chart({
    chart: {
      type: "pie",
      renderTo: container
    },
    title:{
      text: "Analysis"
    },
    series:[
    {
      name: "Type", 
        data: [{   
          name: "Fire", 
          y: numbers,
          color: "#ffac33"
        },
        {
          name: "Water",
          y: 25,
          color: "#73b7ff",
          sliced: true
        },
        { 
          name: "Grass", 
          y: 1,
          color: "#00ba2f"
        }] 
    }
    ]
  });
};

window.onload = function(){
  new PieChart();
}
