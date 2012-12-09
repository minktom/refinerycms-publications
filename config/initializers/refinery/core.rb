Refinery::Core.configure do |config|

  # Register extra javascript for backend
  config.register_javascript "refinery/admin/publications.js"

  #Register extra stylesheet for backend (optional options)
  config.register_stylesheet "refinery/admin/publications.css"
end