require 'csv'

class OrdersController < ApplicationController

  def index

  end

  def import
    if params[:file].present?
      @orders_count = current_user.orders.import(params[:file])
      redirect_to orders_path, notice: "#{@orders_count} Orders imported successfully"
    else
      redirect_to orders_path, notice: "Please upload file"
    end
  end

  def orders_search
    @order = current_user.orders.find_by_awb_num(params[:awb_num])
    if @order.present?
      render partail: "orders_search", order: @order
    else
      redirect_to orders_path, notice: "Order not Found"
    end
  end

  def incoming
    @orders = Order.where("scanned_by = (?) AND scanned_date = (?)", current_user.id, Date.today )
    if request.xhr?
      @order = Order.find_by_awb_num(params[:awb_num])
      if @order.present? && @order.warehouse_status
        render json: {error: "Order was Already scanned"}
      elsif @order.present? && !@order.warehouse_status
        client_name = @order.user.name
        @order.warehouse_status = true
        @order.scanned_by = current_user.id
        @order.scanned_date = Date.today
        @order.save
        render json: {order: @order, client_name: client_name, notice: "Order Scanned successfully"}
      else
          render json: { error: "No Order Found"}  
      end
    end  
  end

  def add_orders_to_bag
    @bag = Bag.find_by_number params[:number]
    order_ids = params[:order_ids].split(/,/)
    order_ids.each do |order|
      order = Order.find_by_id order
      order.bag_id = @bag.id
      order.save
     end 
    redirect_to incoming_bags_path, notice: "successfully added orders to the bag #{@bag.number}"
  end

end
