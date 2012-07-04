window.describe = function (message, callback) {
    module(message);
    callback();
};

window.it = function (message, callback) {
    test(message, callback);
};

window.expect = function (actual) {
    return {
        toBe: function (expected) {
            strictEqual(actual, expected);
        },
        toEqual: function (expected) {
            equal(actual, expected);
        },
        toBeDefined: function () {
            notEqual(typeof actual, 'undefined');
        },
        toBeUndefined: function () {
            equal(typeof actual, 'undefined');
        },
        toBeNull: function () {
            strictEqual(actual, null)
        },

        not: {
            toBe: function (expected) {
                notStrictEqual(actual, expected);
            },
            toEqual: function (expected) {
                notEqual(actual, expected);
            },
            toBeDefined: function () {
                equal(typeof actual, 'undefined');
            },
            toBeUndefined: function () {
                notEqual(typeof actual, 'undefined');
            },
            toBeNull: function () {
                notStrictEqual(actual, null);
            }
        }
    };
};
