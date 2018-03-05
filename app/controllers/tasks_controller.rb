class TasksController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @todo = Todo.find_by(user_id: current_user.id, task_id: params[:id])
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def maked
    @previous_todo = Todo.find_by(user_id: current_user.id, task_id: params[:id])
    if @previous_todo.present?
      @previous_todo.update(finished: true)
    else
      @todo = Todo.new()
      @todo.task_id = params[:id]
      @todo.user_id = current_user.id
      @todo.finished = true
      if @todo.save
        redirect_to root_path, notice: 'Tarea Actualizada'
      else
        redirect_to root_path, alert: 'Tarea no se pudo actualizar'
      end
    end
  end

  def not_maked
    @previous_todo = Todo.find_by(user_id: current_user.id, task_id: params[:id])
    if @previous_todo.present?
      @previous_todo.update(finished: false)
    else
      @todo = Todo.new()
      @todo.task_id = params[:id]
      @todo.user_id = current_user.id
      @todo.finished = false
      if @todo.save
        redirect_to root_path, notice: 'Tarea Actualizada'
      else
        redirect_to root_path, alert: 'Tarea no se pudo actualizar'
      end
    end
  end
end
