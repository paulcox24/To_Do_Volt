# By default Volt generates this controller for your Main component
class MainController < Volt::ModelController
  model :store
  def index
    # Add code for when the index view is loaded
  end

  def about
    # Add code for when the about view is loaded
  end

  def add_todo
    _todos << { title: page._new_todo, completed: false }
    page._new_todo = ""
  end

  def remove_todo(todo)
    _todos.delete(todo)
  end

  def remove_completed
    done = _todos.select { |todo| todo._completed }
    done.each { |todo| _todos.delete(todo) }
  end

  def current_todo
    _todos[params._index.or(0).to_i]
  end

  def show_edit
    page._edit_task = true
  end

  def hide_edit
    page._edit_task = false
  end

  def check_all
    _todos.each { |todo| todo._completed = true }
  end

  def uncheck_all
    _todos.each { |todo| todo._completed = false }
  end

  def completed
    _todos.count { |t| t._completed }
  end

  def incomplete
    _todos.size - completed
  end

  def remove_complete
    
  end

  def percent_complete
    (completed / _todos.size.to_f * 100).round
  end

  def selected(index)
    params._index.or(0).to_i == index
  end

  private

  # The main template contains a #template binding that shows another
  # template.  This is the path to that template.  It may change based
  # on the params._controller and params._action values.
  def main_path
    params._controller.or('main') + '/' + params._action.or('index')
  end

  # Determine if the current nav component is the active one by looking
  # at the first part of the url against the href attribute.
  def active_tab?
    url.path.split('/')[1] == attrs.href.split('/')[1]
  end
end
