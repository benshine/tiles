tiles by benji shine 
=====

## To run:

    npm install
    bower install
    grunt serve
    open http://localhost:9000/
    
    
## Comments

I built this starting with the yeoman backbone generator, then added in tinycolor to
produce random colors and requirejs for better encapsulation and loading.

I met the first part of the requirements: a grid of tiles, turn to a random color on a click,
then toggle back to white if clicked again, plus the reset button. I also added a randomize
button; hit it to (obviously) randomize the colors in the grid. 
    
I don't know how to do server-side storage quickly, so I tried to use Backbone.localStorage
in this three hour window, but it didn't really work out. I could have done 'rails new' and
built something that way, but I wanted to stick with javascript, since that's where I've been
spending my time the last few months. In hindsight, a new rails app might have been 
faster to bring up quickly. 

## Instructions 

Create a board of n x m tiles on a web page. Each tile on the board will start as white, but when 
clicked will toggle between a generated random color and returning to white. Each time a tile is 
toggled to a random color it should generate a new random color value.

Include a button so that users can clear (set all tiles to white) on their board.

And additionally include a save button that will persist the state of the board to a server side datastore.

Instructions:

 * Respond with your attached completed solution at the end of the allotted 3 hour period.

 * Use any languages, frameworks, or 3rd party libraries as you see fit.

 * Get as far as you can through the challenge starting with the front-end experience of rendering 
   and user interaction of the board.

 * Let us know if you have any questions as you're attempting the challenge.

*We'll want to see the source code for you answer as well as the implementation

Bonus:

 * Create a gallery of all boards which are viewable and editable by any user.

You will be judged on:

 * Simplicity of solution

 * Best practices and idioms

 * Use of a framework or sensible data/view separation

 * Code quality, abstractions, and overall architecture

 * Look, feel, and UI embellishments.

