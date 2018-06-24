let url_page = `http://${url_site}/restaurants`;


class UI{
    constructor(){
        this.rest_container = document.getElementById('container');
        this.wait = document.getElementById('wait');
        this.wait.textContent = '';
    }

    paint(http){
        for(let i = 0; i < http.length; i++) {
            if(i%2 === 0 && i !==0){
                this.clear = document.createElement('div');
                this.clear.className = 'clearfix';
                this.rest_container.appendChild(this.clear);
            }
        this.restaurant = document.createElement('div');
            this.restaurant.className = 'restaurant col-lg-6 col-md-6';
        this.restaurant_name = document.createElement('h2');
            this.restaurant_name.className = 'restaurant_name';
            this.restaurant_name.textContent = '' + http[i].name;
            this.restaurant_name.setAttribute('id', `rest_id_${http[i].id}`);
            this.restaurant.appendChild(this.restaurant_name);
        this.rest_image = document.createElement('img');
            this.rest_image.className = 'restaurant_img centered img-responsive img-rounded';
            this.rest_image.setAttribute('src', http[i].picture);
            this.restaurant.appendChild(this.rest_image);
        this.restaurant_type = document.createElement('div');
            this.restaurant_type.className = 'restaurant_type';
            this.restaurant_type.textContent = ' Dining Style: ' + http[i].restaurant_type;
            this.restaurant.appendChild(this.restaurant_type);
        this.description = document.createElement('div');
            this.description.className = 'description';
            this.description.textContent = http[i].description;
            this.restaurant.appendChild(this.description);
        this.rest_location = document.createElement('div');
            this.rest_location.className = 'location';
            this.rest_location.textContent = http[i].location;
            this.restaurant.appendChild(this.rest_location);
        this.rest_price = document.createElement('div');
            this.rest_price.className = 'rest_price price';
            this.rest_price.textContent = http[i].price;
            if(this.rest_price.textContent !== 'None') {
                this.rest_price.textContent = `Cover charge is ${http[i].price}$ per person`;
                this.restaurant.appendChild(this.rest_price);
            }
        this.rest_container.appendChild(this.restaurant);
        }
    }
}

ui = new UI();
