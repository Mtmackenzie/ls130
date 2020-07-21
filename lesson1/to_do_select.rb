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


  private

  attr_reader :todos
end

# In this assignment, you are to build a TodoList#select method, very similar to Array#select or the select method we built ourselves earlier. Take a look at the following code examples for how it should behave:

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

results = list.select { |todo| todo.done? }    # you need to implement this method

puts results.inspect