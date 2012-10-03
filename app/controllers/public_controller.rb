class PublicController < ApplicationController
 layout 'public'
 before_filter :set_navigation

  def index
  
  end

  def show
  @page = Page.where(:permalink => params[:id],:visible => true).first
  redirect_to(:action=>'index') unless @page
  end
  
  def set_navigation
     @subjects =Subject.visible
  end
  
end
