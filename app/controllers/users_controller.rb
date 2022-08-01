class UsersController < ApplicationController

  def index
    render status: :ok, json: User.all.to_json
  end

  def create
    resource = User.new attribute_on_params

    if resource.save
      render status: :created, json: resource.to_json
    else
      render status: :bad_request, json: resource.errors.full_messages.to_json
    end
  end

  private

  def attribute_on_params
    params.permit(
      :name,
      :portrait,
      :portrait_remove
    )
  end
end
