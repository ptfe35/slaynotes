class Public::NetworksController < ApplicationController
  def show; end

  def search
    @word = params[:word]
    @range = params[:range]
    search = params[:search]
    if @range == '1'
      @end_users = EndUser.search(search, @word)
    else
      @notes = Note.search(search, @word)
    end
  end
end
