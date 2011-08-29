# coding: utf-8
class MembersController < ApplicationController

  #-------#
  # index #
  #-------#
  def index
    @members = Member.all
  end

  #------#
  # show #
  #------#
  def show
    @member = Member.find( params[:id] )
  end

  #-----#
  # new #
  #-----#
  def new
    @member = Member.new
    
    @submit = "create"
  end

  #------#
  # edit #
  #------#
  def edit
    @member = Member.find( params[:id] )
    
    @submit = "update"
  end

  #--------#
  # create #
  #--------#
  def create
    @member = Member.new( params[:member] )

    if @member.save
      flash[:notice] = "Member was successfully created."
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  #--------#
  # update #
  #--------#
  def update
    @member = Member.find( params[:id] )

    if @member.update_attributes( params[:member] )
      flash[:notice] = "Member was successfully updated."
      redirect_to :action => "show", :id => params[:id]
    else
      render :action => "edit", :id => params[:id]
    end
  end

  #---------#
  # destroy #
  #---------#
  def destroy
    @member = Member.find( params[:id] )
    @member.destroy

    redirect_to :action => "index"
  end

end
