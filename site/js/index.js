let url_page = 'http://127.0.0.1:5000/main';




class UI{
    constructor(){
        this.rest_container = document.getElementById('container');
        this.wait = document.getElementById('wait');
        this.wait.textContent = '';
    }

    paint(http){
        for(let i = 0; i < http.length; i++) {
        this.meal = document.createElement('div');
            this.meal.className = 'meal';
        this.rest_name = document.createElement('h2');
            this.rest_name.className = 'restaurant_name';
            this.rest_name.textContent = http[i].restaurant_name;
            this.meal.appendChild(this.rest_name);            
        this.rest_image = document.createElement('img');
            this.rest_image.className = 'restaurant_img';
        this.rest_time = document.createElement('div');
            this.rest_time.className = 'time_work';
        this.rest_location = document.createElement('div');
            this.rest_location.className = 'rest_location';
        this.menu_button = document.createElement('a');
            this.menu_button.textContent = 'Watch menu';

            this.rest_image.setAttribute('src', http[i].picture);
            this.meal.appendChild(this.rest_image);
            this.rest_time.textContent = `${http[i].time_open} - ${http[i].time_close}`;
            this.meal.appendChild(this.rest_time);
            this.rest_location.textContent = http[i].location;
            this.meal.appendChild(this.rest_location);
            if (http[i].meal_name === 'breakfast') {
                this.menu_button.setAttribute('href', `breakfast.html?id_day=${id_day}`);
                 this.meal.appendChild(this.menu_button);
            }
            this.rest_container.appendChild(this.meal);
        }
    }
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

