require 'rails'

class WelcomeRailtie < Rails::Railtie
  initializer "welcome_railtie.boot" do
    show_welcome_message
  end

  def show_welcome_message
    puts "\nWelcome to Gearkata!\n\n"
  end
end
