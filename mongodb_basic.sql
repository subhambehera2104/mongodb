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

--Update any one users(updat usres set where email="subhambehera2104@outlook.com")
db.users.updateOne(
    { email: "subhambehera2104@outlook.com" },
    { $set: {name:"Subham Behera", updatedat: new Date()} }
)
--delete anyone user from users
db.users.deleteOne( {name: 'Subham Behera'} )
-- delete exists documents (rows ) in collection  
db.usesr.deletteMany({})
--insert many users
db.users.insertMany([
 {name: "Subham Behera", email: "subhambehera2104@gmail.com", password: "asd123",  phone: "0987654321", gender: "m", address: "Krupasindupalli", created_at: new Date(), update_at: new Date() },
 {name: "Devendra Dora", email: "devendradora@gmail.com", password: "somthing", phone: "1234567890", gender: "m", address: "Patrapur", created_at: new Date(), update_at: new Date() },
 {name: "Somanath", email: "somanathg238@gmail.com", password: "somanath", phone: "4634354683", gender: "m", address: "Dhepagam", created_at: new Date(), update_at: new Date()},
 {name: "Sai", email: "sai@gmail.com", password: "sai#@!", phone: "2177895432", gender: "m", address: "Krupasindupalli", created_at: new Date(), update_at: new Date()}, 
 {name: "Umapati", email: "umapati@gmail.com", password: "umapati!@#@", phone: "1023245678", gender: "m", address: "Dhepagam", created_at: new Date(), update_at: new Date()}
])
db.users.updateOne(
  {email: "somanathg238@gmail.com" },
  { $set: {created_at:ISODate('2023-04-17T18:19:23.584Z')} }
)
mongoimport --db subham_ecommerce_db --collection users --file users_insert.json --jsonArray

--select * from user
db.users.find()
db.users.find({})
--select name, email from users
db.users.find({}, {name: 1, email: 1})
--find adderss from phone
db.users.find({}, {phone: 1})
--find distinct gender from usres
db.users.distinct('gender')
--find the name order by asc
db.users.find().sort({name: 1})
--find the gender order by asc
db.users.find().sort({gender: 1})
--find the name from users roder by dsc
db.users.find().sort({name: -1})
db.users.find().sort({created_at: 1}).limit(2)
db.users.find().sort({created_at: -1}).limit(2)
db.users.countDocument({gender: "M"})
db.users.countDocument({gender: 'F'})

 -- Select all users and group them by gender
 db.users.aggregate({$group: {_id: '$gender', user_count: {$sum: 1}}})
 db.users.aggregate({$group: {_id: '$name', user_count: {$sum: 1}}})

db.users.find().limit(3)
db.users.find().skip(10)
db.users.find().limit(2).skip(3)
--get id, name of oldest users
db.users.find({}, {name: 1}).sort({created_at: 1}).limit(1)

--find oldest users with only name
db.users.find({}, {_id: 0, name: 1}).sort({created_at: 1}).limit(1)

--find second oldest user
db.users.find().sort({created_at: 1}).skip(1).limit(1)

--find new user from users collections
db.users.find().sort({created_at: -1}).limit(1)

--find new user with id, name
db.users.find({}, {name: 1}).sort({created_at: -1}).limit(1)

--find new user with only name
db.users.find({}, {_id: 0, name: 1}).sort({created_at: -1}).limit(1)

--find second new ueser
db.users.find().sort({created_at: -1}).skip(1).limit(1)

-- Get all users starting with D. % means many , ^ means starts with
db.usres.find({name: /^S/})

-- Get all users starting with a. % means many, $ means ends with
-- select * from users where name like "%a";
db.users.find({name: /a$/})

-- Get all users containing ve
-- select * from users where name like "%ve%";
db.users.find({name: /ve/})

-- Get all users that starts with D , contains ve and ends with a
-- select * from users where name like "D%ve%a";
db.users.find({name: /^D.*ve.*a$/})
 
-- Get all users whose names start with 'D' and are male
-- select * from users where name like "D%" and gender="MALE";
db.users.find({$and: [{name: /^D/}, {gender: 'MALE'}]})


-- Get all users whose names start with 'D' or are male
-- select * from users where name like "D%" or gender="MALE";
db.users.find({$or: [{name: /^D/}, {gender: 'MALE'}]})

db.users.aggregate({$group: {_id: '$gender', {
}}})




db.user_addresses.insertOne(
   {
    user_id: ObjectId('662012abcff0910b22117b83'),
    address_line_1: 'Sri Ganesh Residency',
    address_line_2: 'Ganesh Road',
    street: 'Karjee Street',
    landmark: 'Near Ram Mandir',
    city: 'Patrapur',
    state: 'Odisha',
    country: 'India',
    pincode: '761004',
    is_default: true
  }
  )
 db.user_addresses.insertMany([
  {
    user_id: ObjectId('66213059eba87aa634c26bf2'),
    address_line_1: 'Vishnu Residency',
    address_line_2: 'Dora Road',
    street: 'Dabburi Street',
    landmark: 'Hanuman Temple',
    city: 'Beilupada',
    state: 'Andhra Pradesh',
    country: 'India',
    pincode: '532312',
    is_default: false
  },
  {
    user_id: ObjectId('66213059eba87aa634c26bf1'),
    address_line_1: 'Shiva Residency',
    address_line_2: 'Main Road',
    street: 'Telaga Street',
    landmark: 'Near Ram Mandir',
    city: 'Patrapur',
    state: 'Odisha',
    country: 'India',
    pincode: '532312',
    is_default: false
  }
  ]) 

  -- left join users and user_addresses
  db.users.aggregate([
  {
    $lookup: {
      from: 'user_addresses',
      localField: '_id',
      foreignField: 'user_id',
      as: 'user_addresses'
    }
  }
])

-- join users and user_addresses
db.users.aggregate([
  {
    $lookup: {
      from: 'user_addresses',
      localField: '_id',
      foreignField: 'user_id',
      as: 'user_addresses'
    }
  },
  {
    $match: {
      user_addresses: { $ne: [] } -- This will remove the users who don't have addresses
    }
  }
])
-- Join users and user_addresses and select all users with more than one address
db.users.aggregate([
  {
    $lookup: {
      from: 'user_addresses',
      localField: '_id',
      foreignField: 'user_id',
      as: 'user_addresses'
    }
  },
  {
    $match: { 'user_addresses.1': { $exists: true } }
  }
])
db.products.insertMany([
  {
    name: "Laptop",
    description: "High-performance laptop",
    sku: "LT001",
    barcode: "LT001",
    mrp: 25000.00,
    selling_price: 24000.00,
    stock_quantity: 50,
    product_category_id: 1,
    created_at: new Date(),
    updated_at: new Date()
  },
  {
    name: "Mobile",
    description: "Smartphone with latest features",
    sku: "MB001",
    barcode: "MB001",
    mrp: 15000.00,
    selling_price: 14500.00,
    stock_quantity: 100,
    product_category_id: 2,
    created_at: new Date(),
    updated_at: new Date()
  },
  {
    name: "Mouse",
    description: "Wireless mouse",
    sku: "MS001",
    barcode: "MS001",
    mrp: 200.00,
    selling_price: 180.00,
    stock_quantity: 200,
    product_category_id: 3,
    created_at: new Date(),
    updated_at: new Date()
  },
  {
    name: "Keyboard",
    description: "Ergonomic keyboard",
    sku: "KB001",
    barcode: "KB001",
    mrp: 300.00,
    selling_price: 290.00,
    stock_quantity: 150,
    product_category_id: 4,
    created_at: new Date(),
    updated_at: new Date()
  }
])
-- select the max price item
 db.products.find().sort({ mrp: -1 }).limit(1)

-- select the 2nd max price item
 db.products.find().sort({ mrp: -1 }).skip(1).limit(1)
-- select the lowest price item
 db.products.find().sort({ mrp : 1 }).limit(1)
 
-- select the 2nd lowest price item
 db.products.find().sort({ mrp: 1 }).skip(1).limit(1)

  -- select all product mrp > 20000 ( greather than )
 db.products.find({ mrp: { $gt: 20000 }})
 
  -- select all product mrp < 20000 ( less than )
  db.products.find({ mrp: { $lt: 500 }})

   -- sum of all mrp of product
db.products.aggregate({$group: {_id: null, total_mrp: {$sum: '$mrp'}}})
db.products.find({sku: 'LT001'})
db.products.find({ created_at: { $gt: new Date("2024-04-20") } })

