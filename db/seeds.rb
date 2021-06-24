User.destroy_all
Score.destroy_all

leon = User.create(username: "Leon", password: "1234566") 
eric = User.create(username: "eric", password: "chicken")
jason = User.create(username: "jtothesun", password: "cats123")

score_var1 = rand(10..100)
score_var2 = rand(10..100)
score_var3 = rand(10..100)

a=Score.create(user_id: leon.id, score_val: score_var1)
b=Score.create(user_id: jason.id, score_val: score_var2)
c=Score.create(user_id: eric.id, score_val: score_var3)