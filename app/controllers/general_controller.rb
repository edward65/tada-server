# encoding: utf-8

class GeneralController < ApplicationController


  # API: 提示需加上.json才能call到API。在routes.rb內把未加.json的導過來
  def append_json
    render :json => {"error" => "To Call APIs. Please append '.json' in the end of URL"}
  end


end
