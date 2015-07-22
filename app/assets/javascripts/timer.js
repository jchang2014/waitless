
var counter =15

var timer = setInterval(function(){waitTimer(counter)},1000);

var waitTimer = function(time) {
  if (counter > 0) {
    var d = time;
    document.getElementsByClassName("result-wait-time-number")[0].innerHTML = d;
  }
  counter -= 1
}


  // var changeHTML = function(.forEach(
  //     function for (i=0; i<array.length; i++) {
  //     console.log(elements[i]);
  //     elements[i].innerHTML = (d);
//       d -= 1;
//     }
//   }
//   counter -= 1;
// }


