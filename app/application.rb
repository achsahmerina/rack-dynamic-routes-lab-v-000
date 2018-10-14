class Application

  @@items = []

  def call(route)
    resp = Rack::Response.new
    req = Rack::Request.new(route)

    if req.path.match(/items/)
      fruit = req.path.split("/items/").last

      list = @@items.find{|fruit| fruit.name == fruit}

      if list.nil?
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write list.price
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
