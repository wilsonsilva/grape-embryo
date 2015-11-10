guard 'bundler' do
  watch('Gemfile')
end

guard 'rack' do
  watch('Gemfile.lock')
  watch(%r{^(config|app|api)/.*})
end

guard :rspec, all_on_start: true, cmd: 'bundle exec rspec --format progress' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^app/(.+)\.rb$}) { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/api/(.+)\.rb$}) { |m| "spec/api/#{m[1]}_spec.rb" }
  watch(%r{^models/(.+)\.rb$}) { |m| "spec/models/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb') { 'spec' }
end

guard :rubocop do
  watch(/.+\.rb$/)
  watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
end
