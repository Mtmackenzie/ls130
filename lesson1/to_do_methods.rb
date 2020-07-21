class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(new_todo)
    if new_todo.is_a?(Todo)
      todos.push(new_todo)
    else
      raise TypeError, "Can only add Todo objects"
    end
  end

  alias_method :<<, :add

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos.clone
  end

  def done?
    todos.all? { |todo| todo.done }
  end

  def item_at(index)
    todos[index] ? todos[index] : (raise IndexError)
  end

  def mark_done_at(index)
    todos[index] ? todos[index].done! : (raise IndexError)
  end

  def mark_undone_at(index)
    todos[index] ? todos[index].undone! : (raise IndexError)
  end

  def done!
    todos.each { |todo| todo.done! }
  end

  def shift
    todos.delete_at(0)
  end

  def pop
    todos.delete_at(-1)
  end

  def remove_at(index)
    todos[index] ? todos.delete_at(index) : (raise IndexError)
  end

  def to_s
    title = "---- Today's Todos ----"
    todos.each { |todo| title += "\n#{todo.to_s}" }
    title
  end

  def each
    counter = 0
    while counter < todos.size
      yield(todos[counter])
      counter += 1
    end
    self
  end

  # Step 1
  # def select
  #   result = []
  #   todos.each { |todo| result << todo if yield(todo)}
  #   result
  # end

  # Step 2
  def select
    result = TodoList.new(self.title)
    todos.each { |todo| result << todo if yield(todo) }
    result
  end

  def find_by_title(todo_title)
    todos.each { |todo| return todo if todo.title == todo_title }
    nil
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(task)
    # unchanged = true
    todos.each do |todo|
      return todo.done! if todo.title == task
      # if todo.title == task && unchanged
      #   todo.done!
      #   unchanged = false
      # end
    end
  end

  # LS version of same method above
  def ls_mark_done(task)
    find_by_title(task) && find_by_title(task).done!
  end

  def mark_all_done(repeated_task=nil)
    if repeated_task
      todos.each { |todo| todo.done! if todo.title == repeated_task }
    else
      todos.each { |todo| todo.done! }
    end
  end

  def mark_all_undone
    todos.each { |todo| todo.undone! }
  end

  private

  attr_reader :todos
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
todo4 = Todo.new("Buy milk")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)
list.add(todo4)

todo1.done!

p list.find_by_title("Buy milk")   # todo object 1
p list.find_by_title("Meditate")   # nil
done_list = list.all_done
puts done_list    
not_done_list = list.all_not_done
puts not_done_list
p list.mark_done("Buy milk")    # already marked as done ?
p list.mark_done("Clean room")
p list.mark_done("Go to Grama's")
# p list.ls_mark_done("Go to Grama's")
puts list
# list.mark_all_done
# puts list
# list.mark_all_done
# puts list
# list.mark_all_undone
# puts list

# find_by_title	takes a string as argument, and returns the first Todo object that matches the argument. Return nil if no todo is found.
# all_done	returns new TodoList object containing only the done items
# all_not_done	returns new TodoList object containing only the not done items
# mark_done	takes a string as argument, and marks the first Todo object that matches the argument as done.
# mark_all_done	mark every todo as done
# mark_all_undone	mark every todo as not done