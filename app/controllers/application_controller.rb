class ApplicationController < ActionController::Base

  def render_modal(partial, options = {backdrop: true, keyboard: true})
    render partial: 'shared/modal', locals: { partial: partial, options: options}
  end

end
