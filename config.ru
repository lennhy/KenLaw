require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end



# --To overide basic http requests allow for patch and destroy methods to be used in
use Rack::MethodOverride

use QuestionsController
use UsersController
run ApplicationController
