# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



def generate_random_name
  "#{Faker::Name.name} - #{SecureRandom.hex(10) }"
end

10.times do
  project = Project.create(name: generate_random_name)
  "---> Created project #{project.name} <---"

  tasks_attributes = []

  100_000.times do
    tasks_attributes << {
      title: generate_random_name,
      status: :done,
      project_id: project.id
    }
  end

  1_000.times do
    tasks_attributes << {
      title: generate_random_name,
      status: :in_progress,
      project_id: project.id
    }
  end

  10_000.times do
    tasks_attributes << {
      title: generate_random_name,
      status: :todo,
      project_id: project.id
    }
  end

  Task.insert_all(tasks_attributes)
end
