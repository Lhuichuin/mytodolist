class TasksController < ApplicationController

	before_action :set_list
	# this action is done before every method below. so in this case it is finding the list that i want to CRUD task ontu. remember i made a nested routes

	def new
		@task= Task.new
	end

	def create
		# @list = List.find(params[:list_id])
		@task= Task.new(task_params)
		@task.list = @list 
		if @task.save
			redirect_to list_tasks_path
		else
			render 'new'
		end
	end

	def edit
		@task = Task.find(params[:id])
	end

	def update
		@task = Task.find(params[:id])
		# @task.list = @list
		if @task.update(task_params)
			redirect_to list_tasks_path
		else
			render 'edit'
		end
	end

	def index
		@tasks= List.find(params[:list_id]).tasks
		
		if params[:search]
			@tasks= List.find(params[:list_id]).tasks.search(params[:search]).order(created_at: :desc)
		else
			# Task.all.order(created_at: :desc)
			@tasks= List.find(params[:list_id]).tasks.order(created_at: :desc)
		end
	end

	def show
	end

	def destroy
		@task = Task.find(params[:id])
		@task.destroy
		redirect_to list_tasks_path
	end

	def change_status_done
		@task = Task.find(params[:id])
		@task.status ="done"
		@task.save
		# render :json => { :message => 'hello'}, :status => 200
	end

	def change_status_doing
		@task = Task.find(params[:id])
		@task.status ="doing"
		@task.save
	end

	def change_status_not_done
		@task = Task.find(params[:id])
		@task.status ="not_done"
		@task.save
	end



	private
	def set_list
		@list = List.find(params[:list_id])
	end

	def task_params
		params.require(:task).permit(:task, :status)
	end
end
