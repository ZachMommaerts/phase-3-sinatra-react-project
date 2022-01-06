puts "🌱 Seeding spices..."

Username.create(name: '7331_GAMER')
Username.create(name: 'cutey-patootie')
Username.create(name: 'xXSnIpEr-GoDXx')
Username.create(name: 'SSJ-SuperKid')

Score.create(score: rand(0..10), username_id: rand(1..4))
Score.create(score: rand(0..10), username_id: rand(1..4))
Score.create(score: rand(0..10), username_id: rand(1..4))
Score.create(score: rand(0..10), username_id: rand(1..4))
Score.create(score: rand(0..10), username_id: rand(1..4))
Score.create(score: rand(0..10), username_id: rand(1..4))
Score.create(score: rand(0..10), username_id: rand(1..4))
Score.create(score: rand(0..10), username_id: rand(1..4))
Score.create(score: rand(0..10), username_id: rand(1..4))
Score.create(score: rand(0..10), username_id: rand(1..4))
Score.create(score: rand(0..10), username_id: rand(1..4))
Score.create(score: rand(0..10), username_id: rand(1..4))
Score.create(score: rand(0..10), username_id: rand(1..4))
Score.create(score: rand(0..10), username_id: rand(1..4))

puts "✅ Done seeding!"
