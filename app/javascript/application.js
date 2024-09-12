// Entry point for the build script in your package.json
import "./controllers"
import "@hotwired/turbo-rails"
import "trix"
import "@rails/actiontext"




// if (Rails.root.join("app/javascript/application.js")).exist?
// say "Import Stimulus controllers"
// append_to_file "app/javascript/application.js", %(import "./controllers"\n)
// else
// say %(You must import "./controllers" in your JavaScript entrypoint), :red
// end