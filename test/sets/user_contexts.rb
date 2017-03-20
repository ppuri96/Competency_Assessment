module Contexts
  module UserContexts

    # Create three Questions
    def create_user
      @userAdmin = FactoryGirl.create(:user)
      @user2 = FactoryGirl.create(:user, username: "user1", active: true)
      @user3 = FactoryGirl.create(:user, username: "user2", active: false)
    end

    # Destroy the question objects
    def remove_user
      @user1.destroy
      @user2.destroy
      @user3.destroy
    end

  end
end
