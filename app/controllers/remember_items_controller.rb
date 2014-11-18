class RememberItemsController < ApplicationController
  before_action :set_remember_item, only: [:show, :edit, :update, :destroy]

  # GET /remember_items
  # GET /remember_items.json
  def index
    @remember_items = RememberItem.all
  end

  # GET /remember_items/1
  # GET /remember_items/1.json
  def show
  end

  # GET /remember_items/new
  def new
    @remember_item = RememberItem.new
  end

  # GET /remember_items/1/edit
  def edit
  end

  # POST /remember_items
  # POST /remember_items.json
  def create
    @remember_item = RememberItem.new(remember_item_params)

    respond_to do |format|
      if @remember_item.save
        format.html { redirect_to @remember_item, notice: 'Remember item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @remember_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @remember_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /remember_items/1
  # PATCH/PUT /remember_items/1.json
  def update
    respond_to do |format|
      if @remember_item.update(remember_item_params)
        format.html { redirect_to @remember_item, notice: 'Remember item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @remember_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /remember_items/1
  # DELETE /remember_items/1.json
  def destroy
    @remember_item.destroy
    respond_to do |format|
      format.html { redirect_to remember_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_remember_item
      @remember_item = RememberItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def remember_item_params
      params.require(:remember_item).permit(:name, :content)
    end
end
