class ItemsController < ApplicationController
    
  def index
    @item = Item.all
    # render "items/index"
  end
  
  # /itmes/1 GET
  def show
    unless @item = Item.where(id: params[:id]).first
          render text: "Page not found", status: 404
    end
  end
  
  # /items/new GET
  def new
  end
  
  # /items/1/edit GET
  def edit
  end
  
  #  /items POST
    
  def create
    #p params
    #item_params = params.require(:item).permit(:name, :description, :price, :real, :weight)
    #@item = Item.create(item_params)
    #render text: " Item ID #{@item.id}: #{@item.name} (#{!@item.new_record?})"
    render text: "Item created"
  end
    
  # /items/1 PUT
  def update
  end
  
  # /items/1 DELETE
  def destroy
  end
  
  end
