# -*- coding: utf-8 -*-
class TasksController < ApplicationController

  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: :destroy


  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.json { render json: @task }
    #end
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
    #@task = Task.new(params[:task])

    #respond_to do |format|
    #  if @task.save
    #    format.html { redirect_to @task, notice: 'Task was successfully created.' }
    #    format.json { render json: @task, status: :created, location: @task }
    #  else
    #    format.html { render action: "new" }
    #    format.json { render json: @task.errors, status: :unprocessable_entity }
    #  end
    #end
    @task = current_user.tasks.build(params[:task])
    if @task.save
      #flash[:success] = 'TODOを作成しました!'
      #redirect_to root_path
      #redirect_to @task, notice: "TODOを作成しました"
      redirect_to home_path
    else
      #render root_path
      #render action: "new"
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
    #@task = Task.find(params[:id])
    #@task.destroy

    #respond_to do |format|
    #  format.html { redirect_to tasks_url }
    #  format.json { head :no_content }
    #end
    @task.destroy
    #redirect_to home_path
    render json: { task: @task }
  end

  private
  def correct_user
    @task = current_user.tasks.find_by_id(params[:id])
    redirect_to root_path if @task.nil?
  end
end
