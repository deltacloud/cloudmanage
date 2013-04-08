module CloudManage
  module ApplicationHelper

    def report_error_for(model)
      errors = model.errors.inject("") { |r, err|
        r+="<em>#{err[0]}</em>: #{err[1].join(' and ')}<br/>"
      }
      flash[:error] = errors
      redirect(back) && halt
    end

    def cache
      @cache ||= TorqueBox::Infinispan::Cache.new(:name => 'cloudmanage', :persist => '/data/cloudmanage')
    end

  end
end