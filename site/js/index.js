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
        this.meal_name = document.createElement('h2');
            this.meal_name.className = 'meal_name ' + http[i].meal_name;
            if(this.meal_name.className === 'meal_name dinner' && this.meal_name.className === `meal_name ${http[i-1].meal_name}`)
                this.meal_name.textContent = '';
            else {
                this.meal_name.textContent = http[i].meal_name + ' time';
                this.meal.appendChild(this.meal_name);
            }
        this.link_rest = document.createElement('a');
            this.link_rest.className = 'link_rest';
            this.link_rest.setAttribute('href', `restaurants.html#${http[i].id}`);
                this.rest_name = document.createElement('h3');
                    this.rest_name.className = 'restaurant_name';
                    this.rest_name.textContent = http[i].restaurant_name;
                    this.link_rest.appendChild(this.rest_name);
                this.rest_image = document.createElement('img');
                    this.rest_image.className = 'restaurant_img';
                    this.rest_image.setAttribute('src', http[i].picture);
                    this.link_rest.appendChild(this.rest_image);
            this.meal.appendChild(this.link_rest);
        this.rest_time = document.createElement('div');
            this.rest_time.className = 'time_work';
            this.time_close = http[i].time_close;
            if(this.time_close !== 'None')
                this.rest_time.textContent = `${http[i].time_open.slice(0,5)} - ${this.time_close.slice(0,5)}`;
            else
                this.rest_time.textContent = `Open for sitting at ${http[i].time_open.slice(0,5)}`;
            this.meal.appendChild(this.rest_time);
        this.rest_location = document.createElement('div');
            this.rest_location.className = 'rest_location';
            this.rest_location.textContent = http[i].location;
            this.meal.appendChild(this.rest_location);
        this.menu_button = document.createElement('a');
            this.menu_button.textContent = 'Watch menu';
            if (http[i].meal_name === 'breakfast') {
                this.menu_button.setAttribute('href', 'breakfast.html');

            } else if (http[i].meal_name === 'lunch'){
                this.menu_button.setAttribute('href', 'lunch.html');
            } else {
                this.menu_button.setAttribute('href',
                    `dinner_restaurant.html?meal_name=${http[i].meal_name}&restaurant_type=${http[i].restaurant_type}`);
            }

            this.meal.appendChild(this.menu_button);
        this.rest_container.appendChild(this.meal);
        }
    }
}

ui = new UI();
