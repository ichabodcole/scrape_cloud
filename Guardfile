# A sample Guardfile
# More info at https://github.com/guard/guard#readme

require 'guard/guard'

module ::Guard
  class InlineGuard < ::Guard::Guard
    def run_on_changes(paths)
      puts "running " + paths[0]
      system('ruby ' + paths[0])
    end
  end
end

guard 'InlineGuard' do
  watch(%r{(page_scraper|mechanize_test)\.rb})
end

guard 'livereload' do
  watch(%r{.+\.(css|js|html)})
  # Rails Assets Pipeline
end
