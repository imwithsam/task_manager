class TaskManagerApp < Sinatra::Base
  get '/' do
    erb :dashboard
  end

# CREATE
  get '/tasks/new' do
    erb :new
  end

  post '/tasks' do
    TaskManager.create(params[:task])
    redirect '/tasks'
  end
# END CREATE

# READ
  get '/tasks' do
    @tasks = TaskManager.all
    erb :index
  end

  get '/tasks/:id' do |id|
    @task = TaskManager.find(id.to_i)
    erb :show
  end
# END READ

# EDIT
  get '/tasks/:id/edit' do |id|
    @task = TaskManager.find(id.to_i)
    erb :edit
  end

  put '/tasks/:id' do |id|
    TaskManager.update(id.to_i, params[:task])
    redirect "/tasks/#{id}"
  end
# END EDIT

# DELETE
  delete '/tasks/:id' do |id|
    TaskManager.delete(id.to_i)
    redirect '/tasks'
  end
# END DELETE

# ERROR
  not_found do
    erb :error
  end
# END ERROR
end
