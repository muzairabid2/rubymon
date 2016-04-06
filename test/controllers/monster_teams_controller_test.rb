require 'test_helper'

class MonsterTeamsControllerTest < ActionController::TestCase
  setup do
    @monster_team = monster_teams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:monster_teams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create monster_team" do
    assert_difference('MonsterTeam.count') do
      post :create, monster_team: { monster_id: @monster_team.monster_id, team_id: @monster_team.team_id, user_id: @monster_team.user_id }
    end

    assert_redirected_to monster_team_path(assigns(:monster_team))
  end

  test "should show monster_team" do
    get :show, id: @monster_team
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @monster_team
    assert_response :success
  end

  test "should update monster_team" do
    patch :update, id: @monster_team, monster_team: { monster_id: @monster_team.monster_id, team_id: @monster_team.team_id, user_id: @monster_team.user_id }
    assert_redirected_to monster_team_path(assigns(:monster_team))
  end

  test "should destroy monster_team" do
    assert_difference('MonsterTeam.count', -1) do
      delete :destroy, id: @monster_team
    end

    assert_redirected_to monster_teams_path
  end
end
