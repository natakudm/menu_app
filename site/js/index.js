let url_page = 'http://127.0.0.1:5000/main';

let rest_container = document.getElementById('container');
//const meal = document.querySelector('meal');
const remove = document.getElementById('wait');


class UI{
    constructor(){
        this.rest_name = document.createElement('h2');
            this.rest_name.className = 'restaurant_name';
        this.rest_image = document.createElement('img');
            this.rest_image.className = 'restaurant_img';
        this.rest_time = document.createElement('div');
            this.rest_time.className = 'time_work';
        this.rest_location = document.createElement('div');
            this.rest_location.className = 'rest_location';
        this.menu_button = document.createElement('a');
            this.menu_button.textContent = 'Watch menu';
    }

    paint(http){
        //for(let i = 0; i < http.length; i++) {
            this.rest_name.textContent = http[0].restaurant_name;
            //  meal.textContent = http[0].restaurant_name;
            rest_container.appendChild(this.rest_name);
            this.rest_image.setAttribute('src', http[0].picture);
            rest_container.appendChild(this.rest_image);
            this.rest_time.textContent = `${http[0].time_open} - ${http[0].time_close}`;
            rest_container.appendChild(this.rest_time);
            this.rest_location.textContent = http[0].location;
            rest_container.appendChild(this.rest_location);
            if (http[0].meal_name = 'breakfast') {
                this.menu_button.setAttribute('href', `breakfast.html?id_day=${id_day}`);
            }
            rest_container.appendChild(this.menu_button);
        }
   // }
}

ui = new UI();



// Other version /////////////////////////////////////////////////////////////////////////////////////////////////////
// function getPage(url) {
//     fetch(url)
//         .then(result => {
//             console.log(result);
//             return result.json();
//         })
//         .then(data => {
//             //console.log(data)
//             const first = data[0];
//             return first;
//            // console.log(first);
//         })
//         .catch(error => console.log(error));
// }
// console.log(getPage(url_page));
//
// async function getPage(url) {
//     const result = await fetch(url);
//     const data = await result.json();
//     console.log(data);
// }

