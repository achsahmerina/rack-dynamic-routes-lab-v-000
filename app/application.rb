class Application

  @@items = []

  def call(route)
    resp = Rack::Response.new
    req = Rack::Request.new(route)

    if req.path.match(/items/)
      fruit = req.path.split("/items/").last

      item = @@items.find{|fruit_price| fruit_price.name == fruit}

      if item.nil?
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write item.price
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
