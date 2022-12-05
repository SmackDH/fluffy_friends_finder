# 🐕 Fluffy Friends Finder

A fun and heartwarming rental-app for pets.

<img src="https://user-images.githubusercontent.com/66011769/205549280-809000b0-7977-42da-a0c0-dadf8be3193a.png" width=50% height=50%> <img src="https://user-images.githubusercontent.com/66011769/205549292-e7c958cc-4f00-4266-8cd3-4ec1e732e05a.png" width=50% height=50%>



<br>

   

## Getting Started
### Setup

Install gems
```
bundle install
```
Install JS packages
```
yarn install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables. For any APIs, see group Slack channel.
```
CLOUDINARY_URL=your_own_cloudinary_url_key
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

## Built With
- [Rails 7](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Figma](https://www.figma.com) — Prototyping

## Team Members
- [Yumi Kimura](https://github.com/kimurayumixy)
- [Erika Ura](https://github.com/ErikaUra)
- [Soren Umstot](https://github.com/sumstot)

## License
This project is licensed under the MIT License
