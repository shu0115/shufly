# coding: utf-8
class MembersController < ApplicationController

  #-------#
  # index #
  #-------#
  def index
    @group = Group.where( :id => params[:group_id] ).first
    @members = Member.where( :group_id => @group.id ).order( "group_number ASC, order_number ASC, id ASC" )
  end

=begin
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
=end

  #---------#
  # destroy #
  #---------#
  def destroy
    @member = Member.find( params[:id] )
    @member.destroy

    redirect_to :action => "index", :group_id => @member.group_id
  end

end
