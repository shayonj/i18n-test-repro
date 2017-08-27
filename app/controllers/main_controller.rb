class MainController < ApplicationController
  def index
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def foo
  end
end
