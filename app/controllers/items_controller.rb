class ItemsController < ApplicationController
  
   before_filter :find_item, only: [:show, :edit, :update, :destroy, :upvote] 
      
  def index
    @item = Item.all
    # render "items/index"
  end
  
  # /itmes/1 GET
  def show
    unless @item
          render text: "Page not found", status: 404
    end
  end
  
  # /items/new GET
  def new
     @item = Item.new
  end
  
  # /items/1/edit GET
  def edit
  end
  
  #  /items POST
   def create
     
      @item = Item.create(user_params)
      if @item.errors.empty?
         redirect_to item_path(@item)
      else
         render "new" 
      end
  end
  
   def expensive
      @item = Item.where("price > 1000")
      render "index"
   end
   
   
   
   
  # /items/1 PUT
  def update
     @item.update_attributes(user_params)
     if @item.errors.empty?
         redirect_to item_path(@item)
      else
        render "edit" 
      end
  end
  
  # /items/1 DELETE
  def destroy

     @item.destroy
     redirect_to action: "index"
  end
   
   def upvote
      @item.increment!(:votes_count)
      redirect_to action: :index
   end
   
# -------------------------------------------------------------------------------  
  private

  def user_params
     params.require(:item).permit(:name, :price, :description, :weight)
  end
  
   def find_item
      @item = Item.find(params[:id])  
   end
        
   
  end
