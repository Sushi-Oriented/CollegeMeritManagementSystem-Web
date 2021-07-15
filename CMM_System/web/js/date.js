/*
@author mhafizkn
*/
var days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

var today = new Date();
var dat = days[today.getDay()]+','+ today.getDate() +'-'+ (today.getMonth()+1) +'-'+ today.getFullYear();
var time = (today.getHours()<10?'0':'') + today.getHours() + ":" + (today.getMinutes()<10?'0':'') + today.getMinutes() + ":" + (today.getSeconds()<10?'0':'') + today.getSeconds();
var dateTime = dat+' '+time;

document.getElementById("date").innerHTML = dateTime;