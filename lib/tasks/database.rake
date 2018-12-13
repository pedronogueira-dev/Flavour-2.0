namespace :database do
  desc "Setup Database -> db:create, db:migrate, db:seed"
  task setup: :environment do
    sh 'rails db:create'
    sh 'rails db:migrate'
    sh 'rails db:seed'
  end

  desc "Reset Database -> db:drop, db:create, db:migrate, db:seed"
  task reset: :environment do
    sh 'rails db:drop'
    Rake::Task['database:setup'].invoke
  end
end

task database: 'database:setup'
