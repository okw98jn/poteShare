// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

    const target = document.getElementById("user_image");
    const nav_menu = document.getElementById("nav_menu");

    target.addEventListener('click', () => {
    nav_menu.classList.toggle('header_nav_menu_on_off');
    });










