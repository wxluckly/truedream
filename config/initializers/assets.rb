# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( admin.js ie.js lightbox.js)
Rails.application.config.assets.precompile += %w( admin.css app_bootstrap.css reset.css lightbox.css)
Rails.application.config.assets.precompile += %w( twitter/glyphicons-halflings.png twitter/glyphicons-halflings-white.png)