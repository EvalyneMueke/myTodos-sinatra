class TodoController < Sinatra::Base

    set :views, './app/views'


    before do
        puts "Hello, to this route"
    end

    get '/hello' do 
        "Welcome to TodoController"
    end

    post '/todos/create' do
      

        begin
            data = JSON.parse(request.body.read)
            #code
        
        # title = data["title"]
        # description = data["description"]
        # todo = Todo.create(title: title, description: description, createdAt: today)
        # todo.to_json


        #approach 2
        today = Time.now
        data["CreatedAt"] = today
        todo = Todo.create(data)
        [201, todo.to_json]
        rescue => e

          [422 ,{
                error: e.message

        }.to_json]
            
            
        end

        
        
    end

    get "/todos" do
        todos = Todo.all
        [200, todos.to_json]
    end

    get "/view/todos" do
        @todos = Todo.all
        erb :todos
    end

    put '/todos/update/:id' do
        begin
        data = JSON.parse(request.body.read)
        todo_id = params['id'].to_i
        todo = Todo.find(todo_id)
        todo.update(data)
            { message: "update success"}.to_json
        rescue => e
            {
                error: e.message}.to_json
        end
    end

    delete '/todos/destroy/:id' do
        begin
            todo_id = params['id'].to_i
            todo = Todo.find(todo_id)
            todo.destroy
            
            { message: "delete success"}.to_json

        rescue => e

           [ 422, {error: e.message}.to_json]
        end
    end

end