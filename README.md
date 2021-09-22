# Flutter Kiosk

A sample kiosk app inspired by [Cuberto's design](https://www.behance.net/gallery/84835219/McDonalds-Kiosk-Redesign). The kiosk has 2 parts

 1. Strapi for backend and Restful API
 2. Kiosk app

## How to run Strapi Kiosk backend

Kiosk backend use Strapi as a Restful API server.

 * Username : `noreply@redlinesoft.net`
 * Password : `Admin123`

Plugins

 * Swagger API document
 * GraphQL

Install dependency use `yarn`

`yarn install`

Run Strapi

`yarn develop`


## Todos

Mobile Kiosk

 * Change item quantity
 * Edit quantity in menu page and order page
 * QR Payment

Strapi

 * Nginx reverse proxy and cache
 * Docker compose / charm file

