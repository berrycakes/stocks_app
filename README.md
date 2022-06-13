# **Stocks App**

![Ruby 3.0.3](https://img.shields.io/badge/Ruby-%3E%3D3.0.3-red) ![Rails 6.1.4.6](https://img.shields.io/badge/Rails-6.1.4.6-red) ![Yarn 1.22.10](https://img.shields.io/badge/Yarn-1.22.10-%232188b6%3B) ![PostgrSQL 12.9](https://img.shields.io/badge/PostgreSQL-12.9-%23336791) ![Bootstrap 5.1.3](https://img.shields.io/badge/Bootstrap-5.1.3-%236610f2)

## **About the project**

The stocks app is a project from Avion School that allows a user-trader to simulate buying and selling of cryptocurrency coins.

### **App Views**

#### **Home page**

![homepage][homepage_pic]

#### **Coin page**

![trade_coins][coins_page_pic]

#### **Portfolio page**

![portfolio][portfolio_pic]

## **Key Features**

- Allows a user to create an account so they can start trading cryptocurrency coins/stocks.
- Buy or sell a coin/stock at its current price.
- Allows a trader to sort or search for a coin/stock by their name or symbol.
- Allows a trader to add a watchlist for coins they want to stay updated to.
- Shows the portfolio of the coins/stocks that the trader currently possesses along with the current profit/loss of the asset.
- Shows all the transactions that the trader has made.

## **Other Features**

- Sends a confirmation email to confirm the email address of the user
- Allows an admin to approve a trader before they can start trading
- Sends an email to the trader when they are approved.
- Allows an admin to create and edit a trader.
- Allows an admin to see all the traders and transactions made in the app.
- Allows an admin to see all traders with pending account approval in one page.

## **ERD**

![ERD][erd_pic]

## **Live Demo**

Check out the live demo of the app in the link below:

[Stocks App](https://stocks-app-avion-project.herokuapp.com)

## **Getting Started**

### **Prerequisites**

The setups steps expect the Builds listed above to be installed on the system

### **Instructions**

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

- Clone the repository and navigate to main app directory

```bash
git clone https://github.com/berrycakes/stocks_app.git
cd stocks_app
```

- Install libraries and dependencies

```bash
bundle install
yarn install
```

- Initialize the database

```bash
rails db:create
rails db:migrate
rails db:seed
```

- Run the server

```bash
rails server
```

## **Environment**

[Coingecko API](https://www.coingecko.com/en/api/documentation)

## **System dependencies**

### **Gems**

- Devise 4.8.1
- Rspec-rails 5.0.0
- Factory_bot_rails 6.2.0
- Httparty 0.20.0
- Erb2haml 0.1.5
- haml 5.2.2
- Apexcharts 0.1.10
- Kaminari 1.2.2
- Ransack 3.0.1

## Roadmap

- [ ] Create wrapper for coingecko api
- [ ] Sorting of stocks by other parameters
- [ ] User authorization
- [ ] Automatically generated password when an admin creates a trader

[homepage_pic]: docs/img/homepage.png
[coins_page_pic]: docs/img/coins_page.png
[portfolio_pic]: docs/img/portfolio.png
[erd_pic]: docs/img/stocks_erd.png
