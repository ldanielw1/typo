Given /^I am logged in as admin$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'admin'
  fill_in 'user_password', :with => 'aaaaaaaa'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

Given /^I am logged in as not admin$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'notadmin'
  fill_in 'user_password', :with => 'bbbbb'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

Given /the following articles exist/ do |articles_table|
  articles_table.hashes.each do |article|
    Article.create!(article)
  end
end

When /I am editting \"(.*)\"/ do |article_name|
  _article = Article.find_by_title(article_name)
  _uri = "/admin/content/edit/#{_article.id}"
  visit _uri
end

When /I fill in "merge_with" with the id for \"(.*)\"/ do |article_name|
  _article = Article.find_by_title(article_name)
  _id = _article.id
  fill_in("merge_with", :with => _id)
end
