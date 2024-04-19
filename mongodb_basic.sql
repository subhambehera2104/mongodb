-- open mongo shell
mongosh
-- show databases
show dbs
-- create and/or open database
use subham_ecommerce_db
--shwo all collections(tables) in databases
show collections
--create collection(table)
db.createCollection("users")
--insert one document(row) in users collection
db.users.insertOne({
    name: 'subham',
    email: 'subhambehera2104@outlook.com',
    password: 'qwertyuiop',
    phone: '1234567890',
    gender: 'm',
    address: 'Dhepagam',
    Pin: '761004', 
    createdat: new Date(),
    updatedat: new Date()

})

--show all insert data in users collection (select * from users)
db.users.find()
--or 
db.users.find({})
-- insert the data using insertOne again, then 
-- duplicate row with same data will be created, but we don't want it 
   
-- so drop entire collection users
  db.users.drop()
--  and create index on email, mobile of collection users
db.users.createIndex({'email': 1}, {unique: true})
db.users.createIndex({'phone': 1}, {unique: true})
 -- run insertOne query twice, it would fail second time due to 
 -- existing email or mobile with  duplicate key error

--Update any one users(updat usres set where email="subhambehera2104@gmail.com")
db.users.UpdateOne(
    { email: "subhambehera2104@gmail.com" },
    { $set: {name:"Subham Behera", updatedat: new Date()} }
)