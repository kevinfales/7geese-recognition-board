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

## Development

Since a lot of the source code uses preprocessors, then it will also require automatically updating them when changs are made. Don't worry, only one command will solve all your problem.

    $ cake run

## Deploying

Since this entire system is static, you don't need any special servers. However, you will still have to do some trickery before sending it off to the end-user. But it's nothing to complex. It's just a single command and you should be ready to go.

And here's that magical command.

    $ cake dist

Boom. The compiled version should be ready for you in the `dist` folder.

## Adding Dependencies

To add depenendencies to the code just open up the `jam.json` file, and add your dependencies from there.

## TODO

* Document the source code.