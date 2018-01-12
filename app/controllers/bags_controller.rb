class BagsController < ApplicationController

  def index
    @bags = Bag.all
  end

  def incoming
    
    @orders = Order.where("added_to_bag_by = (?) and bag_id is Null", current_user.id )
    if @orders
      @order_ids = @orders.map(&:id)
    end  
    if request.xhr?
      @order = Order.find_by_awb_num(params[:awb_num])
      if @order.present? && !@order.warehouse_status
        render json: {error: "Please scan this order before adding to Bag"}
      elsif @order.present? && @order.warehouse_status && @order.bag_scan_status
        render json: {error: "Order Already scanned to add for Bag"}
      elsif @order.present? && @order.warehouse_status
        client_name = @order.user.name
        @order.bag_scan_status = true
        @order.added_to_bag_by = current_user.id
        @order.save

        render json: {order: @order, client_name: client_name, notice: "Order added to bag successfully"}
      else
          render json: { error: "No Order Found"}  
      end
    end  
  end

end
