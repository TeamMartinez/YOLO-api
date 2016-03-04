Rails.application.config.middleware.use OmniAuth::Builder do
      provider :github, ENV['YOLO_GITHUB_KEY'], ENV['YOLO_GITHUB_SECRET'], scope: "user:email, user:follow, gist"
end
