$(function() {
  var API_KEY = '6b3899b9b1258ae48ae06550a267c505'
  var city = 'Japan'
  var url = 'https://api.openweathermap.org/data/2.5/forecast?q=' + city + ',jp&units=metric&APPID=' + API_KEY;
  $.ajax({
    url: url,
    dataType: "json",
    type: 'GET',
  })
  .done(function(data) {
    var insertHTML = "";
    var cityName = '<h2>' + data.city.name + '</h2>';
    $('#city-name').html(cityName);
    for (var i = 0; i <= 32; i = i + 12) {
      insertHTML += buildHTML(data, i);
    }
    $('#weather').html(insertHTML);
  })
  .fail(function(data) {
    console.log("失敗しました");
  });

  function buildHTML(data, i) {
    var Week = new Array("（日）","（月）","（火）","（水）","（木）","（金）","（土）");
    var date = new Date (data.list[i].dt_txt);
    date.setHours(date.getHours() + 9);
    var month = date.getMonth()+1;
    var day = month + "/" + date.getDate() + Week[date.getDay()] 
    var icon = data.list[i].weather[0].icon;
    var html =
    '<div class="weather-report">' +
      '<img src="https://openweathermap.org/img/w/' + icon + '.png">' +
      '<span class="weather-date">' + day + '</span>' +
      '<span class="weather-temp">' + Math.round(data.list[i].main.temp) + '℃</span' +
    '</div>';
    return html
  }
});