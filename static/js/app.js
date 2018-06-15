url_site = 'http://127.0.0.1:5000';

//  for display different menus for different days of the cruise set id_day
// now it is hardcoded, gonna be change after adding more days
localStorage.setItem('id_day', 1);

var id_day = localStorage.getItem('id_day');
console.log(id_day);
