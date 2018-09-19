class TasksController < ApplicationController
	def new
		@task = Task.new
	end
	def create
         @task = Task.create(task_params)
            if @task.save
               redirect_to root_path
            else 
	           render ('new')
            end
    end
    
    private
    def task_params
    	params.require(:task).permit(:title, :note, :completed)
    	end
    end