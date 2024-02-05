// To see this message, add the following to the `<head>` section in your
// views/layouts/application.html.erb
//
//    <%= vite_client_tag %>
//    <%= vite_javascript_tag 'application' %>
console.log('Vite ⚡️ Rails')

// If using a TypeScript entrypoint file:
//     <%= vite_typescript_tag 'application' %>
//
// If you want to use .jsx or .tsx, add the extension:
//     <%= vite_javascript_tag 'application.jsx' %>

console.log('Visit the guide for more information: ', 'https://vite-ruby.netlify.app/guide/rails')


import '../../../node_modules/jquery/dist/jquery.js'

import '@hotwired/turbo-rails'

Turbo.start()

// Example: Load Rails libraries in Vite.
//
// import * as Turbo from '@hotwired/turbo'
// Turbo.start()
//
// import ActiveStorage from '@rails/activestorage'
// ActiveStorage.start()
//
// // Import all channels.
// const channels = import.meta.globEager('./**/*_channel.js')

// Example: Import a stylesheet in app/frontend/index.css
// import '~/index.css'

// CLOSE_TURBO_FRAME_BUTTON
document.addEventListener('click', function(event) {
    if (event.target.matches('.close-turbo-frame')) {
        const frameId = event.target.dataset.frameId;
        const frame = document.getElementById(frameId);
        if (frame) {
            frame.innerHTML = "";
        }
    }
});

$(document).on('click', '.close-flash', function() {
    $(this).parent().fadeOut(200);
});