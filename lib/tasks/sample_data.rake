require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke

    Tag.create!(:name => "Tanzen")
    Tag.create!(:name => "Boxen")

    admin = User.create!(
                  :name => "Example User",
                  :email => "example@user.de",
                  :password => "foobar",
                  :password_confirmation => "foobar"
    )
    admin.toggle!(:admin)
    99.times do |n|
      name = "Example User #{n+1}"
      email = "example-#{n+1}@user.de"
      password = "password"
      puts "#{name}, #{email}, #{password}"

      user = User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)

      50.times do |time|
        taglist = "Tanzen"
        taglist = "Boxen" if time.even?

        puts "#{user.name} has a #{time} new messages"

        user.messages.create!(:content => Faker::Lorem.sentence(5), :tag_list => taglist)

        puts "created"
      end

      5.times do |time|
        taglist = "Tanzen"
        taglist = "Boxen" if time.even?

        #get a random date
        start_at = Time.now + (0..365).to_a.sample.days + (0..24).to_a.sample.hours + ((0..1).to_a.sample * 30).minutes
        end_at = start_at + (0..12).to_a.sample.hours

        user.events.create!(:tag_list => taglist, :name => Faker::Lorem.sentence(1), :start_at => start_at, :end_at => end_at)
        puts "#{user.name} has a #{time} new events"
      end
    end
  end
end