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

When you call that command, look closely at the output window, since it will be there that you will have to get the username and API Token in order to authenticate to the fake server that fires up.

### Testing on Another Server

Of course, would also want to test against on another server, such as the main remote one. In this case, you can set up a `local_settings.json` file. It has the properties outlined in the sample JSON data, below.

    {
        "hostname": "http://7geese.com",
        "no_fake_server": true
    }

Just a quick note: when setting the `hostname` property, be sure to leave off the trailing forward slash (`/`), just like in the example.

And also, the `no_fake_server` property is optional, but it's just something that prevents the fake server to start up when the property is set to `true`.

## Deploying

Since this entire system is static, you don't need any special servers. However, you will still have to do some trickery before sending it off to the end-user. But it's nothing too complex. It's just a single command and you should be ready to go.

And here's that magical command.

    $ cake dist

Boom. The compiled version should be ready for you in the `dist` folder.

### But What About Viewing the Built Version Without Even Opening the Dist Folder?

Don't worry, there is a command for that as well. And here it is.

    $ cake build-run

And you should be able to view the compiled version without having to open the index.html file in the compiled version.

Just be sure to call `cake run`, when you want to go back to developping.

## Adding Dependencies

To add depenendencies to the code just open up the `jam.json` file, and add your dependencies from there.

## TODO

* Document the source code.