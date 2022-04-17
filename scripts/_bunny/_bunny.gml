function bunny_init() {
	global._bunnyDictionary = "en";
	global._bunnyMap = ds_map_create();
	bunny_loadDictionary(global._bunnyDictionary);
}

function bunny_loadDictionary(dictionary) {
	global._bunnyDictionary = dictionary;
	
	var dicPath = working_directory + "/filter/" + global._bunnyDictionary + ".dic";
	var file = file_text_open_read(dicPath);
	var dicStr = file_text_read_string(file);
	var dicWords = _bunny_split(base64_decode(dicStr), "\n");
	var n = array_length(dicWords);
	for (var i = 0; i < n; i++) {
		var word = dicWords[i];
		global._bunnyMap[? word] = true;
		//show_debug_message(word);
	}
}

function bunny_check(str) {
	var cleanStr = _bunny_sanitize(str);
	var words = _bunny_split(cleanStr);
	var n = array_length(words);
	for (var i = 0; i < n; i++) {
		var word = words[i];
		if (global._bunnyMap[? word] != undefined) return true;
	}
	return false;
}

function bunny_clean(str, replaceKey = "*") {
	var words = _bunny_filter(str, replaceKey);
	var n = array_length(words);
	var cleanStr = "";
	for (var i = 0; i < n; i++) {
		cleanStr += words[i] + " ";
	}
	return cleanStr;
}

function _bunny_sanitize(str) {
	// convert to lower case
	str = string_lower(str);
	// TODO: convert similar symbols
	// TODO: replace punctuation with spaces 
	return str;
}

function _bunny_filter(str, replaceKey = "*") {
	// split string
	var words = _bunny_split(str);
	var n = array_length(words);
	for (var i = 0; i < n; i++) {
		var word = _bunny_sanitize(words[i]);
		if (global._bunnyMap[? word] != undefined) {
			var wordSize = string_length(word);
			words[i] = string_repeat(replaceKey, wordSize);
		}
	}
	return words;
}

function _bunny_split(str, delim = " ") {
	// split str by delim
	var tokens = [];
	var word = "";
	var wordSize = 0;
	str = str + delim;
	var n = string_length(str);
	for (var i = 0; i < n; i++) {
		var char = string_char_at(str, i+1);
		if (char != delim) {
			word = word + char;
			wordSize++;
		} else {
			if (wordSize != 0) {
				array_push(tokens, word);
			}
			word = "";
			wordSize = 0;
		}
	}
	return tokens;
}