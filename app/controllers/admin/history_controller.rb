class Admin::HistoryController < ApplicationController
  include HistoryHelper
  def index
    @audits = Audited.audit_class.all.order created_at: :desc
  end

end