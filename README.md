# Getting Started

This template relies heavily on Node.js.

You'd also need a few packages installed before you continue.
    
    # Note: may require root access.
    $ npm install -g coffee-script
    $ npm install -g less
    $ npm install -g jamjs

And then, there are some local dependencies required as well. Just use `npm` for that.

    $ npm install

And done.

We're almost there.

    $ cake deps:install


Done.

Now, since a lot of the stuff require AJAX calls, be sure you access the index.html file from a server, rather than opening it directly on the browser.

## Adding Dependencies

To add depenendencies to the code just open up the `jam.json` file, and add your dependencies from there.