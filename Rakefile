require "bundler/gem_tasks"
test = File.expand_path('../test', __FILE__)
$LOAD_PATH.unshift(test) unless $LOAD_PATH.include?(test)

task default: :test

task :test do
  Dir.glob(['./test/*_test.rb', './test/error_mapper/*_test.rb','./test/features/*_test.rb']).each { |file| require file}
end

task :test_error_mapper do
  Dir.glob('./test/error_mapper/*_test.rb').each { |file| require file}
end

task :test_features do
  Dir.glob('./test/features/*_test.rb').each { |file| require file}
end
