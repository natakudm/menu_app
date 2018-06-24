let url_page = `http://${url_site}/${id_day}/breakfast`;


class UI{
    constructor(){
        this.rest_container = document.getElementById('container');
        this.wait = document.getElementById('wait');
        this.wait.textContent = '';
    }

    paint(http){
        this.restaurant = document.createElement('h2');
            this.restaurant.className = 'br_restaurant centered';
            this.restaurant.textContent = `Breakfast today in ${http[2].restaurant_name} dining room 
            from ${http[2].time_open.slice(0,5)} till ${http[2].time_close.slice(0,5)}`;
            this.rest_container.appendChild(this.restaurant);

        this.dish_sp = document.createElement('h3');
                this.dish_sp.className = 'breakfast centered';
                this.dish_sp.textContent = 'Today special ';
                this.rest_container.appendChild(this.dish_sp);

        for(let i = 0; i < http.length; i++) {
            this.id_day = http[i].id_day;
            if(this.id_day !== 0){
                this.dish = document.createElement('div');
                this.dish.className = 'menu_dish col-lg-6 col-md-6';
            this.dish_href = document.createElement('a');
                this.dish_href.className = 'dish_href';
                this.dish_href.setAttribute('href', `dish.html?dish_id=${http[i].id}`);
                this.dish.appendChild(this.dish_href);
            this.dish_name = document.createElement('h4');
                this.dish_name.className = 'dish_name centered';
                this.dish_name.textContent = http[i].name;
                this.dish_href.appendChild(this.dish_name);
            this.dish_image = document.createElement('img');
                this.dish_image.className = 'dish_img img-responsive img-rounded centered';
                this.dish_image.setAttribute('src', http[i].picture);
                this.dish.appendChild(this.dish_image);
            this.description = document.createElement('div');
                this.description.className = 'description';
                this.description.textContent = http[i].description;
                this.dish.appendChild(this.description);
            this.rest_container.appendChild(this.dish);
            }
        }
        this.clear = document.createElement('div');
        this.clear.className = 'clearfix';
        this.rest_container.appendChild(this.clear);

        this.dish_aa = document.createElement('h3');
            this.dish_aa.className = 'breakfast centered';
            this.dish_aa.textContent = 'Favorite breakfast choice';
            this.rest_container.appendChild(this.dish_aa);

        for(let i = 0; i < http.length; i++) {
            this.id_day = http[i].id_day;
            if(this.id_day === 0){
                this.dish = document.createElement('div');
                this.dish.className = 'menu_dish col-lg-6 col-md-6';

                if(http[i].picture !== null) {
                    this.dish_href = document.createElement('a');
                    this.dish_href.className = 'dish_href';
                    this.dish_href.setAttribute('href', `dish.html?dish_id=${http[i].id}`);
                    this.dish.appendChild(this.dish_href);
                    this.dish_name = document.createElement('h4');
                    this.dish_name.className = 'dish_name';
                    this.dish_name.textContent = http[i].name;
                    this.dish_href.appendChild(this.dish_name);
                } else {
                    this.dish_name = document.createElement('h4');
                    this.dish_name.className = 'dish_name';
                    this.dish_name.textContent = http[i].name;
                    this.dish.appendChild(this.dish_name);
                }
            this.description = document.createElement('div');
                this.description.className = 'description';
                this.description.textContent = http[i].description;
                this.dish.appendChild(this.description);
            this.rest_container.appendChild(this.dish);
            }
        }
    }
}

ui = new UI();
