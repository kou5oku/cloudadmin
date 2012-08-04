class IncomingMailsController < ApplicationController    
  skip_before_filter :verify_authenticity_token
  
  def create
    Rails.logger.info params[:to]
    Rails.logger.info params[:from]
    Rails.logger.info params[:plain]
    Rails.logger.info params[:remote_ip]


    # Do some other stuff with the mail message
    if params[:envelope][:from] != 'expected_user@example.com'
      render :text => 'success', :status => 200
    else
      render :text => 'Unknown user', :status => 404 # 404 would reject the mail
    end
  end
end