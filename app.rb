require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/task")
require("./lib/list")
require("pg")

DB = PG.connect({:dbname => "to_do"})

get("/") do
  erb(:index)
end

##### LIST RESTFUL ROUTES #####

# List 'index' RESTful route (display a list of all lists)
get('/lists') do
  @lists = List.all()
  erb(:lists)
end

# List 'new' RESTful route (show form to gather info for creating a new list)
get("/lists/new") do
  erb(:list_form)
end

# List 'create' RESTful route (create a new list)
post("/lists") do
  name = params.fetch("name")
  list = List.new({:name => name, :id => nil})
  list.save()
  erb(:list_success)
end

# List 'show' RESTful route (display detail page for a specific list)
get("/lists/:id") do
  @list = List.find(params.fetch("id").to_i())
  erb(:list)
end

# List 'edit' RESTful route (show form to gather info for editing a list)
get("/lists/:id/edit") do
  @list = List.find(params.fetch("id").to_i())
  erb(:list_edit)
end

# List 'update' RESTful route (update a specific list)
patch("/lists/:id") do
  name = params.fetch("name")
  @list = List.find(params.fetch("id").to_i())
  @list.update({:name => name})
  erb(:list)
end

# List 'delete' RESTful route (delete a specific list)
delete("/lists/:id") do
  @list = List.find(params.fetch("id").to_i())
  @list.delete()
  @lists = List.all()
  erb(:index)
end

##### TASK RESTFUL ROUTES #####

# Task 'create' RESTful route (create a new task)
post("/tasks") do
  description = params.fetch("description")
  list_id = params.fetch("list_id").to_i()
  @list = List.find(list_id)
  @task = Task.new({:description => description, :list_id => list_id, :id => nil})
  @task.save()
  erb(:task_success)
end

