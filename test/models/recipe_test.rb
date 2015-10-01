require 'test_helper'
class RecipeTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.create(chefname: "Butch", email: "sootedninjas@gmail.com")
    @recipe = @chef.recipes.build(name: "Chicken Adobo", summary: "Best of the best Chicken Adobo", 
    description: "add chicken, vinegar, soy sauce and stew for 20 minutes")
  end
  
  test "Recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "chef_id required" do
    @recipe.chef_id = nil
    assert_not  @recipe.valid?
  end
  
  test "Name should be present" do
    @recipe.name = " "
    assert_not  @recipe.valid?
  end
  
  test "Name length too long" do
    @recipe.name = "a" * 101
    assert_not  @recipe.valid?
  end
  
  test "Name length too short" do
    @recipe.name = "a" * 4
    assert_not  @recipe.valid?
  end
  
  test "Summary should be present" do
    @recipe.summary = " "
    assert_not  @recipe.valid?
  end
  
  test "Summary length too long" do
    @recipe.summary = "a" * 151
    assert_not  @recipe.valid?
  end
  
  test "Summary length too short" do
    @recipe.summary = "a" * 9
    assert_not  @recipe.valid?
  end

  test "Description should be present" do
    @recipe.description = " "
    assert_not  @recipe.valid?

  end
  
  test "Description length too long" do
    @recipe.description = "a" * 501
    assert_not  @recipe.valid?
  end
  
  test "Description length too short" do
    @recipe.description = "a" * 19
    assert_not  @recipe.valid?
  end
end