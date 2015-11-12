User.create!([
  {email: "example@email.com", password: "123456example", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, name: "Example user"}
])
ApiKey.create!([
  {access_token: "ac4bd425935c350a54aabb362906283f", expires_at: "2043-03-29 21:54:04", user_id: User.first.id, active: true}
])
Sensor.create!([
  {name: "Sensor example #1", description: "Description for the sensor example number one.", kind: 1},
  {name: "Sensor example #2", description: "Description for the sensor example number two.", kind: 1}
])
Measure.create!([
  {value: 50, sensor_id: 1, created_at: Time.now},
  {value: 55, sensor_id: 1, created_at: Time.now+2},
  {value: 60, sensor_id: 1, created_at: Time.now+3},
  {value: 65, sensor_id: 1, created_at: Time.now+4},
  {value: 70, sensor_id: 1, created_at: Time.now+5},
  {value: 75, sensor_id: 1, created_at: Time.now+6},
  {value: 80, sensor_id: 1, created_at: Time.now+7},
  {value: 85, sensor_id: 1, created_at: Time.now+8},
  {value: 90, sensor_id: 1, created_at: Time.now+9},
  {value: 95, sensor_id: 1, created_at: Time.now+10},
  {value: 300, sensor_id: 2, created_at: Time.now},
  {value: 295, sensor_id: 2, created_at: Time.now+2},
  {value: 290, sensor_id: 2, created_at: Time.now+3},
  {value: 285, sensor_id: 2, created_at: Time.now+4},
  {value: 280, sensor_id: 2, created_at: Time.now+5},
  {value: 305, sensor_id: 2, created_at: Time.now+6},
  {value: 310, sensor_id: 2, created_at: Time.now+7},
  {value: 315, sensor_id: 2, created_at: Time.now+8},
  {value: 320, sensor_id: 2, created_at: Time.now+9}
])
