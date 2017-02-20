require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# environment = Sprockets::Environment.new
# environment.append_path "assets/javascript"
# set :public_folder, 'public'
#
# map "/public" do
#   run Rack::Directory.new("./public")
# end

# --To overide basic http requests allow for patch and destroy methods to be used in

use Rack::MethodOverride

use AmendmentsController
use QuestionsController
use UsersController
use CommentsController
run ApplicationController
