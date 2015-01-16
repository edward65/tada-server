class Api::V1::ApiOrdersController < ApplicationController
  skip_before_filter :authenticate, :only => [:create]
  skip_before_filter :verify_authenticity_token

  def index_ok
    puts "Edward ===v1==index====okoko" 

  	@orders = Order.all

      render :json => @orders
  end


  def create_ok

  	    puts "Edward ===22==create_ok====okoko" 


    result = false
    store_name = params[:store_name]
    content = params[:content]


    puts content


    if store_name.present? and content.present?
      # check if this user had answered
            Order.create(
              :store_name => store_name,
              :content => content
            )
        result = true
      
    end

    render :json => result ? {"success" => true } : {}
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