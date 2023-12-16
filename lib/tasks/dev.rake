namespace :dev do
  desc "Configure development environment"
  task setup: :environment do
    puts "Creating contacts kind..."
    kinds = %w(Amigos Familiares Trabalho)
    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end
    puts "Contacts kinds created with success!"


    puts "Creating contacts..."
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.birthday(min_age: 18, max_age: 65),
        kind: Kind.all.sample
      )
    end
    puts "Contacts created with success!"
  end

end
