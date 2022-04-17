/// @description Insert description here
// You can write your code in this editor

var testStr = "ass lol dang shit oof AsS aSs sHIt";
//var words = _bunny_split(testStr);

//for (var i = 0; i < array_length(words); i++) {
//	show_debug_message(words[i]);
//}

bunny_init();

//show_debug_message(string(bunny_check(testStr)));
var filtered = bunny_clean(testStr);
show_debug_message(filtered);
