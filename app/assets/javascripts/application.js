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
//= require activestorage
//= require turbolinks
//= require_tree .

console.log('Welcome!');

const indexPagination = (dogArr) => {
  let numPages = Math.ceil(dogArr.length / 5);
  let picturesPerPage = {};


  let i = 1;
  let prevIndex = 0;
  let lastIndex = 5;
  let pageNumsElement = document.getElementById('index-page-numbers');

  while(i <= numPages){
    let aTag = document.createElement('a');
    aTag.innerText = `${i}`
    pageNumsElement.appendChild(aTag)
    picturesPerPage[i] = dogArr.slice(prevIndex, lastIndex)
    prevIndex += 5
    lastIndex += 5
  }

  



};
