# -*- coding: utf-8 -*-
class TasksController < ApplicationController

  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: :destroy

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])
    render json: { task: @task }
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = current_user.tasks.build(params[:task])
    if @task.save
      redirect_to home_path
    else
      # TODO: エラーを表示するべき
      redirect_to home_path
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    render json: { task: @task }
  end

  private
  def correct_user
    @task = current_user.tasks.find_by_id(params[:id])
    redirect_to root_path if @task.nil?
  end
end
