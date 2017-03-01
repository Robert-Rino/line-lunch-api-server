require 'sinatra'
require 'json'

# Configuration Sharing Web Service
class LunchHelperAPI < Sinatra::Base
  enable :logging
  before do
    host_url = "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}"
    @request_url = URI.join(host_url, request.path.to_s)
  end

  get '/?' do
    'Luch api web service is up and running at /api/v1'
  end

  get '/api/v1/?' do
    # TODO: show all routes as json with links
  end

  get '/api/v1/restaurants/?' do
    JSON.pretty_generate(data: Restaurant.all)
  end

  get '/api/v1/restaurants/:id' do
    content_type 'application/json'

    id = params[:id]
    restaurant = Restaurant[id]

    if restaurant
      JSON.pretty_generate(data: restaurant)
    else
      halt 404, "RESTAURANT NOT FOUND: #{id}"
    end
  end

  post '/api/v1/restaurants/?' do
    begin
      new_data = JSON.parse(request.body.read)
      saved_restaurant = Restaurant.create(new_data)
    rescue => e
      logger.info "FAILED to create new restaurant: #{e.inspect}"
      halt 400
    end

    new_location = URI.join(@request_url.to_s + '/', saved_restaurant.id.to_s).to_s

    status 201
    headers('Location' => new_location)
  end

  get '/api/v1/restaurants/:id/dishs/?' do
    content_type 'application/json'

    restaurant = Restaurant[params[:id]]

    JSON.pretty_generate(data: restaurant.dishs)
  end

  # get '/api/v1/projects/:project_id/configurations/:id/?' do
  #   content_type 'application/json'
  #
  #   begin
  #     doc_url = URI.join(@request_url.to_s + '/', 'document')
  #     configuration = Configuration
  #                     .where(project_id: params[:project_id], id: params[:id])
  #                     .first
  #     halt(404, 'Configuration not found') unless configuration
  #     JSON.pretty_generate(data: {
  #                            configuration: configuration,
  #                            links: { document: doc_url }
  #                          })
  #   rescue => e
  #     status 400
  #     logger.info "FAILED to process GET configuration request: #{e.inspect}"
  #     e.inspect
  #   end
  # end
  #
  # get '/api/v1/projects/:project_id/configurations/:id/document' do
  #   content_type 'text/plain'
  #
  #   begin
  #     Configuration
  #       .where(project_id: params[:project_id], id: params[:id])
  #       .first
  #       .document
  #   rescue => e
  #     status 404
  #     e.inspect
  #   end
  # end
  #
  post '/api/v1/restaurants/:restaurant_id/dishs/?' do
    begin
      new_data = JSON.parse(request.body.read)
      restaurant = Restaurant[params[:restaurant_id]]
      saved_dish = restaurant.add_dish(new_data)
    rescue => e
      logger.info "FAILED to create new config: #{e.inspect}"
      halt 400
    end

    status 201
    new_location = URI.join(@request_url.to_s + '/', saved_dish.id.to_s).to_s
    headers('Location' => new_location)
  end

  post '/api/v1/users/:user_id/orders/?' do
    begin
      new_data = JSON.parse(request.body.read)
      new_data[:userid] = params[:user_id]
      new_order = Order.create(new_data)
    rescue => e
      logger.info "FAILED to create new order: #{e.inspect}"
      halt 400
    end

    status 201
  end
end
