class TasksController < ApplicationController
  # Based on the model, you create an action that will list all tasks on the view index
  def index
    @tasks = Task.all
  end
  # ------------------
  # We want to find a specific task through its id - using the params
  def show
    @task = Task.find(params[:id])
  end
  # -------------------
  # Add a new task - First action displays a server & is the first step when creating a new instance
  def new
    @task = Task.new
  end
  # Second step is to actually create the task after the user submits his/her input
  def create
    @task = Task.new(task_params)
    @task.save
    # path helper
    redirect_to tasks_path
  end

  # --------------------
  # Update / Edit a task - change title, detials and marking as complete
  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path(@task)
  end

  # ---------------------
  # Delete a tasks
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
    # This returns a cleared params object
  end
end
