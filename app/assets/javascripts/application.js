// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .
$(document).ready(function(){
  // $('#login').modal('toggle')
  $("[rel=tooltip]").tooltip();

  // $('#select-district').html("<option value=''>İl Seçiniz</option>");
  $('#select-city').change(function() {

    var data=$('#select-city').val();

    $.ajax({
      type: "GET",
      url: "/dynamic_districts/" + data,
      datatype: "json",
      data: data,

      success: function(response) {
        $('#select-district').empty();
        for(var i in response ) {
          $('#select-district').append($("<option></option>").attr("value", response[i]['id'] ).text(response[i]['district'] ));
        };
      },
      error: function(response) {
        $('#select-district').html("<option value=''>İlçelere Ulaşılamadı</option>");
      }
    });
  });
});
