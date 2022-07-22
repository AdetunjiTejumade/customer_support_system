# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[show update destroy]
  def index
    tickets = current_user.tickets.recent
    render json: tickets
  end

  def show
    ticket = Ticket.find(params[id])
    render json: ticket
  end

  def create
    ticket = current_user.tickets.create!(ticket_params)
    render json: {ticket, comments: ticket.comments}, status: 201
    end

  end

  def update
    ticket.update(ticket_params)
    render json: ticket, status: 201
  end

  def destroy
    ticket.destroy
    json_response(ticket)
  end

  private

  def ticket_params
    params.permit(:title, :description, :status)
  end

  def set_ticket
    Ticket.find(params[:id])
  end
end
