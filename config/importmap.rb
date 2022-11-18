# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.6.1/dist/jquery.js"
pin "tom-select", to: "https://ga.jspm.io/npm:tom-select@2.2.2/dist/js/tom-select.complete.js", preload: true

pin_all_from "app/javascript/controllers", under: "controllers"

pin "trix"
pin "@rails/actiontext", to: "actiontext.js"
