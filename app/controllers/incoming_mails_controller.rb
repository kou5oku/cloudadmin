class IncomingMailsController < ApplicationController    
  skip_before_filter :verify_authenticity_token
  


  def index
    @incoming_mails = Incoming_mail.all
  end

  def create
    Rails.logger.info params[:envelope][:to]
    Rails.logger.info params[:envelope][:from]
    Rails.logger.info params[:envelope][:remote_ip]
    Rails.logger.info params[:plain]
    incoming_mail = IncomingMails.new
    incoming_mail.to = params[:envelope][:to]
    incoming_mail.from = params[:envelope][:from]
    incoming_mail.ip = params[:envelope][:remote_ip]
    incoming_mail.body = params[:plain]
    if incoming_mail.save
    	Rails.logger.info "saved"
    else 
    	Rails.logger.info "not saved"
    end
    # Do some other stuff with the mail message
    if params[:envelope][:from] != 'expected_user@example.com'
      render :text => 'success', :status => 200
    else
      render :text => 'Unknown user', :status => 404 # 404 would reject the mail
    end
  end
end