module Admin
  class TasksController < ApplicationController
    def index
      @tasks = Task.all
    end
  end
end