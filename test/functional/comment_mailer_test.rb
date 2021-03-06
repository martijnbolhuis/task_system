require 'test_helper'

class CommentMailerTest < ActionMailer::TestCase
  setup do
    ActionMailer::Base.deliveries.clear
    @user = FactoryGirl.create :user
    @comment = FactoryGirl.create :comment_with_task_occurrence
    @community = FactoryGirl.create :community
  end

  should "Send posted e-mail correctly" do
    CommentMailer.posted(@community, @user, @comment).deliver
    assert ActionMailer::Base.deliveries.size == 1
  end
end
