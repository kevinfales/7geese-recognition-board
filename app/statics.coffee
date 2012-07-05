define [], ->

    return ->
        statics =
            hostname: 'http://192.168.0.13:8000'

        retVal = {}

        for k,v of statics
            retVal[k] = v

        return retVal