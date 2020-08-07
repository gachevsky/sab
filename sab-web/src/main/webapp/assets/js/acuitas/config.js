/*
 * underscore templates configurator
 */

define([], 
function(){
    var setUp = function(){
        // Underscore Configuration
        _.templateSettings = {
            evaluate    : /<\?([\s\S]+?)\?>/g,
            interpolate : /<\?=([\s\S]+?)\?>/g
        };
        
    };
    return { setUp: setUp }; // or something like that
});