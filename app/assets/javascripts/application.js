// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require activestorage
//= require cocoon
//= require datatables
//= require bootstrap
//= require chosen-jquery
//= require_tree .

$(document).ready(function() {

  $(".dataTables").dataTable({
    "iDisplayLength": 50,
    responsive: true,
    bPaginate: false,
    bFilter: false
  });
  handleAdvanceSearch();
});
function handleAdvanceSearch() {
  $('#adv-search').click(function() {
    $('#adv-searchbox').toggle(300);
    icon = $('#adv-search').children('i');
    if (icon.hasClass('fa-angle-down')) {
      icon.removeClass('fa-angle-down').addClass('fa-angle-up')
    } else {
      icon.removeClass('fa-angle-up').addClass('fa-angle-down')
    }
  });
}