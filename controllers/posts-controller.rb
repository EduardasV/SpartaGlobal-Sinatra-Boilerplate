# create our first route ---- research 7 restful routes and explain what they are
# URI - Uniform Resource Identifiers
# GET: Retrieves information, GET requests must be safe and idempotent, meaning regardless of how many times it repeats with the same parameters, the results are the same.
# POST: Request that the resource at the URI do something with the provided entity. Often POST is used to create a new entity, but it can also be used to update an entity.
# PUT: Store an entity at a URI. PUT can create a new entity or update an existing one. PUT replaces an existing entity. If only a subset of data elements are provided, the rest will be replaced with empty or null.
# DELETE: Request that a resource be removed, but the resource does not have to be removed immediately. It could be an asynchronous or long-running request.
class PostsController < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    '<h1>Homepage</h1>'
  end

  get '/books' do
    'gets and displays all books'
  end

  get '/books/new' do
    'gets and displays a form to input your new books'
  end

  post '/books/' do
    'creates a new book and adds to the list'
  end

  get '/books/:id' do
    id = params[:id]
    "gets and displays a book with the id: #{id}"
  end

  get '/books/:id/edit' do
    id = params[:id]
    "gets and displays a form to edit a book with the id: #{id}"
  end

  put '/books/:id' do
    id = params[:id]
    "updates a book with the id: #{id}"
  end

  delete '/books/:id' do
    id = params[:id]
    "deletes a book with the id: #{id}"
  end
end
