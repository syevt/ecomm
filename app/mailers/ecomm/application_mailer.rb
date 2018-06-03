module Ecomm
  class ApplicationMailer < ActionMailer::Base
    include Ecomm::ApplicationHelper
    add_template_helper(Ecomm::ApplicationHelper)
  end
end
