// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"
import $ from 'jquery';
window.$ = $
import './utility/direct_upload'
import './utility/custom'
import './utility/modals'
import './utility/init'
import Rails from "@rails/ujs"
import * as bootstrap from "bootstrap"
require("jquery") 
require("jquery_ujs")
import $ from 'jquery';
global.$ = jQuery;

Rails.start()


