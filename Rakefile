require "bundler/gem_tasks"
test = File.expand_path('../test', __FILE__)
$LOAD_PATH.unshift(test) unless $LOAD_PATH.include?(test)

task default: :test

task :test do
  Dir.glob('./test/*_test.rb').each { |file| require file}
end

task :test_error_mapper do
  Dir.glob('./test/error_mapper/*_test.rb').each { |file| require file}
end
