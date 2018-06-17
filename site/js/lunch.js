let url_page = `http://127.0.0.1:5000/${id_day}/lunch`;


class UI {
    constructor() {
        this.rest_container = document.getElementById('container');
        this.wait = document.getElementById('wait');
        this.wait.textContent = '';
    }

    paint(http) {
        this.dish_sp = document.createElement('h3');
        this.dish_sp.className = 'special lunch';
        this.dish_sp.textContent = 'Today lunch special ';
        this.rest_container.appendChild(this.dish_sp);

        for (let i = 0; i < http.length; i++) {
            this.id_day = http[i].id_day;
            if (this.id_day !== 0) {
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

                if (http[i].recomended_wine !== null) {
                    this.wine = document.createElement('div');
                    this.wine.className = 'wine';
                    this.wine_href = document.createElement('a');
                    this.wine_href.className = 'wine_href';
                    this.wine_href.setAttribute('href', `wine.html?wine_id=${http[i].recomended_wine}`);
                    this.wine.appendChild(this.wine_href);
                    this.wine_name = document.createElement('div');
                    this.wine_name.className = 'wine_name';
                    this.wine_name.textContent = `is good with ${http[i].wine_name}`;
                    this.wine_href.appendChild(this.wine_name);
                    this.dish.appendChild(this.wine);
                }
                this.rest_container.appendChild(this.dish);
            }
        }
        this.dish_aa = document.createElement('h3');
        this.dish_aa.className = 'aa lunch';
        this.dish_aa.textContent = 'Always available princess favorites';
        this.rest_container.appendChild(this.dish_aa);

        for (let i = 0; i < http.length; i++) {
            this.id_day = http[i].id_day;
            if (this.id_day === 0) {
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

               if (http[i].recomended_wine !== null) {
                    this.wine = document.createElement('div');
                    this.wine.className = 'wine';
                    this.wine_href = document.createElement('a');
                    this.wine_href.className = 'wine_href';
                    this.wine_href.setAttribute('href', `wine.html?wine_id=${http[i].recomended_wine}`);
                    this.wine.appendChild(this.wine_href);
                    this.wine_name = document.createElement('div');
                    this.wine_name.className = 'wine_name';
                    this.wine_name.textContent = `is good with ${http[i].wine_name}`;
                    this.wine_href.appendChild(this.wine_name);
                    this.dish.appendChild(this.wine);
                    this.rest_container.appendChild(this.dish);
                }
            }
        }
    }
}

ui = new UI();