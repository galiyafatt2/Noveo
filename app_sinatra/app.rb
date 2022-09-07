require 'sinatra'
require('sinatra/reloader')
require('pry')
require 'csv'

get('/') do
  prod = CSV.read('products.csv')
  @products = prod[1..].sort_by{|row| row[0].to_i}
  @headers = prod[0]
  erb(:products)
end

get('/products') do
  prod = CSV.read('products.csv')
  @products = prod[1..].sort_by{|row| row[0].to_i}
  @headers = prod[0]
  erb(:products)
end
get('/products/new') do
  erb(:new_product)
end

post('/products') do
  prod = CSV.read('products.csv')
  id = prod[-1][0] == 'id' ? 1 : prod[-1][0].to_i + 1

  product = params[:product]
  CSV.open('products.csv', 'a+') do |csv|
    csv << [id, *product.values]
  end

  redirect '/products'
end

get('/products/:id/edit') do
  products = CSV.read('products.csv')[1..]
  @product = products.find {|row| row[0] == params[:id]}
  erb(:edit_product)
end

patch('/products/:id') do
  id = params[:id]
  products = CSV.read('products.csv')
  products.delete_if { |row| row[0] == id }
  products << [id, *params[:product].values]

  CSV.open('products.csv', 'w') do |row|
    products.each do |prod_row|
      row << prod_row
    end
  end
  redirect '/products'
end

get('/products/:id') do
  products = CSV.read('products.csv')[1..]
  @product = products.find {|row| row[0] == params[:id]}
  erb(:product)
end

delete('/products/:id') do
  id = params[:id]
  products = CSV.read('products.csv')
  products.delete_if { |row| row[0] == id }
  CSV.open('products.csv', 'w') do |row|
    products.each do |prod_row|
      row << prod_row
    end
  end
  redirect '/products'
end