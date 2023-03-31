class RemindersController < ApplicationController
    def create
        
        task = Task.find(params[:task_id])
        reminder = Reminder.new(reminder_params)
        reminder.task = task
        # reminder.user = current_user
    
        if reminder.save
          render json: reminder, status: :created
        else
          render json: { error: reminder.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
      private
    
      def reminder_params
        params.permit(:reminder_date, :reminder_time, :reminder_message, :message)
      end

    #index (get)
    #show (get)
    #reminder_date (post)
    #reminder_time (crud)
    #reminder_message (crud)
end
