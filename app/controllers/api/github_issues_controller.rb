class Api::GithubIssuesController < ApplicationController

  before_action :create_github_client, only: [:index, :create]

  def index
    @issues = @client.issues.list user: 'TeamMartinez', repo: 'YOLO-api', state: 'open'
    render json: @issues
  end

  def create
    # TODO: make user: and repo: params default somewhere and use params
    @client.issues.create user: 'TeamMartinez', repo: 'YOLO-api', title: params[:title]
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
