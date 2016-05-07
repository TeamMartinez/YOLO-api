class Api::GithubIssuesController < ApplicationController

  before_action :create_github_client, only: [:index, :create]

  def index
    render json: client_issues
  end

  def create
    # TODO: make user: and repo: params default somewhere and use params
    if @client.issues.create user: 'TeamMartinez', repo: 'YOLO-api', title: params[:title]
      render json: client_issues
    end
  end

  private
  def client_issues
    @client.issues.list user: 'TeamMartinez', repo: 'YOLO-api', state: 'open'
  end

  def create_github_client
    @client = Github.new oauth_token: ENV['YOLO_ISSUES_TOKEN']
  end
end
