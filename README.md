# Getting Started

This relies heavily on Node.js.

You'd also need a few packages installed before you continue.
    
    # Note: may require root access.
    $ npm install -g coffee-script
    $ npm install -g less
    $ npm install -g jamjs
    $ npm install -g simple-server

And then, there are some local dependencies required as well. Just use `npm` for that.

    $ npm install

We're almost there.

    $ cake deps:install


Done.

Now, since a lot of the stuff require AJAX calls, be sure you access the index.html file from a server, rather than opening it directly on the browser.

The good news, though, is that while developing, you can open up a local server on the project directory by running the following command

    $ cake run

The significance of this is that you also watch for changes in the CSS code for the "static" part of the system, rather than the dynamic parts--such as the recognitions loader.

## Deploying

Since this entire system is static, you don't need any special servers. However, you will still have to do some trickery before sending it off to the end-user. But it's nothing to complex. It's just a single command and you should be ready to go.

And here's that magical command.

    $ cake dist

Boom. The compiled version should be ready for you in the `dist` folder.

## Adding Dependencies

To add depenendencies to the code just open up the `jam.json` file, and add your dependencies from there.