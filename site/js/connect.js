//  for display different menus for different days of the cruise set id_day, gonna be change after adding more days
localStorage.setItem('id_day', 1);
let id_day = localStorage.getItem('id_day');

class Connect{
    get(url){
        return new Promise((resolve, reject) => {
            fetch(url)
            .then(res => res.json())
                .then(data => resolve(data))
              .catch(err => reject(data))
        });
    }
}
document.addEventListener('DOMContentLoaded', getData);

http = new Connect;

function getData() {
    http.get(url_page)
        .then(result => {ui.paint(result)})
        .catch(err => console.log(err));
}



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// let xhr = new XMLHttpRequest();
//
// xhr.open('GET', url_site, true);
// xhr.send();
//
// xhr.onload = function(){
//         let main = JSON.parse(this.responseText);
//         console.log(main);
// };
//
// xhr.onerror = function() {
//     console.log('Error downloading api')
//};
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// function httpGetAsync(theUrl, callback) {
//     var xmlHttp = new XMLHttpRequest();
//     xmlHttp.onreadystatechange = function() {
//         if (xmlHttp.readyState == 4 && xmlHttp.status == 200)
//             callback(xmlHttp.responseText);
//     }
//     xmlHttp.open("GET", theUrl, true); // true for asynchronous
//     xmlHttp.send(null);
// }
// httpGetAsync(url_site, function(response) {
//     console.log(response);
// });
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
