let search_str = window.location.search.replace('?', '').split('&').reduce(
    function (p, e) {
        let a = e.split('=');
        p[decodeURIComponent(a[0])] = decodeURIComponent(a[1]);
        return p;
    },
    {}
);
console.log(search_str);
let id_wine = search_str.wine_id;

let url_page = `http://127.0.0.1:5000/wine/${id_wine}`;


class UI {
    constructor() {
        this.rest_container = document.getElementById('container');
        this.wait = document.getElementById('wait');
        this.wait.textContent = '';
    }

    paint(http) {
        this.wine = document.createElement('div');
            this.wine.className = 'wine';
        this.wine_name = document.createElement('h2');
            this.wine_name.className = 'wine_name';
            this.wine_name.textContent = http.name;
            this.wine.appendChild(this.wine_name);
        this.wine_image = document.createElement('img');
            this.wine_image.className = 'wine_img';
            this.wine_image.setAttribute('src', http.picture);
            this.wine.appendChild(this.wine_image);
        this.description = document.createElement('div');
            this.description.className = 'wine_description';
            this.description.textContent = http.description;
            this.wine.appendChild(this.description);
        if(http.price_for_glass !== 'None') {
            this.price_for_glass = document.createElement('div');
            this.price_for_glass.className = 'price_for_glass';
            this.price_for_glass.textContent = `Price is only ${http.price_for_glass}$ for glass`;
            this.wine.appendChild(this.price_for_glass);
        }
        this.price_for_bottle = document.createElement('div');
            this.price_for_bottle.className = 'price_for_bottle';
            this.price_for_bottle.textContent = `Only ${http.price_for_bottle}$ for bottle`;
            this.wine.appendChild(this.price_for_bottle);

        this.rest_container.appendChild(this.wine);
    }
}

ui = new UI();
