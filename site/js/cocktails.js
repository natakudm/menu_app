let url_page = `http://${url_site}/${id_day}/cocktails`;

class UI {
    constructor() {
        this.rest_container = document.getElementById('container');
        this.wait = document.getElementById('wait');
        this.wait.textContent = '';
    }

    paint(http) {
        for (let i = 0; i < http.length; i++) {
            this.cocktail = document.createElement('div');
                this.cocktail.className = 'cocktail col-lg-6 col-md-6';
            this.cocktail_name = document.createElement('h2');
                this.cocktail_name.className = 'cocktail_name';
                this.cocktail_name.textContent = http[i].name;
                this.cocktail.appendChild(this.cocktail_name);
            this.cocktail_image = document.createElement('img');
                this.cocktail_image.className = 'cocktail_img img-responsive img-rounded centered';
                this.cocktail_image.setAttribute('src', http[i].picture);
                this.cocktail.appendChild(this.cocktail_image);
            this.description = document.createElement('div');
                this.description.className = 'description';
                this.description.textContent = http[i].description;
                this.cocktail.appendChild(this.description);
            this.price = document.createElement('div');
                this.price.className = 'price';
                this.price.textContent = `Only ${http[i].price}$ for glass`;
                this.cocktail.appendChild(this.price);

            this.rest_container.appendChild(this.cocktail);
        }
    }

}

ui = new UI();
