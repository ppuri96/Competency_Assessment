require 'test_helper'

class ResourceTest < ActiveSupport::TestCase

  # Test Relationships
  should belong_to(:paradigm)
  should have_many(:indicator_resources)
  should have_many(:indicators).through(:indicator_resources)

  # Test Validations
  should validate_presence_of(:title)

  # Test scopes
  context "With a proper context" do
    setup do
      create_paradigms
      create_resources
    end

    teardown do
      remove_resources
      remove_paradigms
    end

    should "show that all resources are created properly" do
      assert_equal false, @comm_dumm.nil?
      assert_equal "How to Succeed in Business", @success.title
      assert_equal "How to Fail in Business", @failure.title
      assert_equal "Public Speaking 101 Workshop", @pub_speak.title
    end

    should "have all resources listed alphabetically" do
      assert_equal ["Communication Skills for Dummies", "How to Fail in Business", "How to Succeed in Business", "Public Speaking 101 Workshop"], Resource.alphabetical.map  { |e| e.title }
    end

    should "show link without 'http://' is reformated" do
      assert_equal "http://www.google.com", @comm_dumm.link
    end

  end


end
