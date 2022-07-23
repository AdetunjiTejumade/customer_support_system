# frozen_string_literal: true

module Agent
  class TicketsController < ApplicationController
    before_action :is_agent

    def index
      if is_agent
        tickets = Ticket.where(assigned_to: current_user.name).recent
        render json: tickets
      else
        render json: { message: 'You are not authorized to access this page' }, status: '401'
      end
    end

    # change ticket status
    def update
      if is_agent
        ticket = Ticket.find(params[:id])
        ticket.update(ticket_params)
        render json: ticket
      else
        render json: { message: 'You are not authorized to access this page' }, status: '401'
      end
    end

    private

    def ticket_params
      params.permit(:status)
    end

    def is_agent
      current_user.agent?
    end
  end
end
