require 'test_helper'

class CommentTest < ActiveSupport::TestCase
   test "humanized rating" do
    u = FactoryGirl.create(:user)
    comment = FactoryGirl.create(:comment, :rating => '1_star')
    expected = 'one star'
    actual = comment.humanized_rating
    assert_equal expected, actual
   end
end
