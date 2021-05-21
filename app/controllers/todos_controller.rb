class TodosController < ApplicationController
  def index
    render plain: "Hello todo Rails! #{DateTime.now.to_s(:short)}"
  end
end
