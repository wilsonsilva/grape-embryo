names = %w[Male Female]

names.each do |name|
  Embryo::Gender.create!(name: name)
end
