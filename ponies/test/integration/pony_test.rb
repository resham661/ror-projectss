require 'test_helper'

class ponyTest < Capybara::Rails::TestCase
  def setup
    @one = ponies :one
    @two = ponies :two
  end

  test 'pony index' do
    visit ponies_path

    assert page.has_content?(@one.name)
    assert page.has_content?(@two.name)
  end
  
end
