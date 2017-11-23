class ProjectChatChannel < ApplicationCable::Channel
  def subscribed
    project = Project.find(params[:room])
    stream_from "project_channel_#{project.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    project_id = data["project_id"]
    content = data["content"]

    message = Message.create!(content: content, project_id: project_id)
    ActionCable.server.broadcast("project_channel_#{project_id}", message: render_message(message))
  end

  private

    def render_message(message)
      MessageController.render partial: 'message/message', locals: {message: message}
    end
end
