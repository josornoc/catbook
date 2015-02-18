// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
// = require jquery
// = require jquery_ujs
// = require turbolinks
// = require_tree

// var url = "http://192.168.0.67:3000/api/v1/cats"

var url = "http://192.168.1.65:3000/api/v1/cats/1";
var xhr = new XMLHttpRequest();

function ajax(url, callback){
  xhr.open("GET", url);  
  xhr.send(); 
  xhr.onload = function(response){
  	callback(response);
  }
}

function responseHandler(response){
	var response = JSON.parse(this.responseText);
  console.log(response);
}

ajax(url, responseHandler);	