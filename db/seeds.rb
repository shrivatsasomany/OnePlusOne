Answer.create!([
  {user_id: 6, question_id: 25, answer_text: "hi poop", quantifier: "", location: nil}
])
ApiKey.create!([
  {key: "c5f7ef86d7138ec090b26d5be1fb247a", user_id: 21},
  {key: "a44541a8a16cd51e71c7313796d9421b", user_id: 6}
])
Quantifier.create!([
  {text: "Happy"},
  {text: "Sad"},
  {text: "Satiated"},
  {text: "Hungry"},
  {text: "Disgusted"}
])
Question.create!([
  {question_text: "android", description: "from my tablet!", location: "my bed...", picture: nil, game_id: nil, question_type: nil, is_quantifier: nil},
  {question_text: "Two", description: "deux", location: "Boston", picture: nil, game_id: 1, question_type: "Juxtaposition", is_quantifier: nil},
  {question_text: "Three", description: "drei", location: "Boston", picture: nil, game_id: 1, question_type: "Juxtaposition", is_quantifier: nil},
  {question_text: "Stacks @ Noon", description: "Go to Stacks and eat pizza at 12:00pm", location: "Stacks", picture: nil, game_id: 1, question_type: "Juxtaposition", is_quantifier: nil},
  {question_text: "Useless @ Library", description: "Go pretend you're doing work at the libray", location: "Library", picture: nil, game_id: 1, question_type: "Discovery", is_quantifier: true},
  {question_text: "Easter Egg at Olmsted", description: nil, location: nil, picture: nil, game_id: nil, question_type: "Discovery", is_quantifier: nil},
  {question_text: "Food Hall at EAB Building", description: nil, location: nil, picture: nil, game_id: nil, question_type: "Discovery", is_quantifier: nil},
  {question_text: "Parking Permit Hunt", description: nil, location: nil, picture: nil, game_id: nil, question_type: "Discovery", is_quantifier: nil},
  {question_text: "Baseball Field Fun", description: nil, location: nil, picture: nil, game_id: nil, question_type: "Discovery", is_quantifier: nil},
  {question_text: "Ultimate Frisbee Hunt", description: nil, location: nil, picture: nil, game_id: nil, question_type: "Discovery", is_quantifier: nil}
])
QuestionType.create!([
  {type_text: "Juxtaposition"},
  {type_text: "Creation"},
  {type_text: "Connection"},
  {type_text: "Discovery"},
  {type_text: "Prop"}
])
User.create!([
  {email: "poop", name: "poop", game_id: 1, encrypted_password: "$2a$10$DQrEPgbK.BEuA4UKe.Z1luwKyRxHL5VQJ7SoLJq5.9xpfOZIEY4Ue", salt: "$2a$10$DQrEPgbK.BEuA4UKe.Z1lu", isAdmin: true, roles_mask: nil},
  {email: "puke", name: "puke", game_id: 1, encrypted_password: "$2a$10$idSueaC..PLRtb7Lzrgkyedx74a8Zwr8OrlUNLJdBS/drpGOHUFhi", salt: "$2a$10$idSueaC..PLRtb7Lzrgkye", isAdmin: true, roles_mask: 3},
  {email: "pee", name: "pee", game_id: 1, encrypted_password: "$2a$10$D2Io08qF34DXEyCYUg/Fi.yF248kxe6NBMsb9vPxr.PP3rtVmwcxi", salt: "$2a$10$D2Io08qF34DXEyCYUg/Fi.", isAdmin: nil, roles_mask: 4},
  {email: "po", name: "po", game_id: 1, encrypted_password: "$2a$10$uQDI7YhSHLd6R/ftaHUwPua6VKIZGKf1SpO2d0Xs.UpMXnwrvXGTi", salt: "$2a$10$uQDI7YhSHLd6R/ftaHUwPu", isAdmin: false, roles_mask: 4}
])
