require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]

  setup
    @pony = Pony.new  
  end
  
  test 'creating new pony' do
    visit new_pony_url

    assert_selelctor "hi", "new pony"

    profesion = "This is my test post"
    fill_in 'post[profesion]', profesion
    click_button 'Create Pony'
    
    assert_text profesion
  end
end
