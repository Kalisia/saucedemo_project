class LoginPage < SitePrism::Page
    set_url 'https://www.saucedemo.com/'
  
    element :username_field, '#user-name'
    element :password_field, '#password'
    element :login_button, '#login-button'
  
    def fill_credentials(username, password)
      username_field.set(username)
      password_field.set(password)
    end
  
    def submit_login
      login_button.click
    end
  
    def login_with_valid_credentials
      fill_credentials('standard_user', 'secret_sauce')
      submit_login
    end
  
    def login_with_invalid_credentials
      fill_credentials('standard_user', 'secret')
      submit_login
    end
  
    def login_with_blank_credentials
      submit_login
    end
  
    def has_products_page?
      has_content?('Products')
    end
  
    def has_invalid_login_error?
      has_text?('Epic sadface: Username and password do not match any user in this service')
    end
  
    def has_missing_credentials_error?
      has_text?('Epic sadface: Username is required')
    end
  end
  