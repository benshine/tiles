Tiles
====

## Overview

This is a Rails 4, Ruby 2.1.2 application that builds a grid of randomly-editable tiles. It's
basically a programming exercise.

To run it, clone this repo then:

    bundle install
    rake db:reset
    rails server

Then go to [http://localhost:3000](http://localhost:3000)

First I tried this in a constrained time period of 3 hours, I built a Backbone solution that implements the UI;
it is [on github, in another branch of this repo](https://github.com/benshine/tiles/tree/exercise-three-hours).
I hadn't been doing any server-side coding lately, so I didn't complete that part of the exercise
within the time limit. I took another shot at the exercise this weekend using rails, and I'm happier
with this solution.

Most of the work is in the [board model](https://github.com/benshine/tiles/blob/master/app/models/board.rb)
and the [front-end coffeescript](https://github.com/benshine/tiles/blob/master/app/assets/javascripts/boards.coffee)

I serialized the tiles' current background color into a hidden input before saving them,
and write the colors directly into inline styles when rendering the board on the server.

I decided to store the tile colors as an array in a single column in the board table
rather than having a separate Tile model class. The tiles don't need any behavior themselves,
and if I stored them as separate objects I'd need to keep track of extra information: row and column,
and which boards they are contained in. Using a single column in the boards table means that
I don't have to keep track of row or column or board ownership; it's all implicit.

The part of this that I am least happy with is how I scale the tiles to take the full
width of their container. I do it like this:

      $('.tile').css('width', tileWidth + 'px')
      $('.tile').css('height', tileWidth + 'px')

but that ends up putting `style="width: 88px; height: 88px"` on every single tile element.
That's lame! It would be better to edit a CSS rule dynamically when the window is resized,
or to give a fixed small width, or to give a fixed with that is calculated server side. I
ran out of time to do any of those things. What I have now, at least, looks good at any
screen width.

I used [Skeleton](http://getskeleton.com/) for css and
[TinyColor](https://github.com/bgrins/TinyColor) for client-side random color generation.

## Annotated Requirements

Create a board of n x m tiles on a web page. **yep**

Each tile on the board will start as white, but when clicked will toggle between a
generated random color and returning to white. Each time a tile is toggled to a
random color it should generate a new random color value. **yep**

Include a button so that users can clear (set all tiles to white) on their board. **yep**

And additionally include a save button that will persist the state of the board to a server side datastore.
**yep, but with a slightly different workflow.** *I didn't read this requirement clearly enough at
 the beginning, and instead built it to first create and save the board, then edit it.*

## Bonus:

 * Create a gallery of all boards which are viewable and editable by any user. **yep**

 <img src="https://raw.githubusercontent.com/benshine/tiles/master/app/assets/images/gallery_screenshot.png?token=AABTZctcb4CnrHRqwnWJqNOecW0VBlC-ks5Us1jVwA%3D%3D">

