class Admin::HistoryController < ApplicationController
  include HistoryHelper
  def index
    @audits = Audited.audit_class.all.order created_at: :desc
    @audited_classes = Audited.audit_class.audited_classes
    @users = User.all.decorate
  end

end