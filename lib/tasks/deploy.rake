namespace :deploy do

  task :staging do
    deploy('develop', 'heroku-staging', 'STAGING')
  end

  task :production do
    deploy('master', 'heroku', 'PRODUCTION')
  end

  def deploy(branch_name, remote_name, deployment_name)
    puts ""
    puts "==========================================================================="
    puts "=                                                                         ="
    puts "=              DEPLOY'EM - A SIMPLE HEROKU DEPLOYMENT TOOL                ="
    puts "=                                                                         ="
    puts "==========================================================================="
    puts ""
    puts ""
    puts "You are deploying #{branch_name} branch to the #{deployment_name} server..."
    puts "Note: This is based on a git remote named '#{remote_name}'"
    puts ""

    sure = false

    if deployment_name == 'PRODUCTION'
      puts "You are deploying to #{deployment_name}. Are you sure? [y/n]"
      sure = STDIN.gets.strip == 'y'
    else
      sure = true
    end

    if sure
      
      `git push #{remote_name} #{branch_name}:master`

      puts ""
      puts "Would you like to run migrations? [y/n]"
      puts ""
      puts ""
      if STDIN.gets.strip == 'y'
        puts "...running database migrations..."
        
        output = `heroku run rake db:migrate -r #{remote_name}`
        
        puts output
        puts "...database migrations complete..."
      else
        puts "...database migrations not run..."
      end
      puts "...Complete."
    else
      puts "...deploy aborted."
    end

    puts ""
  end
end
