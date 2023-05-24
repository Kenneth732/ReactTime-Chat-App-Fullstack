class Api::ChatroomsController < ApplicationController
  def index
    chatrooms = Chatroom.all
    render json: chatrooms
  end

  def show
    chatroom = Chatroom.find(params[:id])
    render json: chatroom
  end

  def create
    chatroom = Chatroom.new(chatroom_params)
    if chatroom.save
      render json: chatroom
    else
      render json: { errors: chatroom.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    chatroom = Chatroom.find(params[:id])
    if chatroom.update(chatroom_params)
      render json: chatroom
    else
      render json: { errors: chatroom.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    chatroom = Chatroom.find(params[:id])
    chatroom.destroy
    head :no_content
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end


# class Api::ChatroomsController < ApplicationController
#     def index
#       chatrooms = Chatroom.all
#       render json: chatrooms
#     end
  
#     def show
#       chatroom = Chatroom.find(params[:id])
#       render json: chatroom
#     end
  
#     def create
#       chatroom = Chatroom.new(chatroom_params)
#       if chatroom.save
#         render json: chatroom
#       else
#         render json: { errors: chatroom.errors.full_messages }, status: :unprocessable_entity
#       end
#     end
  
#     def update
#       chatroom = Chatroom.find(params[:id])
#       if chatroom.update(chatroom_params)
#         render json: chatroom
#       else
#         render json: { errors: chatroom.errors.full_messages }, status: :unprocessable_entity
#       end
#     end
  
#     def destroy
#       chatroom = Chatroom.find(params[:id])
#       chatroom.destroy
#       head :no_content
#     end
  
#     private
  
#     def chatroom_params
#       params.require(:chatroom).permit(:name)
#     end
#   end
  