# Customer support system Api

## Requirements

- Ruby '3.0.0'
- Bundler
- Rails 7.0.3
- Postgres

If you already fufill the requirements move the the installation section.

## Install Ruby
Install ```ruby '3.0.0'``` using rvm follow [this guide](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rvm-on-ubuntu-20-04) to install rvm on ubuntu.
Then run ``` rvm install 3.0.0```

## Install Bundler
Bundler helps us manage and install gems. Learn more about it [here](https://github.com/rubygems/bundler).
Run ``` gem install bundler ``` to install.

## Install Rails
Run ``` gem install rails 7.0.3```

## Postgresql
Follow [this](https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart) tutorial to install postgresql on ubuntu.

## Installtion

Clone the repository
``` git clone https://github.com/AdetunjiTejumade/customer_support_system```

## Install Ruby dependencies
```cd customer_support_ticketing_system/```
run ```bundle install``` to install the required dependencies

## Setup the database

```rails db:create
rails db:migrate
rails db:seed
```


## Start app

``` rails s ```

Site should now be live at [localhost:3000](http://localhost:3000)


## API DOCUMENTATION

### Authentication
Signup
```POST /signup```
Login
```POST /login ```

### Tickets(requests)
``` POST /tickets ``` create new ticket
``` GET /tickets ``` Get all tickets for a user
``` PUT /tickets/:ticket_id]``` Update a ticket
``` GET /tickets/:ticket_id]``` Get a ticket
``` DELETE /tickets/:ticket_id]``` Delete a ticket
``` POST /:ticket_id/comments ``` Add comment to a ticket
``` GET /agent/tickets``` Get tickets assigned to an agent
``` PUT /agent/tickets/:ticket_id] ``` Update a ticket status (agent)

## Assumptions
- There's an admin that creates Agent accounts (The sign up api only creates customer accounts).

## Limitations

## Issues 
- Automaticallly assigning tickets to agents. Currently this is done randomly. Can be improved to follow the round-robin technique 

## Feedback
