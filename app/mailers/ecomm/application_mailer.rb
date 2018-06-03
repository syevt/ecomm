module Ecomm
  class ApplicationMailer < ActionMailer::Base
    default(from: Ecomm.smtp_from)
    include Ecomm::ApplicationHelper
    add_template_helper(Ecomm::ApplicationHelper)
  end
end
