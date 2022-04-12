// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from '@rails/ujs'
import Turbolinks from 'turbolinks'
import * as ActiveStorage from '@rails/activestorage'
import 'channels'

import ApexCharts from 'apexcharts'
window.ApexCharts = ApexCharts

// import 'bootstrap';
import * as bootstrap from 'bootstrap'
import '../stylesheets/application'
import 'bootstrap-icons/font/bootstrap-icons.css'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('turbolinks:load', () => {
  const popoverTriggerList = [].slice.call(
    document.querySelectorAll('[data-bs-toggle="popover"]')
  )
  const popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
    return new bootstrap.Popover(popoverTriggerEl)
  })

  const tooltipTriggerList = [].slice.call(
    document.querySelectorAll('[data-bs-toggle="tooltip"]')
  )
  const tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
  })
})

// change view to buy or sell
document.addEventListener('turbolinks:load', () => {
  const toggleBuyButton = document.querySelector('#toggle_buy_button')
  const toggleSellButton = document.querySelector('#toggle_sell_button')
  const toggleBuyContainer = document.querySelector('#buy_container')
  const toggleSellContainer = document.querySelector('#sell_container')
  toggleBuyButton.addEventListener('click', () => {
    toggleBuyButton.classList.toggle('active')
    toggleSellButton.classList.toggle('active')
    toggleBuyContainer.classList.toggle('d-none')
    toggleSellContainer.classList.toggle('d-none')
  })
  toggleSellButton.addEventListener('click', () => {
    toggleBuyButton.classList.toggle('active')
    toggleSellButton.classList.toggle('active')
    toggleBuyContainer.classList.toggle('d-none')
    toggleSellContainer.classList.toggle('d-none')
  })
})
