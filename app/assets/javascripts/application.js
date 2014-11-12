//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

if (window.location.href.indexOf('http://') === 0 && window.location.href.indexOf('.dev') < 0)
  window.location = window.location.href.replace('http://', 'https://');

$(function() { $(document).foundation() });
