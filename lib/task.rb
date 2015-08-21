class Task
  attr_reader(:description, :list_id, :id)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @list_id = attributes.fetch(:list_id)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_tasks = DB.exec("SELECT * FROM tasks;")
    tasks = []
    returned_tasks.each() do |task|
      description = task.fetch("description")
      list_id = task.fetch("list_id").to_i() # The information comes out of the database as a string.
      id = task.fetch("id").to_i()
      tasks.push(Task.new({:description => description, :list_id => list_id, :id => id}))
    end
    tasks
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO tasks (description, list_id) VALUES ('#{@description}', #{@list_id}) RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  define_method(:==) do |another_task|
    self.id().==(another_task.id())
  end

  define_singleton_method(:find) do |id|
    found_task = nil
    Task.all().each() do |task|
      if task.id().==(id)
        found_task = task
      end
    end
    found_task
  end
end
