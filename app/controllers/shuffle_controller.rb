# coding: utf-8
class ShuffleController < ApplicationController
  
  #-------#
  # index #
  #-------#
  def index
    @group = Group.where( :id => params[:group_id] ).first
    
    case params[:flag]
    when "reset"
      @members = Member.where( :group_id => @group.id ).order( "id ASC" ) unless @group.blank?
    when "name_order"
      @members = Member.where( :group_id => @group.id ).order( "name ASC" ) unless @group.blank?
    else
      @members = Member.where( :group_id => @group.id ).order( "order_number IS NULL, order_number ASC, id ASC" ) unless @group.blank?
    end
    
    @member_hash = Hash.new
    @members.each{ |member|
      @member_hash[member.group_number] = Array.new if @member_hash[member.group_number].blank?
      @member_hash[member.group_number].push( :id => member.id, :name => member.name )
    }
    
    @member = Member.new
  end
  
  #------------#
  # add_member #
  #------------#
  def add_member
    @member = Member.new( params[:member] )

    unless @member.save
#    if @member.save
#      flash[:notice] = "新規メンバーを追加しました。"
#    else
      flash[:notice] = "新規メンバー追加に失敗しました。"
    end
    
    redirect_to :action => "index", :group_id => @member.group_id
  end
  
  #-----#
  # fix #
  #-----#
  def fix
    print "[ params ] : "; p params ;
    params[:members].each_pair{ |key,value|
      print "[ key ] : "; p key ;
      print "[ value ] : "; p value ;
      puts
      member = Member.where( :id => key ).first
      member.order_number = value
      member.save
    }

    flash[:notice] = "順序を確定しました。"

    redirect_to :action => "index", :group_id => params[:group_id]
  end
  
end
