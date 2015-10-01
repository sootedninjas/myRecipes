require 'test_helper'
class ChefTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.new(chefname: "Butch Pornebo", email: "sootedninjas@gmail.com")
  end
  
  test "Chef should be valid" do
    assert @chef.valid?
  end
  
  test "chef Name should be present" do
    @chef.chefname = " "
    assert_not  @chef.valid?
  end
  
  test "chef Name length too long" do
    @chef.chefname = "a" * 41
    assert_not  @chef.valid?
  end
  
  test "chef Name length too short" do
    @chef.chefname = "a" * 2
    assert_not  @chef.valid?
  end
  
  test "email should be present" do
    @chef.email = " "
    assert_not  @chef.valid?
  end
  
  test "email length too long" do
    @chef.email = "a" * 101
    assert_not  @chef.valid?
  end
  
  test "email must be unique" do
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end
  
end