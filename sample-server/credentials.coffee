usernames = [
    'cat'
    'dog'
    'mouse'
]

username = usernames[Math.floor Math.random() * usernames.length]

token = ''
for i in [0..20]
    token += String.fromCharCode (Math.floor Math.random() * 26) + 97

module.exports.username = username
module.exports.token = token