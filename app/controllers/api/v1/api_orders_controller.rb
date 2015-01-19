class Api::V1::ApiOrdersController < ApplicationController
  skip_before_filter :authenticate, :only => [:create]
  skip_before_filter :verify_authenticity_token

  def index_ok
    puts "Edward ===v1==index====okoko" 

  	@orders = Order.all

      render :json => @orders
  end




  # POST /add_order:
    #傳入:
      #user_id: 使用者ID
      #store_name: 商店名稱
      #items: 購買品項
    #回傳:
      #成功:> { "success": true, "order_id": "122" }
      #失敗:> { }

  def create_order

    result = false
    user_id = params[:user_id]
    store_name = params[:store_name]
    items = params[:items]


    if user_id.present? and store_name.present? and items.present?
        order = Order.create(
              :user_id => user_id,
              :store_name => store_name,
              :content => items,
              :status => 0
            )
        result = true
      
    end

    render :json => result ? {"success" => true ,"order_id" =>order.id} : {}
  end


    def update_ok

    	  	    puts "Edward ===33==update_ok====okoko" 


    result = false
    from_content = params[:from_content]
    to_content = params[:to_content]




    if from_content and to_content
      # check if this user had answered


          order = Order.find_by(content: from_content)
          order.content = to_content
          order.save



        result = true
      
    end

    render :json => result ? {"success" => true } : {}
  end


end