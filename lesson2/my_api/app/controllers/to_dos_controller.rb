class ToDosController < ApplicationController
  # GET /to_dos
  # GET /to_dos.json
  def index
    @to_dos = ToDo.all

    render json: @to_dos
  end

  # GET /to_dos/1
  # GET /to_dos/1.json
  def show
    @to_do = ToDo.find(params[:id])

    render json: @to_do
  end

  # POST /to_dos
  # POST /to_dos.json
  def create
    @to_do = ToDo.new(todo_params)

    if @to_do.save
      render json: @to_do, status: :created, location: @to_do
    else
      render json: @to_do.errors, status: :unprocessable_entity
    end
  end

  def todo_params
    params.permit(:text)
  end
  # PATCH/PUT /to_dos/1
  # PATCH/PUT /to_dos/1.json
  def update
    @to_do = ToDo.find(params[:id])

    if @to_do.update(params[:to_do])
      head :no_content
    else
      render json: @to_do.errors, status: :unprocessable_entity
    end
  end

  # DELETE /to_dos/1
  # DELETE /to_dos/1.json
  def destroy
    @to_do = ToDo.find(params[:id])
    @to_do.destroy

    head :no_content
  end
end
