class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to  items_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @message = Message.new
    @messages = @item.messages.includes(:user)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    if item.save
      redirect_to  item_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
        redirect_to items_path
    else
        render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:title, :text, :image)
  end
end