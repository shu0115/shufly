# coding: utf-8
class GroupsController < ApplicationController

  #-------#
  # index #
  #-------#
  def index
    @groups = Group.all
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

    if @group.save
      flash[:notice] = "Group was successfully created."
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
      flash[:notice] = "Group was successfully updated."
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
