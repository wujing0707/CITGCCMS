function selectMZ(item) {
	common(item);
}
function suzao_MZ(item) {
	common(item);
}

function suzao_select3(item){
	common(item);
}

function suzao_select4(item){
	common(item);
}

function common(item){
	if (item.selectedIndex != 0) {
		var sUrl;
		sUrl = item.options[item.selectedIndex].value;
		item.selectedIndex = 0;
		if (sUrl != '')
			window.open(sUrl);
	}
}
