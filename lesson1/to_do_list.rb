# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

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

  private

  attr_reader :todos
end




# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
# list.add(12)                     # raises TypeError with message "Can only add Todo objects"


# list << todo1
# p list
# <<
# same behavior as add

# # ---- Interrogating the list -----

# size
# p list.size                       # returns 3

# # first
# p list.first                      # returns todo1, which is the first item in the list

# # last
# p list.last                       # returns todo3, which is the last item in the list

# #to_a
# p list.to_a                      # returns an array of all items in the list

# #done?
# p list.done?                     # returns true if all todos in the list are done, otherwise false

# # # ---- Retrieving an item in the list ----

# # item_at
# # p list.item_at                    # raises ArgumentError
# p list.item_at(1)                 # returns 2nd item in list (zero based index)
# p list.item_at(100)               # raises IndexError

# ---- Marking items in the list -----

# mark_done_at
# p list.mark_done_at               # raises ArgumentError
list.mark_done_at(1)            # marks the 2nd item as done
# p list.mark_done_at(100)          # raises IndexError

# # mark_undone_at
# p list.mark_undone_at             # raises ArgumentError
# p list.mark_undone_at(1)          # marks the 2nd item as not done,
# p list
# p list.mark_undone_at(100)        # raises IndexError

# done!
# p list.done!                      # marks all items as done

# # ---- Deleting from the list -----

# # shift
# p list.shift                      # removes and returns the first item in list

# pop
# p list.pop                        # removes and returns the last item in list

# p list
# remove_at
# p list.remove_at                  # raises ArgumentError
# p list.remove_at(1)               # removes and returns the 2nd item
# p list.remove_at(100)             # raises IndexError

# # ---- Outputting the list -----

# to_s
# list.to_s                      # returns string representation of the list
# puts list
# p list.todos

# # ---- Today's Todos ----
# # [ ] Buy milk
# # [ ] Clean room
# # [ ] Go to gym

# # or, if any todos are done

# # ---- Today's Todos ----
# # [ ] Buy milk
# # [X] Clean room
# # [ ] Go to gym
