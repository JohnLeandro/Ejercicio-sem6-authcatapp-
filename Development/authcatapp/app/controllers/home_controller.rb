class HomeController < ApplicationController
  def index
    if params[:tag]
      @tag = params[:tag]
      @products = Product.tagged_with(tag)
    else
    @product = Product.order(created_at: :desc).limit(10)
  end
 end
end
