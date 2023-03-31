class TasksController < ApplicationController
    def index
        @tasks = Task.all
        render json: @tasks
    end
    
    def show
        begin
          @task = Task.find(params[:id])
          render json: @task
        rescue ActiveRecord::RecordNotFound
          render json: { error: "Task not found" }, status: :not_found
        end
    end

    def create
        task = Task.new(task_params)
        if task.save
          render json: task, status: :created
        else
          render json: task.errors, status: :unprocessable_entity
        end
      end

      def update
        task = user.tasks.find(params[:id]).update(task_params)
        if task
            app_response(data: { info: 'updated task successfully' })
        else
            app_response(message: 'failed', data: { info: 'something went wrong. could not update task' }, status: :unprocessable_entity)
        end
      end
      # def update
    #     task = Task.find(params[:id])
    #     if task.update(task_params)
    #       render json: task, status: :ok
    #     else
    #       render json: task.errors, status: :unprocessable_entity
    #     end
    #   end


      def destroy
        @task = Task.find(params[:id])
        @task.destroy
      
        head :no_content
      end
      
      
      private
      
      def task_params
        params.require(:task).permit(:name, :description, :due_date, :status, :priority, :user_id, :category_id)
      end
      
      
    
    
    # show (get)
    #index (get)
    #description (post)
    #due_date (post)
    #status (post)
    #priority (post)
end
