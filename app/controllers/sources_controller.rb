class SourcesController < ApplicationController

  def index
    @sources = Source.all
  end
  
  def show
    @source = Source.find(params[:id])
  end
  
end