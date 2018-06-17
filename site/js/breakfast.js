let url_page = `http://127.0.0.1:5000/${id_day}/breakfast`;


class UI{
    constructor(){
        this.rest_container = document.getElementById('container');
        this.wait = document.getElementById('wait');
        this.wait.textContent = '';
    }

    paint(http){
        this.restaurant = document.createElement('div');
            this.restaurant.className = 'br_restaurant';
            this.restaurant.textContent = `Breakfast today in ${http[2].restaurant_name} dining room 
            from ${http[2].time_open.slice(0,5)} till ${http[2].time_close.slice(0,5)}`;
            this.rest_container.appendChild(this.restaurant);

        this.dish_sp = document.createElement('h3');
                this.dish_sp.className = 'special breakfast';
                this.dish_sp.textContent = 'Today special ';
                this.rest_container.appendChild(this.dish_sp);

        for(let i = 0; i < http.length; i++) {
            this.id_day = http[i].id_day;
            if(this.id_day !== 0){
                this.dish = document.createElement('div');
                this.dish.className = 'menu_dish special_br';
            this.dish_href = document.createElement('a');
                this.dish_href.className = 'dish_href';
                this.dish_href.setAttribute('href', `dish.html?dish_id=${http[i].id}`);
                this.dish.appendChild(this.dish_href);
            this.dish_name = document.createElement('h4');
                this.dish_name.className = 'dish_name';
                this.dish_name.textContent = http[i].name;
                this.dish_href.appendChild(this.dish_name);
            this.dish_image = document.createElement('img');
                this.dish_image.className = 'dish_img';
                this.dish_image.setAttribute('src', http[i].picture);
                this.dish.appendChild(this.dish_image);
            this.description = document.createElement('div');
                this.description.className = 'dish_description';
                this.description.textContent = http[i].description;
                this.dish.appendChild(this.description);
            this.rest_container.appendChild(this.dish);
            }
        }
        this.dish_aa = document.createElement('h3');
            this.dish_aa.className = 'aa breakfast';
            this.dish_aa.textContent = 'Favorite breakfast choice';
            this.rest_container.appendChild(this.dish_aa);

        for(let i = 0; i < http.length; i++) {
            this.id_day = http[i].id_day;
            if(this.id_day === 0){
                this.dish = document.createElement('div');
                this.dish.className = 'menu_dish special_br';
            this.dish_href = document.createElement('a');
                this.dish_href.className = 'dish_href';
                this.dish_href.setAttribute('href', `dish.html?dish_id=${http[i].id}`);
                this.dish.appendChild(this.dish_href);
            this.dish_name = document.createElement('h4');
                this.dish_name.className = 'dish_name';
                this.dish_name.textContent = http[i].name;
                this.dish_href.appendChild(this.dish_name);
            this.description = document.createElement('div');
                this.description.className = 'dish_description';
                this.description.textContent = http[i].description;
                this.dish.appendChild(this.description);
            this.rest_container.appendChild(this.dish);
            }
        }
    }
}

ui = new UI();
