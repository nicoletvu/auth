class TasksController < ApplicationController
  def index
    @tasks = Task.where({"user_id" => session["user_id"]})
    @task = Task.new
  end

  def create
    @task = Task.new
    @task["description"] = params["task"]["description"]
    @task["user_id"] = session["user_id"]
    @task.save
    redirect_to "/tasks"
  end

  def destroy
    @task = Task.find_by({ "id" => params["id"], "user_id" => session["user_id"]})
    @task.destroy
    redirect_to "/tasks"
  end
end
