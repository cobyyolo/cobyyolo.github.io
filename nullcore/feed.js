function timeSinceUpdate(ms) {
	var date = new Date(ms)
	var updateDate = new Date("December 3, 2021 08:02:14").getTime();
	var difference = date - updateDate;
	return(dhms(difference));
}

function dhms(t){
	var cd = 24 * 60 * 60 * 1000,
        ch = 60 * 60 * 1000,
		cm = 60 * 1000,
        d = Math.floor(t / cd),
        h = Math.floor( (t - d * cd) / ch),
        m = Math.floor( (t - d * cd - h * ch) / cm),
		s = Math.round( (t - d * cd - h * ch - m * cm) / 1000),
        pad = function(n){ return n < 10 ? '0' + n : n; };
	
	if( s === 60 ){
		m++;
		s = 0;
	}
	if( m === 60 ){
		h++;
		m = 0;
	}
	if( h === 24 ){
		d++;
		h = 0;
	}
	return(d + ' days<br>' + pad(h) + ':' + pad(m) + ':' + pad(s));
}

function tick() {
  var ms = new Date().getTime();
  var elem = $('timestamp');
  elem.innerHTML = timeSinceUpdate(ms);
}

tick();
var tickId = setInterval('tick()', 1000);