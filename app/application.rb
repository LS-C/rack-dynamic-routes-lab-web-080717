class Application

    @@items = [Item.new("Oranges", 2), Item.new("Apples", 3) ]

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)


        if req.path.match(/items/)
            item_search = req.path.split("/items/").last
            if a=@@items.find {|i| i.name == item_search}
                resp.write a.price
            else
                resp.status = 400
                resp.write "Item not found"
            end
        else
            resp.status = 404
            resp.write "Route not found"
        end
        resp.finish

    end

end
