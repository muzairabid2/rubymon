class WebServicesController < ApplicationController
  skip_before_filter :authenticate_user!
  skip_before_filter  :verify_authenticity_token
  before_filter :check_session_create, :except => [:sign_in]
  include ActionView::Helpers::NumberHelper
  respond_to :html, :json



  def sign_in
    #begin
      if params[:user][:email].present? and params[:user][:password].present?
        @user = User.find_by_email(params[:user][:email])
        if @user.blank?
          render :json => {:success => "false", :errors => "Email or password is incorrect"}
        else
          if not @user.valid_password?(params[:user][:password])
            render :json => {:success => "false", :errors => "Invalid email or password."}
          else
            render :json => {:success => "true",
                             :data => {
                                 :driver => {:id => @user.id, :email => @user.email, :token => @user.authentication_token}
                             }}
          end
        end
      else
        render :json => {:success => "false", :errors => "Email or password is incorrect"}
      end
    #rescue Exception => exc
    #  render :json => {:success => "server", :errors => exc.message}
    #end
  end

  #Return all monsters service

  def get_all_monsters
    render :json => {:success => "true",
                     :data => {
                         :monsters => @user.monsters.blank? ? Array.new : @user.monsters.map { |mon| {:id => mon.id, :name => mon.name, :team_count => mon.teams.size} }
                     }}
  end

  def get_all_teams
    render :json => {:success => "true",
                     :data => {
                         :teams => @user.teams.blank? ? Array.new : @user.teams.map { |team| {:id => team.id, :name => team.name, :monster_count => team.monsters.size} }
                     }}
  end

  #Return monsters by team service

  def get_monster_by_team
    @team = Team.find(params[:team_id])
    render :json => {:success => "true",
                     :data => {
                         :monsters => @team.monsters.blank? ? Array.new : @team.monsters.map { |mon| {:id => mon.id, :name => mon.name, :team_count => mon.teams.size} }
                     }}
  end

  #Return teams by monsters service

  def get_team_by_monster
    @monster = Monster.find(params[:monster_id])
    render :json => {:success => "true",
                     :data => {
                         :teams => @monster.teams.blank? ? Array.new : @monster.teams.map { |team| {:id => team.id, :name => team.name, :monster_count => team.monsters.size} }
                     }}
  end

  def save_monster
    @monster = Monster.new(params[:monster])
    if @monster.save
      render :json => {:success => "true", :errors => "Monster was successfully Added"}
    else
      render :json => {:success => "false", :errors => "Monster Not Saved"}
    end
  end

  def save_team
    @team = Team.new(params[:team])
    if @team.save
      render :json => {:success => "true", :errors => "Team was successfully Added"}
    else
      render :json => {:success => "false", :errors => "Team Not Saved"}
    end
  end

  def save_monster_teams
    @monster_team = MonsterTeam.new(params[:monster_team])
    if @monster_team.save
      render :json => {:success => "true", :errors => "Monster Team was successfully Added"}
    else
      render :json => {:success => "false", :errors => "Monster Team Not Saved"}
    end
  end



  private

  #Check user authentication using service

  def check_session_create
    if params[:user][:token].present?
      @user = User.find_by_authentication_token(params[:user][:token])
      if @user.blank?
        render :json => {:success => "false", :errors => "authentication failed"}
        return
      end
    else
      render :json => {:success => "false", :errors => "authentication failed"}
    end
  end


end
