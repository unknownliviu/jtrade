class ItemsController < ApplicationController
  before_filter :authenticate_user!, only: [:my_index, :new, :create]
  before_filter :correct_user , except: [:index, :my_index, :new, :create]
  # GET /items
  # GET /items.json
  def index
    @items = Item.paginate(page: params[:page])
    @title = "All items"
  end

  def my_index
    @items = current_user.items.paginate(page: params[:page])
    @title = "My items"
    render 'index'
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = current_user.items.build(params[:item])

    if @item.save
      flash[:success] = "Item created!"
      redirect_to @item
    else
      render "new" 
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    if @item.update_attributes(params[:item])
      flash[:success] = 'Item was successfully updated.'
      redirect_to @item 
    else
      render 'edit'
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    redirect_to items_url, notice:"Item deleted"
  end

private
  def correct_user
    if !current_user.nil?
      @item = current_user.items.find_by_id(params[:id])
    elsif !current_admin.nil?
      @item = Item.find_by_id(params[:id])
    else
      authenticate_user!
    end
      redirect_to root_url if @item.nil?
  end
end
