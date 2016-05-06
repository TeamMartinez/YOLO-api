class Api::GithubIssuesController < ApplicationController

  before_action :create_github_client, only: [:index, :create]

  def index
    @issues = @client.issues.list
    render json: @issues
  end

  def create
    render json: { errors: "not implemented" }
  end

  private
  def create_github_client
    @client = Github.new oauth_token: ENV['YOLO_ISSUES_TOKEN']
  end

  def issues_params
    params
  end
end