# Rock Paper Scissors Homework

In this project, you will practice using routes with variable segments, and using a database to store information permanently.

## Setup

 1. First **fork** this repository to your own account.
 1. *Then* clone from **your copy** to your computer.
 1. `cd` into the root folder.
 1. `bundle install` (or `bundle` for short)
 1. `rails server` (or `rails s` for short)
 1. Open the whole folder of code in Sublime.
 1. Navigate to [http://localhost:3000](http://localhost:3000) in Chrome.

The first thing to notice is that, when you visit the bare domain, it redirects you to the URL [http://localhost:3000/mockup.html](http://localhost:3000/mockup.html).

Read `config/routes.rb` and `app/controllers/game_controller.rb` to see how I achieved that. Then, ignore that code. I just included it for your convenience.

## Part 1: Make the game work

Suppose you and I are working on a two-person dev team. I am the front-end developer, and you are the back-end developer. We have been hired to clone this app: [https://rps-target.herokuapp.com](https://rps-target.herokuapp.com)

I have already finished my part of the job. I have written a mockup that includes all the necessary Bootstrap markup. I populated the mockup with static, dummy data. You can view my static mockup at `public/mockup.html`.

The three URLs that I used for the links, `/play/rock`, `/play/paper`, `/play/scissors`, don't work. Your job: make everything work.

===

You can approach it however you like, but here is a suggested plan of attack:

Add a single, dynamic route:

    get("/play/:the_move", { :controller => "game", :action => "rps" })

Connect the RCAV dots; get some static output to show up (e.g., "Hi!"). Remember your [RCAV cheatsheet](https://gist.github.com/rbetina/c200d88adcfe0d4dcd04).

Copy the markup over from the mockup into your view templates. (Some of the markup should go in the application layout (the stuff that is common to every page), and some of it should go in your view template (the stuff that changes based on each request).)

Bring the static markup in your view template to life, one piece at a time:

 - Replace static markup with embedded Ruby to make the user's move panel dynamic. It should show the right copy and image depending on whether I visit `/play/rock`, `/play/paper`, or `/play/scissors`. Remember: Rails puts whatever comes after the slash in a variable route into the `params` hash. Look at your server log to see what it looks like. In the action, pull the input out of the `params` hash.
 - Replace static markup with embedded Ruby to make the computer's move panel dynamic. In the action, choose a random move for the computer.
 - Replace static markup with embedded Ruby to make the outcome well dynamic. In the action, write some logic to calculate the correct outcome.

## Part 2: Track move history

Let's add a database table to permanently store every turn.

Let's call the table "moves", and let's have four columns in it: `user_move`, `computer_move`, `user_wins`, `computer_wins`, and `tie`. In the last three columns, we'll plan to store a 1 if that was the outcome of the turn, or a 0 if not.

Let's generate the model and table. Run the following command at the command line:

    rails generate model move user_move:string computer_move:string user_wins:integer computer_wins:integer tie:integer

That command will write two files for us to save us time; `app/models/move.rb`, and a file in the `db/migrate` folder with instructions to create a database table.

Let's execute those instructions with the command

    rake db:migrate

We now have a table called "Move" with five columns, which is ready to receive entries.

#### Your tasks

In the action, write some logic to create a new row in the `Move` table, assign a value to each of the five cells, and then save it.

In the view template, bring each section of the history pane on the right to life using the `Move` table.

Some useful methods: [.order](http://guides.rubyonrails.org/active_record_querying.html#ordering), [.sum](http://guides.rubyonrails.org/active_record_querying.html#sum). Everything you need is in the [CRUD with Ruby cheatsheet](https://gist.github.com/rbetina/bb6336ead63080be2ff4).

## Remember to commit and sync your work often. Good luck!
