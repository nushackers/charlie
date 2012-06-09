class IncomingMail
  def initialize(message, params)
    @user = User.where(email: message.from).first rescue nil
    @message = message
    @params = params
  end

  def process(method)
    begin
      if not_spam_test #### this is a good place to filter unwanted mail.
        self.send method
      end
    rescue Exception => e
      Mailman.logger.error "Exception occurred while receiving message:\n#{@message}"
      Mailman.logger.error [e, *e.backrtace].join("\n")
    end
  end

  def not_spam_test
    true
    # if @user
    #   return true
    # else
    #   Mailman.logger.error "Mail from #{@message.from.first} is unsolicited. Message ignored."
    #   return false
    # end
  end

  def command_parse
    Mailman.logger.info 'Message matched command_parse route. Running command'
  end

  # def some_other_param_test(object)
  #   ### test
  # end

  def default
    # create default action for emails from valid users.
    Mailman.logger.info 'Message matched the default route. Message ignored'
  end

  # def method_for_route_one
  #   @interesting_param = @params[:interesting]
  #   if some_other_param_test(@interesting_param)
  #     if ## some Rails environment method
  #       Mailman.logger.info "#{@user.name} performed something useful."
  #     end
  #   else
  #     Mailman.logger.error "Something went wrong, here's useful debugging detail."
  #   end
  # end

  # def method_for_route_two
  #   @interesting_param = @params[:interesting]
  #   if some_other_param_test(@interesting_param)
  #     if ## some Rails environment method
  #       Mailman.logger.info "#{@user.name} performed something else."
  #     end
  #   else
  #     Mailman.logger.error "Something went wrong, here's another useful debugging detail."
  #   end
  # end
end