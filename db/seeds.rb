people = [{first_name: "Bill", last_name: "Brinkert", email: "wfbrinkert@gmail.com", age: 45, gender: "male", role: 1, password: "admin"},
 {first_name: "Mike", last_name: "Flaherty", email: "mikef@gmail.com", age: 38, gender: "male", role: 0, password: "1234"},
 {first_name: "Sue", last_name: "Dahner", email: "sdahner@gmail.com", age: 41, gender: "female", role: 0, password: "abcd"},
 {first_name: "Joy", last_name: "Kessler", email: "jkes@gmail.com", age: 42, gender: "female", role: 0, password: "qwer"}]

 friends = [{user_id: 1, target_user_id: 2, relationship_code: 0},
            {user_id: 1, target_user_id: 3, relationship_code: 1},
            {user_id: 1, target_user_id: 4, relationship_code: 2},
            {user_id: 2, target_user_id: 3, relationship_code: 2},
            {user_id: 2, target_user_id: 4, relationship_code: 1}]

people.each do |person|
  User.create(person)
end

friends.each do |friend|
  Friend.create(friend)
end
