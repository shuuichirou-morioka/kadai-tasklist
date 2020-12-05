class TasksController < ApplicationController
  def index
      @tasks = task.all
  end

  def show
      @task = task.find(params[:id])
  end

  def new
      @task = task.new
  end

  def create
      @task = task.new(task_params)

    if @task.save
      flash[:success] = 'すること が正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = 'すること が投稿されませんでした'
      render :new
    end
  end

  def edit
      @task = task.find(params[:id])
  end

  def update
      @task = task.find(params[:id])

    if @task.update(task_params)
      flash[:success] = 'すること は正常に更新されました'
      redirect_to @message
    else
      flash.now[:danger] = 'すること は更新されませんでした'
      render :edit
    end
  end

  def destroy
  end
  
  private

  # Strong Parameter
  def task_params
    params.require(:task).permit(:content)
  end
end
