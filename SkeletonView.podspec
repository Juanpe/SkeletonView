Pod::Spec.new do |s|
  s.name         = "SkeletonView"
  s.version      = "1.12.0"
  s.summary      = "An elegant way to show users that something is happening and also prepare them to which contents he is waiting"
  s.description  = <<-DESC
  Today almost all apps have async processes, as API requests, long runing processes, etc. And while the processes are working, usually developers place a loading view to show users that something is going on.
  SkeletonView has been conceived to address this need, an elegant way to show users that something is happening and also prepare them to which contents he is waiting.
  DESC
  s.homepage     = "https://github.com/Juanpe/SkeletonView"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Juanpe Catalán" => "juanpecm@gmail.com" }
  s.social_media_url   = "https://twitter.com/JuanpeCatalan"
  s.ios.deployment_target = "9.0"
  s.tvos.deployment_target = "9.0"
  s.swift_version = "5.0"
  s.source       = { :git => "https://github.com/Juanpe/SkeletonView.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
end
