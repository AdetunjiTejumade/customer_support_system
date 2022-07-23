# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[show update destroy]
  def index
    tickets = current_user.tickets.recent
    render json: tickets
  end

  def show
    ticket = Ticket.includes(:comments).find(params[:id])
    render json: ticket
  end

  def create
    agent_id = User.where(role: 'agent').pluck(:id).sample
    agent = User.find_by(id: agent_id).name
    ticket = current_user.tickets.new(ticket_params)
    ticket.assigned_to = agent
    if ticket.save
      render json: ticket, status: :created
    else
      render json: { message: "Validation failed: Title can't be blank Description can't be blank" },
             status: :unprocessable_entity
    end
  end

  def update
    ticket = Ticket.find(params[:id])
    ticket.update(ticket_params)
    render json: ticket
  end

  def destroy
    ticket = Ticket.find(params[:id])
    ticket.destroy
    render json: ticket
  end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :description)
  end

  def set_ticket
    Ticket.find(params[:id])
  end
end
