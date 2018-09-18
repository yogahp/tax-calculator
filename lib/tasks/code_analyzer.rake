namespace :code_analyzer do
  desc 'Code Analyzer'
  task all: :environment do
    sh 'rubocop --require rubocop-rspec'
    sh 'fasterer'
    sh 'bundler-audit'
    sh 'reek'
    sh 'rails_best_practices'
    sh 'brakeman'
    sh 'rspec'
  end
end
