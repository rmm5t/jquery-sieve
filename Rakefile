require "bundler/setup"

task :default => :test

desc "Publish \"marketing\" docs"
task :publish do
  sh("git rebase master gh-pages")
  sh("git checkout master")
  sh("git push origin master")
  sh("git push origin gh-pages")
  sh("git push --tags")
end

desc "Build everything"
task :build do
  rebuild_coffee
end

desc "Open your default browser with the test page"
task :test => :build do
  sh("open index.html")
end

def rebuild_coffee(glob = "**/*.coffee")
  sh("coffee -c #{glob}")
end
