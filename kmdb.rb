# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
#
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
#
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======
# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========
# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Represented by agent
# ====================
# Christian Bale

### Start of Assignment ###

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Movie.destroy_all
Studio.destroy_all
Actor.destroy_all
Agent.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# TODO!
# In the terminal, I executed the following commands:
#   > rails generate model Movie
#   > rails generate model Studio
#   > rails generate model Actor
#   > rails generate model Agent
#   > rails generate model Role
#
# Then, I added the following code in the db/migrate/ folder for each appropriate model
# for movies:
#   >   t.string "movie_title"
#   >   t.integer "year_released"
#   >   t.string "mpaa_rating"
#   >   t.integer "studio_id"
# for studios:
#   >   t.string "studio_name" 
# for actors:
#   >    t.string "actor_name"
#   >    t.integer "agent_id"
# for agents:
#   >    t.string "agent_name"
# for roles:
#   >    t.integer "movie_id"
#   >    t.integer "actor_id"
#   >    t.string "character_name"
#
# In the terminal, I then executed the following command: 
#   > rails db:migrate

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

# Adding studios
warner_bros = Studio.create!(studio_name: "Warner Bros.")



# Adding movies 
batman_begins = Movie.create!(
  movie_title: "Batman Begins",
  year_released: 2005,
  mpaa_rating: "PG-13",
  studio_id: warner_bros.id
)

dark_knight = Movie.create!(
  movie_title: "The Dark Knight",
  year_released: 2008,
  mpaa_rating: "PG-13",
  studio_id: warner_bros.id
)

dark_knight_rises = Movie.create!(
  movie_title: "The Dark Knight Rises",
  year_released: 2012,
  mpaa_rating: "PG-13",
  studio_id: warner_bros.id
)


# Adding agents
ari = Agent.create!(agent_name: "Ari Emanuel")


# Adding actors (Note: Christian Bale is represented by Ari Emanuel)
christian_bale = Actor.create!(actor_name: "Christian Bale", agent_id: ari.id)
michael_caine = Actor.create!(actor_name: "Michael Caine")
liam_neeson = Actor.create!(actor_name: "Liam Neeson")
katie_holmes = Actor.create!(actor_name: "Katie Holmes")
gary_oldman = Actor.create!(actor_name: "Gary Oldman")
heath_ledger = Actor.create!(actor_name: "Heath Ledger")
aaron_eckhart = Actor.create!(actor_name: "Aaron Eckhart")
maggie_gyllenhaal = Actor.create!(actor_name: "Maggie Gyllenhaal")
tom_hardy = Actor.create!(actor_name: "Tom Hardy")
joseph_gordon_levitt = Actor.create!(actor_name: "Joseph Gordon-Levitt")
anne_hathaway = Actor.create!(actor_name: "Anne Hathaway")



# Adding roles
# 
# Batman Begins
Role.create!(movie_id: batman_begins.id, actor_id: christian_bale.id, character_name: "Bruce Wayne")
Role.create!(movie_id: batman_begins.id, actor_id: michael_caine.id, character_name: "Alfred")
Role.create!(movie_id: batman_begins.id, actor_id: liam_neeson.id, character_name: "Ra's Al Ghul")
Role.create!(movie_id: batman_begins.id, actor_id: katie_holmes.id, character_name: "Rachel Dawes")
Role.create!(movie_id: batman_begins.id, actor_id: gary_oldman.id, character_name: "Commissioner Gordon")

# The Dark Knight
Role.create!(movie_id: dark_knight.id, actor_id: christian_bale.id, character_name: "Bruce Wayne")
Role.create!(movie_id: dark_knight.id, actor_id: heath_ledger.id, character_name: "Joker")
Role.create!(movie_id: dark_knight.id, actor_id: aaron_eckhart.id, character_name: "Harvey Dent")
Role.create!(movie_id: dark_knight.id, actor_id: michael_caine.id, character_name: "Alfred")
Role.create!(movie_id: dark_knight.id, actor_id: maggie_gyllenhaal.id, character_name: "Rachel Dawes")

# The Dark Knight Rises
Role.create!(movie_id: dark_knight_rises.id, actor_id: christian_bale.id, character_name: "Bruce Wayne")
Role.create!(movie_id: dark_knight_rises.id, actor_id: gary_oldman.id, character_name: "Commissioner Gordon")
Role.create!(movie_id: dark_knight_rises.id, actor_id: tom_hardy.id, character_name: "Bane")
Role.create!(movie_id: dark_knight_rises.id, actor_id: joseph_gordon_levitt.id, character_name: "John Blake")
Role.create!(movie_id: dark_knight_rises.id, actor_id: anne_hathaway.id, character_name: "Selina Kyle")




# Prints a header for the movies output
puts "Movies"
puts "======"
# Query the movies data and loop through the results to display the movies output.
# TODO!
Movie.all.each do |movie|
  studio = Studio.find_by({"id" => movie["studio_id"]})
  puts "#{movie["movie_title"]}  #{movie["year_released"]}  #{movie["mpaa_rating"]} #{studio["studio_name"]}"
end



# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
Role.all.each do |role|
  actor = Actor.find_by({"id" => role["actor_id"]})
  movie = Movie.find_by({"id" => role["movie_id"]})
  puts "#{movie["movie_title"]} #{actor["actor_name"]}  #{role["character_name"]}"
end



# Prints a header for the agent's list of represented actors output
puts ""
puts "Represented by agent"
puts "===================="
# Query the actor data and loop through the results to display the agent's list of represented actors output.
# TODO!
ari = Agent.find_by(agent_name: "Ari Emanuel")
Actor.where(agent_id: ari.id).each do |actor|
  puts actor.actor_name
end



