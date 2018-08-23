# create our first route ---- research 7 restful routes and explain what they are
# URI - Uniform Resource Identifiers
# GET: Retrieves information, GET requests must be safe and idempotent, meaning regardless of how many times it repeats with the same parameters, the results are the same.
# POST: Request that the resource at the URI do something with the provided entity. Often POST is used to create a new entity, but it can also be used to update an entity.
# PUT: Store an entity at a URI. PUT can create a new entity or update an existing one. PUT replaces an existing entity. If only a subset of data elements are provided, the rest will be replaced with empty or null.
# DELETE: Request that a resource be removed, but the resource does not have to be removed immediately. It could be an asynchronous or long-running request.
class PostsController < Sinatra::Base
  # sets the root as the parent-driectory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')
  # sets the view directory correctly
  set :views, proc { File.join(root, 'views') }

  configure :development do
    register Sinatra::Reloader
  end

  $posts = [{
    id: 0,
    title: 'posts 1',
    post_body: 'This is the first post'
  }, {
    id: 1,
    title: 'posts 2',
    post_body: 'This is the second post'
  }, {
    id: 2,
    title: 'posts 3',
    post_body: 'This is the third post'
  }, {
    id: 3,
    title: 'posts 4',
    post_body: 'This is the fourth post'
  }]

  get '/posts' do
    @title = 'Blog posts'
    @posts = $posts

    erb :'posts/index'
  end

  get '/posts/new' do
    @title = "New post"
    @post = {
      id: '',
      title: '',
      post_body: ''
    }

    erb :'posts/new_post'
  end

  post '/posts/' do
    new_post = {
      id: $posts.length,
      title: params[:title],
      post_body: params[:post_body]
    }

    $posts.push(new_post)

    redirect '/posts'
  end

  get '/posts/:id' do
    id = params[:id].to_i
    # binding.pry
    @post = $posts[id]
    @title = 'Post'

    erb :'posts/show'
  end

  get '/posts/:id/edit' do
    id = params[:id].to_i

    @post = $posts[id]
    @title = 'Edit post'

    erb :'posts/edit_post'
  end

  put '/posts/:id' do
    id = params[:id].to_i

    post = $posts[id]

    post[:title] = params[:title]
    post[:post_body] = params[:post_body]

    $posts[id] = post

    redirect '/posts'

  end

  delete '/posts/:id' do
    id = params[:id].to_i
    $posts.delete_at(id)
    redirect '/posts'
  end

  $books = [{
    id: 0,
    title: 'book 1',
    book_body: 'This is the first book',
    image: 'https://www.engine-house.co.uk/wp-content/uploads/2016/09/ezgif.com-resize-3.gif'
  }, {
    id: 1,
    title: 'book 2',
    book_body: 'This is the second book',
    image: 'https://www.engine-house.co.uk/wp-content/uploads/2016/09/ezgif.com-resize-2.gif'
  }, {
    id: 2,
    title: 'book 3',
    book_body: 'This is the third book',
    image: 'https://www.engine-house.co.uk/wp-content/uploads/2016/03/MrMercedes_2.gif'
  }]

  get '/books' do
    @title = 'Book list'
    @books = $books

    erb :'books/index'
  end

  get '/books/new' do
    @title = "New book"
    @book = {
      id: '',
      title: '',
      book_body: '',
      image: ''
    }

    erb :'books/new_book'
  end

  post '/books/' do
    new_book = {
      id: $books.length,
      title: params[:title],
      book_body: params[:book_body],
      image: params[:image]
    }

    $books.push(new_book)

    redirect '/books'
  end

  get '/books/:id' do
    id = params[:id].to_i
    # binding.pry
    @book = $books[id]
    @title = 'Book'

    erb :'books/show'
  end

  get '/books/:id/edit' do
    id = params[:id].to_i

    @book = $books[id]
    @title = 'Edit book'

    erb :'books/edit_book'
  end

  put '/books/:id' do
    id = params[:id].to_i

    book = $books[id]

    book[:title] = params[:title]
    book[:book_body] = params[:book_body]

    $books[id] = book

    redirect '/books'
  end

  delete '/books/:id' do
    id = params[:id].to_i
    $books.delete_at(id)
    redirect '/books'
  end
end
