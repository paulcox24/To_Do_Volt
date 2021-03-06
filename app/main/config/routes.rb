# See https://github.com/voltrb/volt#routes for more info on routes

get '/about', _action: 'about'
get '/todos', _action: 'todos'

# Routes for login and signup, provided by user-templates component gem
get '/signup', _controller: 'user-templates', _action: 'signup'
get '/login', _controller: 'user-templates', _action: 'login'
get '/account', _action: 'account'

# The main route, this should be last. It will match any params not
# previously matched.
get '/', {}
