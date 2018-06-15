url_site = 'http://127.0.0.1:5000/main';

//  for display different menus for different days of the cruise set id_day, gonna be change after adding more days
localStorage.setItem('id_day', 1);
let id_day = localStorage.getItem('id_day');

// let xhr = new XMLHttpRequest();
//
// xhr.open('GET', url_site, false);
//
// console.log(xhr.status)
// xhr.onload = function(){
//         let main = JSON.parse(this.responseText);
//         console.log(main);
// };
// xhr.send();
// xhr.onerror = function() {
//     console.log('Error downloading api')
// };

function httpGetAsync(theUrl, callback) {
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.onreadystatechange = function() {
        if (xmlHttp.readyState == 4 && xmlHttp.status == 200)
            callback(xmlHttp.responseText);
    }
    xmlHttp.open("GET", theUrl, true); // true for asynchronous
    xmlHttp.send(null);
}
httpGetAsync(url_site, function(response) {
    console.log(response);
});
