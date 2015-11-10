names = %w(Male Female)

names.each do |name|
  Gender.create!(name: name)
end
