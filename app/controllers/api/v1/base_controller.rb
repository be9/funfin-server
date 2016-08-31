class Api::V1::BaseController < ApplicationController
  attr_accessor :current_user

  rescue_from ActiveRecord::RecordNotFound, with: :not_found!

  protected

  def not_found!
    return api_error(status: 404, errors: 'Not found')
  end

  def api_error(status: 500, errors: [])
    unless Rails.env.production?
      puts errors.full_messages if errors.respond_to? :full_messages
    end

    head status and return if errors.empty?

    render json: { errors: Array(errors) }, status: status
  end
end
