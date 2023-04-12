function pad(n, width, z) {
  z = z || '0';
  n = n + '';
  return n.length >= width ? n : new Array(width - n.length + 1).join(z) + n;
}

function getlength(number) {
    return number.toString().length;
}

$(function() {
    $('#Submit').click(function() {
        var base = $("#baseName").val();
        var width = $("#width").val();
        var height = $("#height").val();
        var padAmount = 0;
        if ($("#padding").prop("checked")) {
            console.log("fart")
            var padAmount = getlength(width * height);
        }
        
        var output = "";
        for(var i = 0; i < height; i++) {
            for(var j = 0; j < width; j++) {
                var suffix = pad((i*width) + (j+1), padAmount);
                output += ":" + base + suffix + ":";
            }
            output += "\r\n";
        }
        $("#output").val(output);
    });
});