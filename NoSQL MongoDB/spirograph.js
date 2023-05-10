var R=6, r=1, a=8; 
var TT = [34.02057281121547, -118.28544543773803];
var coords = [];
var factor = 0.0001
        
var cos=Math.cos, sin=Math.sin, pi=Math.PI, nRev=12;
for(var t=0.0; t<(pi*nRev); t+=0.1){
    var x = ((R+r)*cos((r/R)*t) - a*cos((1+r/R)*t))*factor;
    var y = ((R+r)*sin((r/R)*t) - a*sin((1+r/R)*t))*factor;
    coords.push([x+TT[0], y+TT[1]]);
}

console.log(coords.length);

var output = [];

for (var i = 0; i < coords.length; i++) {
  var location = { "loc": [coords[i][1], coords[i][0]] };
  output.push(location);
}

console.log(JSON.stringify(output, null, 2));
   