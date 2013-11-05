Given /the following categories exist/ do |categories_table|
  categories_table.hashes.each do |category|
    _new_category = Category.new
    _new_category.name = category[:title]
    _new_category.permalink = category[:permalink]
    _new_category.keywords = category[:keywords]
    _new_category.description = category[:description]
    _new_category.save!
  end
end

When /I am creating a new category/ do
  visit "/admin/categories/new"
end

When /I am editting category \"(.*)\"/ do |category_name|
  _category = Category.find_by_name(category_name)
  _uri = "/admin/categories/edit/#{_category.id}"
  visit _uri
end

Then /I should not be able to edit a non-existent category/ do
  _id = 1
  _id += 1 while Category.find_by_id(_id) != nil
  _uri = "/admin/categories/edit/#{_id}"
  begin
    visit _uri
    raise RuntimeError, "Category should have have existed"
  rescue ActiveRecord::RecordNotFound
  end
end
