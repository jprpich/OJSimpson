require 'sinatra'
require 'sqlite3'

db_connection = SQLite3::Database.new "oj_database.db"

# db_connection.execute("drop table if exists posts;")

# db_connection.execute(<<-SQL
#   create table posts
#   (
#     title  varchar(255),
#     post varchar(255)
#   );
#   SQL
# )



get '/' do 
  erb :index
end

#posts
get '/posts' do
  posts = db_connection.execute("select * from posts;")
  erb :posts, locals:{posts: posts}  
end

get '/posts/new' do
  erb :new
end

post '/posts' do
  title = params[:title]
  post = params[:post]
  db_connection.execute(<<-SQL
  insert into posts
  values ("#{title}", "#{post}");
  SQL
  )
  redirect to '/posts'
end


get '/lawyers' do
  erb :lawyers
end