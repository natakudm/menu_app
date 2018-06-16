let url_page = 'http://127.0.0.1:5000/main';

http = new Connect;

class Page{

}


class UI{
    constructor(){
        this.rest_name = document.getElementById('restaurant_name');
        this.rest_image = document.getElementById('restaurant_image');
        this.rest_time = document.getElementById('time_work');
        this.rest_location = document.getElementById('location');
    }

    paint(http){
        //console.log(http);
        this.rest_name.textContent = http[0].restaurant_name;
        this.rest_image.setAttribute('src', http[0].picture);
        this.rest_time.textContent = http[0].time_open;
        this.rest_location.textContent = http[0].location;
    }
}

ui = new UI();
