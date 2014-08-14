require "spec_helper"

describe User do
  it "gets all users" do
    u = User.create({name: "Sumeet", age: 21, bio: "My bio."})
    # expect(User.all).to include("Happy Birthday") # Fails.
    expect(User.all).to include(u)
  end

  it "create a new user entirely" do
    u = User.create({name: "Sumeet", age: 21, bio: "My bio."})
    expect(1).to eq(1)
  end
    #
    # it "gets one user - by their ID" do
    # u = User.create("Sumeet", 21, "My bio.")
    #
    # user_from_db = User.find(u.id)
    #
    # expect(user_from_db.name).to eq("Sumeet")
    # end
    #
    # it "finds users older than 20" do
    # User.create("Mindy", 35, "About Mindy.")
    # User.create("Beth", 21, "About Beth.")
    # User.create("Sachin", 18, "About Sachin.")
    #
    # users = User.where("age > 20")
    # young_users = User.where("age <= 20")
    #
    # expect(users.length).to be >= 2
    # expect(young_users.length).to be >= 1
    # end

  it "get one user - by their name"
  it "get all users with a name like something..."
  it "set a user's name"
  it "deletes a user"
end
