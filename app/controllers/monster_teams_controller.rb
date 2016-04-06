class MonsterTeamsController < ApplicationController
  before_action :set_monster_team, only: [:show, :edit, :update, :destroy]

  # GET /monster_teams
  # GET /monster_teams.json
  def index
    @monster_teams = MonsterTeam.all
  end

  # GET /monster_teams/1
  # GET /monster_teams/1.json
  def show
  end

  # GET /monster_teams/new
  def new
    @monster_team = MonsterTeam.new
  end

  # GET /monster_teams/1/edit
  def edit
  end

  # POST /monster_teams
  # POST /monster_teams.json
  def create
    @monster_team = MonsterTeam.new(monster_team_params)

    respond_to do |format|
      if @monster_team.save
        format.html { redirect_to monster_teams_path, notice: 'Monster team was successfully created.' }
        format.json { render :show, status: :created, location: @monster_team }
      else
        format.html { render :new }
        format.json { render json: @monster_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monster_teams/1
  # PATCH/PUT /monster_teams/1.json
  def update
    respond_to do |format|
      if @monster_team.update(monster_team_params)
        format.html { redirect_to monster_teams_path, notice: 'Monster team was successfully updated.' }
        format.json { render :show, status: :ok, location: @monster_team }
      else
        format.html { render :edit }
        format.json { render json: @monster_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monster_teams/1
  # DELETE /monster_teams/1.json
  def destroy
    @monster_team.destroy
    respond_to do |format|
      format.html { redirect_to monster_teams_url, notice: 'Monster team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monster_team
      @monster_team = MonsterTeam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monster_team_params
      params.require(:monster_team).permit(:monster_id, :team_id, :user_id)
    end
end
