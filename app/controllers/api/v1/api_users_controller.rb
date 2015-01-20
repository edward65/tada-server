class Api::V1::ApiUsersController < ApplicationController
  skip_before_filter :authenticate, :only => [:create]
  skip_before_filter :verify_authenticity_token


  require 'rubygems' # not necessary with ruby 1.9 but included for completeness 
  require 'twilio-ruby' 




  def index_ok
    puts "Edward ===v1==index====okoko" 

  	@orders = Order.all

      render :json => @orders
  end


#edward Test obly
  def test_api
    puts "Edward ===v1==send_sms====okoko" 
verify_code = 9988

            twilio_body1 = 'tada 驗證簡訊:[#{verify_code}]'
    puts twilio_body1 


        twilio_body2 = 'tada 驗證簡訊:#{verify_code}'
    puts twilio_body2 


        twilio_body3 = 'tada 驗證簡訊:'+verify_code.to_s

    puts twilio_body3 


        result = true

            if business = User.find_by_tele_and_status("+886987198663",1)

                puts "Edward ===YESSS member" 


            else

                  puts "Edward ===NOOO member" 

            end




    render :json => result ? {"success" => true } : {"nono" =>message.status}

  end


  #功能: 使用者註冊
  #POST /user_register:
    #傳入:
      #user_name: 使用者名稱
      #location: 所在行政區
      #phone_number: 使用者電話號碼
      #invite_code: 邀請碼
    #回傳:
      #成功:> { "success": true , "user_id": "122" }
      #失敗:> {"error": "0"  }  # error code: 0-unknow error、1-已經是會員、2-邀請碼無效

  def create_user

    # put your own credentials here 
    account_sid = 'AC6b39652855480a968ba3cad73e97b56c' 
    auth_token = '42d4d59356ee95726caed99fa3bb9053' 

    result = false
    user_name = params[:user_name]
    location = params[:location]
    phone_number = params[:phone_number]
    invite_code = params[:invite_code]


    error_code = 0

    #確認資料
    if user_name.present? and location.present? and phone_number.present?

      #確認邀請碼是否有效 EdwardToDo


      #確認是否已經是會員 
      if User.find_by_tele_and_status(phone_number,1)

        error_code = 1
        
      else
        
        #不是會員，建立會員
        verify_code = SecureRandom.random_number(10000)



        user = User.create(
              :last_name => user_name,
              :location => location,
              :tele => phone_number,
              :verify_code => verify_code,
              :status => 0
            )

        #傳送簡訊
        # set up a client to talk to the Twilio REST API 
        @client = Twilio::REST::Client.new account_sid, auth_token
         
        @client.account.messages.create({
          :from => '+15082983591', 
          :to => phone_number, 
          :body => 'tada 驗證簡訊:'+verify_code.to_s,  
        })


        result = true

      end

    end

    render :json => result ? {"success" => true ,"user_id" =>user.id} : {"error" => error_code}
  end



  #功能: 使用者確認驗證碼
  #POST /verify_code:
    #傳入:
      #user_id: 使用者ID
      #verify_code: 驗證碼
    #回傳:
      #成功:> { "success": true }
      #失敗:> { "error": "0" } # error code: 0-unknow error、1-資料不足、2-查無ID、3-驗證碼錯誤
  def verify_code

    result = false
    user_id = params[:user_id]
    verify_code = params[:verify_code]

    error_code = 0

    #確認資料
    if user_id.present? and verify_code.present?

      #確認是否已經是會員 
      if user = User.find_by_id(user_id)

        #比對驗證碼
        if user.verify_code == verify_code then

          if user.status == 0 
            user.status = 1
            user.save
          end

          result = true

        else
          #驗證碼錯誤
          error_code = 3
        end

        
      else
        
        #查無ID
        error_code = 2

      end

    else
      #資料不足
      error_code = 1

    end

    render :json => result ? {"success" => true } : {"error" => error_code}
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