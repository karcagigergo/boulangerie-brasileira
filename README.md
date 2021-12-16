<h1 align="center">Boulangerie Brasileira 🧁</h1>

Boulangerie Brasileira is an app for local bakeries to sell their pastry online.

A project created during our coding bootcamp with the help of Rails, Cloudinary and Unsplash API's. [Boulangerie Brasileira](https://boulangerie-brasileira.herokuapp.com/)

### ✔ Specs:

- Rails (rails 6.0.3);
- Ruby (ruby 3.0.0)
- psql (PostgreSQL 12.4) - database;
- pundit (2.1.1) - authorization;
- devise (4.8.0) - for user authentication;
- cloudinary (1.16.1;)

### 💡 How to install:

1. - clone the project and create your own repository:
     `git clone git@github.com:karcagigergo/boulangerie-brasileira.git --origin challenge-api your-project-name your-project-name git init . git add . git commit hub create`
2. - install dependencies:
     `bundle install yarn install`

### 🕹 How to use:

1. Create a profile and choose whether you are a customer, who buys, or a bake who sells.

2. In a case when you are a customer, you only can buy products by putting them into your basket and do a checkout.

3. If you're a baker, you can add your products to the product page and sell them. CRUD manipulation is also available but only on your own products!

4. Upon uploading your pastries (or other food) you need to choose a name, a price, a description, available quantity and a photo for it.

5. 📌 Option A: If you'd like your own photo, you can upload it and it will be shown on the products#index and also product#show pages (thanks to [Cloudinary API](https://cloudinary.com/)).

6. 📌 Option B: You don't necassarily have to upload your own photo.According to the name given to your product, the web application will fetch data (in this case a picture) through the [Unsplash API](https://unsplash.com/developers), and automatically upload a picture for your product. **_(Just make sure that you spell the name correctly and it's in english)_**

### DISCLAIMER:

This application was made by [Sebastien Prat](https://www.linkedin.com/in/sebastien-prat/), [Eduardo Scovino](https://www.linkedin.com/in/eduardo-scovino-943461b8/), and [Gergő Karcagi](https://www.linkedin.com/in/karcagigergo/) as a part of our 6 month bootcamp at **Le Wagon - RJ, Batch #540**

_This Rails app was generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team._
