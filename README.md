# Adding Real-Time To Your RESTful Rails App

This repository contains the code for both the Rails app, and the Node app, that accompanies the blog entry ["Adding Real-Time To Your RESTful Rails App"](http://liamkaufman.com/blog/2013/02/27/adding-real-time-to-a-restful-rails-app/).

## Steps I Took

Below are some of the steps I took, that were not outlined in the above blog entry. Make sure you have Redis installed and running!

```
rails new rails_realtime --database=postgresql
cd rails_realtime

rake db:create
rails generate scaffold Book title:string num_pages:integer
rake db:migrate
```

Add ```gem 'redis'``` to Gemfile, then run ```bundle install```.

### Creating The Node.js App

```
mkdir realtime
cd realtime
echo 'Real-Time' > README.md
```

Then create ```package.json``` (see ```realtime/package.json``` for reference). From the realtime directory run ```npm install```. In your Rails' ```.gitignore``` file add ```/realtime/node_modules``` to ignore the installed node modules.

### The Backbone.js App

The Backbone.js application resides in ```app/assets/javascripts```. ```application.js``` specificies the javascript files that comprise the web application and their load order. If you're building a real production app you may want to look into Require.js to manage your dependencies. ```app.js.coffee``` is the starting point for the Backbone.js application.

## To Start The App

The Rails App: ```rails s```

The Node App (from the railtime folder): ```node realtime-server.js```


# Done

Between the Blog, the code in this repository, and the above steps you should hopefully have the information necessary to add real-time to your Rails app!