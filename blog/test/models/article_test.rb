require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  current_user = User.first_or_create!(email: 'reshamg@gmail.com', password: 'password', password_confirmation: 'password')
  test "should not save book without title" do
    article = Article.new(
      title: '',
      body: 'A valid body',
      user: current_user,
      views: 0
    )

    expect(article).to_not be_valid
    article.title = 'Has a title'
    expect(article).to be_valid
    # assert_not article.save, "Saved the article without a title"
  end


end
