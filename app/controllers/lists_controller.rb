class ListsController < ApplicationController
	def new
		@list= List.new
	end
	def create
		@list = current_user.lists.new(list_params)
		if @list.save
			redirect_to @list
		else
			render 'new'
		end
	end

	def index
		@lists= List.where(user_id: current_user.id)
		# @lists= List.find_by(user_id: current_user.id)
		# this will only give you one object, which will give error in the view for .each method.
	end

	def show
		@list= List.find(params[:id])
		@tasks= @list.tasks
	end

	def edit
		@list= List.find(params[:id])
	end

	def update
		@list= List.find(params[:id])
		if @list.update(list_params)
			redirect_to lists_path
		else
			render 'edit'
		end

	end

	def destroy
		@list= List.find(params[:id])
		@list.destroy
		redirect_to lists_path
	end

	private
	def list_params
		params.require(:list).permit(:name)
	end

end
