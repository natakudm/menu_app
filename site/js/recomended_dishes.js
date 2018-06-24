let url_page = `http://${url_site}/${id_day}/dishes`;


class UI {
    constructor() {
        this.rest_container = document.getElementById('container');
        this.wait = document.getElementById('wait');
        this.wait.textContent = '';
    }

    paint(http) {
        for (let i = 0; i < http.length; i++) {
            this.dish = document.createElement('div');
                this.dish.className = 'dish col-lg-6 col-md-6';
                this.dish_name = document.createElement('h2');
            this.dish_name.className = 'dish_name centered';
                this.dish_name.textContent = http[i].name;
                this.dish.appendChild(this.dish_name);

            if(http[i].picture !== null) {
                this.dish_image = document.createElement('img');
                this.dish_image.className = 'dish_img img-responsive img-rounded centered';
                this.dish_image.setAttribute('src', http[i].picture);
                this.dish.appendChild(this.dish_image);
            }
            this.description = document.createElement('div');
                this.description.className = 'description';
                this.description.textContent = http[i].description;
                this.dish.appendChild(this.description);
            this.restaurant_name = document.createElement('div');
                this.restaurant_name.className = 'restaurant_name';
                this.restaurant_name.textContent = `Served in ${http[i].restaurant_name} dining room for ${http[i].meal_name}`;
                this.dish.appendChild(this.restaurant_name);

            if (http[i].recomended_wine !== null) {
                this.wine = document.createElement('div');
                this.wine.className = 'wine';
                this.wine_href = document.createElement('a');
                this.wine_href.className = 'wine_href';
                this.wine_href.setAttribute('href', `wine.html?wine_id=${http[i].recomended_wine}`);
                this.wine.appendChild(this.wine_href);
                this.wine_name = document.createElement('div');
                this.wine_name.className = 'wine_name';
                this.wine_name.textContent = `Is good with ${http[i].wine_name}`;
                this.wine_href.appendChild(this.wine_name);
                this.dish.appendChild(this.wine);
            }
         this.rest_container.appendChild(this.dish);
            }
        }

}

ui = new UI();
