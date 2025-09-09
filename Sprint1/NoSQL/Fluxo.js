>mongosh --port 27017 --dbpath .\01

>mongosh --port 27017

show databases

use favorites

db.createCollection("movies")

show collections
db.movies.insertOne(
    {
        title: "Inception",
        year: 2010,
        genre: ["Action", "Sci-Fi"],
        actors: [
            { name: "Leonardo DiCaprio", character: "Cobb" },
            { name: "Joseph Gordon-Levitt", character: "Arthur" }
        ],
        rating: 8.8,
        streaming: true
    }
)

db.movies.insertMany([
    {
        title: "The Lord of the Rings: The Fellowship of the Ring",
        year: 2001,
        director: "Peter Jackson",
        genre: ["Friendship","Adventure","Epic"],
        actors: [
            {  name: "Elijah Wood", character: "Frodo Beggins" },
            {  name: "Ian McKellen", character: "Gandalf, the Gray" },
            {  name: "Orlando Bloom", character: "Legolas" }
        ],
        rating: 8.9,
        streaming: true
    },

    {
        title: "Donnie Darko",
        year: 2001,
        director: "Richard Kelly",
        genre: ["Psychological Drama","Time Travel","Sci-fi"],
        rating: 8.0,
        streaming: true
    },

    {
        title: "Matrix",
        year: 1999,
        director: ["Lilly Wachowski", "Lana Wachowski"],
        genre: ["Martial Arts","Cyberpunk","Sci-fi", "Action"],
        rating: 8.7,
        streaming: true
    }
])


db.movies.find({preco: { $gt: 8 }})
db.movies.find({
  titles: { $regex: /^t/, $options: 'i' }
})
db.movies.find({
  genre: {
    $in: ["Drama"]}}, 
    {_id: 0, title: 1
})
db.movies.find({actors: {$exists: true}})
db.movies.find({character: "Cobb"})


db.movies.updateOne(
    {name: "The Lord of the Rings: The Fellowship of the Ring"},
    {$set: {rating =+ 0.2}}
)
db.movies.updateOne(
    {name: "Matrix"},
    {$set: {streaming: false}}
)
db.movies.updateOne(
    { title: "The Lord of the Rings: The Fellowship of the Ring" },
    { $push: { actors: { name: "Sean Astin", character: "Samwise Gamgee" }}}
)


db.movies.aggregate([
  { $match: { year: { $lt: 2000 }}},
  { $count: "total"}
])