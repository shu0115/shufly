# coding: utf-8
class GroupsController < ApplicationController

  #-------#
  # index #
  #-------#
  def index
    @groups = Group.where( :user_id => session[:user_id] )
  end

  #------#
  # show #
  #------#
  def show
    @group = Group.find( params[:id] )
  end

  #-----#
  # new #
  #-----#
  def new
    @group = Group.new
    
    @submit = "create"
  end

  #------#
  # edit #
  #------#
  def edit
    @group = Group.find( params[:id] )
    
    @submit = "update"
  end

  #--------#
  # create #
  #--------#
  def create
    @group = Group.new( params[:group] )
    @group.user_id = session[:user_id]
    
    if @group.save
      flash[:notice] = "グループを作成しました。"
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  #--------#
  # update #
  #--------#
  def update
    @group = Group.find( params[:id] )

    if @group.update_attributes( params[:group] )
      flash[:notice] = "グループを更新しました。"
      redirect_to :action => "show", :id => params[:id]
    else
      render :action => "edit", :id => params[:id]
    end
  end

  #---------#
  # destroy #
  #---------#
  def destroy
    @group = Group.find( params[:id] )
    @group.destroy

    redirect_to :action => "index"
  end

end
