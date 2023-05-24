class Api::MessagesController < ApplicationController
  def index
    messages = Message.all
    render json: messages
  end

  def show
    message = Message.find(params[:id])
    render json: message
  end

  # def create
  #   message = Message.new(message_params)
  #   if message.save
  #     render json: message
  #   else
  #     render json: { errors: message.errors.full_messages }, status: :unprocessable_entity
  #   end
  # end
  def create
    chatroom = Chatroom.find(params[:chatroom_id])
    message = chatroom.messages.build(message_params)
  
    if message.save
      render json: message
    else
      render json: { errors: message.errors.full_messages }, status: :unprocessable_entity
    end
  end
  

  def update
    message = Message.find(params[:id])
    if message.update(message_params)
      render json: message
    else
      render json: { errors: message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    head :no_content
  end

  private

  def message_params
    params.require(:message).permit(:content, :chatroom_id)
  end
  
end



# class Api::MessagesController < ApplicationController
#     def index
#       messages = Message.all
#       render json: messages
#     end
  
#     def show
#       message = Message.find(params[:id])
#       render json: message
#     end
  
#     def create
#       message = Message.new(message_params)
#       if message.save
#         render json: message
#       else
#         render json: { errors: message.errors.full_messages }, status: :unprocessable_entity
#       end
#     end
  
#     def update
#       message = Message.find(params[:id])
#       if message.update(message_params)
#         render json: message
#       else
#         render json: { errors: message.errors.full_messages }, status: :unprocessable_entity
#       end
#     end
  
#     def destroy
#       message = Message.find(params[:id])
#       message.destroy
#       head :no_content
#     end
  
#     private
  
#     def message_params
#       params.require(:message).permit(:content, :user_id)
#     end
#   end
  