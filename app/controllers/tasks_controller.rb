class TasksController < ApplicationController
  
  def index
      @tasks = task.all
  end

  def show
      set_task
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
    set_task
  end

  def update
      set_task

    if @task.update(task_params)
      flash[:success] = 'すること は正常に更新されました'
      redirect_to @message
    else
      flash.now[:danger] = 'すること は更新されませんでした'
      render :edit
    end
  end

  def destroy
    set_task
    @task.destroy

    flash[:success] = 'すること は正常に削除されました'
    redirect_to tasks_url
  end
  
  private

  def set_task
    @task = task.find(params[:id])
  end
  def task_params
    params.require(:task).permit(:content, :status)
  end
end
