let search_str = window.location.search.replace('?', '').split('&').reduce(
    function (p, e) {
        let a = e.split('=');
        p[decodeURIComponent(a[0])] = decodeURIComponent(a[1]);
        return p;
    },
    {}
);
console.log(search_str);
let id_dish = search_str.dish_id;

let url_page = `http://${url_site}/dish/${id_dish}`;


class UI {
    constructor() {
        this.rest_container = document.getElementById('container');
        this.wait = document.getElementById('wait');
        this.wait.textContent = '';
    }

    paint(http) {
        this.dish = document.createElement('div');
            this.dish.className = 'dish';
        this.dish_image = document.createElement('img');
            this.dish_image.className = 'dish_img img-responsive img-rounded  col-lg-6 col-md-6';
            this.dish_image.setAttribute('src', http.picture);
            this.dish.appendChild(this.dish_image);
        this.dish_name = document.createElement('h2');
            this.dish_name.className = 'dish_name  col-lg-6 col-md-6';
            this.dish_name.textContent = http.name;
            this.dish.appendChild(this.dish_name);
        this.description = document.createElement('div');
            this.description.className = 'description dish_description';
            this.description.textContent = http.description;
            this.dish.appendChild(this.description);
        this.restaurant_name = document.createElement('div');
            this.restaurant_name.className = 'restaurant_name';
            this.restaurant_name.textContent = `Served in ${http.restaurant_name} dining room for ${http.meal_name}`;
            this.dish.appendChild(this.restaurant_name);

        if (http.recomended_wine !== null) {
            this.wine = document.createElement('div');
            this.wine.className = 'wine';
            this.wine_href = document.createElement('a');
            this.wine_href.className = 'wine_href';
            this.wine_href.setAttribute('href', `wine.html?wine_id=${http.recomended_wine}`);
            this.wine.appendChild(this.wine_href);
            this.wine_name = document.createElement('div');
            this.wine_name.className = 'wine_name';
            this.wine_name.textContent = `is good with ${http.wine_name}`;
            this.wine_href.appendChild(this.wine_name);
            this.dish.appendChild(this.wine);
        }
        this.rest_container.appendChild(this.dish);
    }
}

ui = new UI();
