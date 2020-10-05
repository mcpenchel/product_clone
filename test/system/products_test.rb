require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit products_url

    assert_selector "h1", text: "Awesome Products"
    assert_selector ".card-product-infos", count: Product.count

    assert_selector "h2", id: "name-#{Product.first.id}", text: Product.first.name
    assert_selector "p", id: "tagline-#{Product.first.id}", text: Product.first.tagline
  end

  # Esse teste está incompleto!
  # Porque eu só testei o cenário onde dá tudo certo
  # Eu não testei se:

  # 1) Usuário que não logou tem acesso
  # 2) Se não preencheu um campo, salva da mesma forma?
  #    renderiza o new ou redireciona?
  test "lets a signed in user create a new product" do
    login_as users(:george)
    visit "/products/new"
    # save_and_open_screenshot

    fill_in "product_name", with: "Le Wagon"
    fill_in "product_tagline", with: "Change your life: Learn to code"
    # save_and_open_screenshot

    click_on 'Create Product'
    # save_and_open_screenshot

    # Should be redirected to Home with new product
    assert_equal root_path, page.current_path
    assert_text "Change your life: Learn to code"
  end
end
