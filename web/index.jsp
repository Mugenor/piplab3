<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ru">
<head>
  <link rel="shortcut icon" href="resources/images/favicon.png" type="image/png" />
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Special For You</title>
  <style>
    body {
      background-image: url(resources/images/767.jpg);
      background-attachment: fixed;
      background-size: 100%;
    }
    header {
      text-align: right;
      background: url(resources/images/ocean4.jpg) center bottom;
      font-family: fantasy;
      color: #b5fff8;
      outline: 3px solid #000000;
      border: 3px solid #fff;
      padding-bottom: 0.4%;
      padding-right: 1.5%;
    }
    #name {
      font-size: 270%;
    }
    #group {
      font-size: 150%;
    }

    #form {
      outline: 3px solid #000000;
      border: 3px solid #fff;
      background: url(resources/images/ocean8.jpg);
      height: 22%;
      width: 20%;
      margin-top: 1%;
      color: #b2ffcc;
      font-size: 110%;
    }
    #_x {
      margin-left: 22%;
      margin-top: 2%;
    }
    #_R {
      margin-top: 2%;
      margin-left: 38%;
    }
    #buttonserver {
      margin-top: 2%;
      margin-bottom: 2%;
      margin-left: 22%;
      width: 90%;
    }
    .bs {
      width: 29%;
    }
    #tableY {
      margin-top: 2%;
      margin-left: 7%;
    }
    audio, img, #tableRes {
      position: absolute;
      right: 0.6%;
      top: 17%;
      outline: 3px solid #000000;
      border: 3px solid #fff;
    }
    img {
      top: 24.5%;
    }
    #tableRes {
      background: url(resources/images/ocean9.jpg);
      width: 20%;
      color: #00115e;
      top: 43%;
      right: 0.1%;
    }
    td {
      text-align: center;
    }
    .highlight {
      background: #b5fff8;
    }
    #canvas {
      outline: 3px solid #000000;
      border: 3px solid #fff;
      margin-top: 1%;
    }
  #myInput{
    position: absolute;
    top: 50%;
    left: 50%;
  }
  </style>
</head>
<body>
<header>
  <div id="name">
    Чернов Илья, Клокова Елизавета
  </div>
  <div id="group">
    P3211, вариант 306
  </div>
</header>

<input id="myInput" type="button" value="Click me pls!">
<script>
  var inp = document.getElementById("myInput");
  inp.onclick = function (event) {
      inp.setAttribute("style", "top: " + (Math.random()*100) + "%;");
      inp.setAttribute("style", "left: " + (Math.random()*100) + "%;");
  }
</script>

<div id="form">
  <form>
    <div id='_x'>
      X: <input maxlength="5" id="__x" type=text name="x" value="0.0"> <br>
    </div>
      <table id="tableY" cellpadding="3%">
        <tbody>
        <tr>
          <td>Y: </td>
          <td><input name="radio" type="radio" value="-2"></td>
          <td><input name="radio" type="radio" value="-1.5"></td>
          <td><input name="radio" type="radio" value="-1"></td>
          <td><input name="radio" type="radio" value="-0.5"></td>
          <td><input name="radio" type="radio" value="0"></td>
          <td><input name="radio" type="radio" value="0.5"></td>
          <td><input name="radio" type="radio" value="1"></td>
          <td><input name="radio" type="radio" value="1.5"></td>
          <td><input name="radio" type="radio" value="2"></td>
        </tr>
        <tr>
          <td></td>
          <td>-2</td>
          <td>-1.5</td>
          <td>-1</td>
          <td>-0.5</td>
          <td>0</td>
          <td>0.5</td>
          <td>1</td>
          <td>1.5</td>
          <td>2</td>
        </tr>
        </tbody>
      </table>
    <div id='_R'>
      R: <select name="R" id="SelR">
      <option value="1">1</option>
      <option value="1.5">1.5</option>
      <option selected value="2">2</option>
      <option value="2.5">2.5</option>
      <option value="3">3</option>
    </select> <br>
    </div>
    <div id="buttonserver">
      <input id="hid" type="hidden" name="r" value="-1"/>
      <input id="ok" class="bs" type=button value="Проверить">
      <input id="res" class="bs" type=reset value="Отменить">
    </div>
  </form>
</div>
<canvas id="canvas" width=500 height=400></canvas>
<script>
    var printCanvas = function (valueR) {
        var canvas = document.getElementById("canvas"),
            ctx = canvas.getContext('2d');
        var halfX = canvas.width/2;
        var halfY = canvas.height/2;
        var mult = canvas.width/10;
        var padXS = canvas.width/10;
        var padYS = canvas.height/10;
        var padXsmall = canvas.width/7.5;
        var padYsmall = canvas.height/40;
        function axis(x, y) {
            ctx.moveTo(halfX, halfY);
            ctx.lineTo(x, y);
        }
        ctx.fillStyle = "white";
        ctx.fillRect(0, 0, canvas.width, canvas.height);
        ctx.fillStyle = "#22b9ff";
        ctx.strokeStyle = "#22b9ff";
        ctx.beginPath();
        ctx.arc(halfX, halfY, valueR*mult, 3/2*Math.PI, Math.PI, true);
        ctx.lineTo(halfX, halfY);
        ctx.lineTo(halfX, halfY + valueR*mult);
        ctx.lineTo(halfX + valueR/2.0*mult, halfY);
        ctx.lineTo(halfX + valueR/2.0*mult, halfY - valueR*mult);
        ctx.lineTo(halfX, halfY - valueR*mult);
        ctx.stroke();
        ctx.fill();
        ctx.closePath();
        ctx.beginPath();
        ctx.strokeStyle = "black";
        axis(halfX, padYsmall);
        ctx.lineTo(halfX - 3, padYS);
        ctx.moveTo(halfX, padYsmall);
        ctx.lineTo(halfX + 3, padYS);
        axis(halfX, canvas.height - padYsmall);
        ctx.lineTo(halfX - 3, canvas.height-padYS);
        ctx.moveTo(halfX, canvas.height - padYsmall);
        ctx.lineTo(halfX + 3, canvas.height-padYS);
        axis(padXS, halfY);
        ctx.lineTo(padXsmall, halfY - 3);
        ctx.moveTo(padXS, halfY);
        ctx.lineTo(padXsmall, halfY + 3);
        axis(canvas.width - padXS, halfY);
        ctx.lineTo(canvas.width - padXsmall, halfY - 3);
        ctx.moveTo(canvas.width - padXS, halfY);
        ctx.lineTo(canvas.width - padXsmall, halfY + 3);
        ctx.stroke();
        ctx.closePath();
        ctx.fillStyle = "black";
        ctx.strokeStyle = "black";
        ctx.font = (valueR*5.5 > 11) ? "11pt Arial" : valueR*5.5 + "pt Arial";
        ctx.fillText("0", halfX - valueR*5, halfY + valueR*7);
        ctx.fillText(valueR/2, halfX - valueR*2 + valueR/2.0*mult, halfY + valueR*7);
        ctx.fillText(valueR, halfX - valueR*2 + valueR*mult, halfY + valueR*7);
        ctx.fillText(valueR, halfX + valueR*2, halfY + valueR*3 - valueR*mult);
        ctx.fillText(valueR/2, halfX + valueR*2, halfY + valueR*3 - valueR*mult/2);
        ctx.fillText(-valueR, halfX - valueR*5 - valueR*mult, halfY + valueR*7);
        ctx.fillText(-valueR/2, halfX - valueR*5 - valueR/2*mult, halfY + valueR*7);
        ctx.fillText(-valueR, halfX + valueR*2, halfY + valueR*2 + valueR*mult);
        ctx.fillText(-valueR/2, halfX + valueR*2, halfY + valueR*2 + valueR*mult/2);
        ctx.moveTo(halfX - valueR*mult, halfY - 3);
        ctx.lineTo(halfX - valueR*mult, halfY + 3);
        ctx.moveTo(halfX - valueR/2*mult, halfY - 3);
        ctx.lineTo(halfX - valueR/2*mult, halfY + 3);
        ctx.moveTo(halfX + valueR/2*mult, halfY - 3);
        ctx.lineTo(halfX + valueR/2*mult, halfY + 3);
        ctx.moveTo(halfX + valueR*mult, halfY - 3);
        ctx.lineTo(halfX + valueR*mult, halfY + 3);
        ctx.moveTo(halfX - 3, halfY - valueR*mult);
        ctx.lineTo(halfX + 3, halfY - valueR*mult);
        ctx.moveTo(halfX - 3, halfY - valueR/2*mult);
        ctx.lineTo(halfX + 3, halfY - valueR/2*mult);
        ctx.moveTo(halfX - 3, halfY + valueR/2*mult);
        ctx.lineTo(halfX + 3, halfY + valueR/2*mult);
        ctx.moveTo(halfX - 3, halfY + valueR*mult);
        ctx.lineTo(halfX + 3, halfY + valueR*mult);
        ctx.stroke();

    };
    printCanvas(2);
</script>

<audio src="resources/music/ariel.mp3" autoplay loop controls></audio>
<img src="resources/images/graph.jpg" width="22%" height="16%" alt="Not found"/>
<table id="tableRes" cellpadding="3%" border="1%">
  <tbody id="tbody">
  <tr>
    <td style="width: 5%;"> X </td>
    <td style="width: 5%;"> Y </td>
    <td style="width: 5%;"> R </td>
    <td style="width: 5%;"> Попадание </td>
  </tr>
  </tbody>
</table>
<script>
    document.getElementById("SelR").onchange = function (event) {
        var k = document.getElementById("SelR").options.selectedIndex;
        var R = document.getElementById("SelR").options[k].value;
        printCanvas(R);
    };
    var req = new XMLHttpRequest();
    req.open('POST', 'sesBegin', true);
    req.onreadystatechange = function () {
        if(req.readyState===4 && req.status === 200){
            var rows = JSON.parse(req.responseText);
            var table = document.getElementById("tbody");
            for(var i=0; i<rows.length; i++){
                var tr = document.createElement("tr");
                var x = document.createElement("td");
                x.innerText = rows[i].x;
                var y = document.createElement("td");
                y.innerText = rows[i].y;
                var r = document.createElement("td");
                r.innerText = rows[i].r;
                var isHit = document.createElement("td");
                isHit.innerText = rows[i].isHit;
                tr.appendChild(x);
                tr.appendChild(y);
                tr.appendChild(r);
                tr.appendChild(isHit);
                table.appendChild(tr);
            }
        }
    };
    req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    req.send();
    window.addEventListener('load', function () {
        document.getElementById('ok').onclick = function (event) {
            var a = /^-?[0-9]+(.[0-9]+)?$/;
            if(!(a.test(document.getElementById('__x').value) && ((Number(document.getElementById('__x').value)<=5)
                    && (Number(document.getElementById('__x').value)>=-5)))){
                alert('Введите корректный X!');
                return;
            }
            var selectedVal=-1;
            var radios = document.getElementsByName("radio");
            for(var i=0; i<radios.length;i++){
                if(radios[i].checked) {
                    selectedVal = radios[i].value;
                    break;
                }
            }
            if(selectedVal === -1) {
                alert("Введите корректный Y!");
                return;
            }
            var n = document.getElementById("SelR").options.selectedIndex;
            var r = document.getElementById("SelR").options[n].value;
            var request = new XMLHttpRequest();
            request.open('POST', 'controller', true);
            request.onreadystatechange = function () {
                if(request.readyState===4 && request.status === 200){
                    if(request.responseText === 'error') {
                        alert(request.responseText);
                    } else {
                        var rows = JSON.parse(request.responseText);
                        var table = document.getElementById("tbody");
                        var tr = document.createElement("tr");
                        var x = document.createElement("td");
                        x.innerText = rows.x;
                        var y = document.createElement("td");
                        y.innerText = rows.y;
                        var r = document.createElement("td");
                        r.innerText = rows.r;
                        var isHit = document.createElement("td");
                        isHit.innerText = rows.isHit;
                        tr.appendChild(x);
                        tr.appendChild(y);
                        tr.appendChild(r);
                        tr.appendChild(isHit);
                        table.appendChild(tr);
                        var example = document.getElementById("canvas"),
                            ctx = example.getContext('2d');
                        ctx.beginPath();

                        if (rows.isHit.toString().charAt(0) === 't') {
                            document.body.setAttribute('style', 'background-image: url(ariel.gif);');
                            ctx.fillStyle = "yellow";
                        } else {
                            document.body.setAttribute('style', 'background-image: url(ariel2.gif);');
                            ctx.fillStyle = "red";
                        }
                        ctx.arc((rows.x*(example.width/10)+example.width/2), (-rows.y*(example.width/10)+example.height/2), 2, 2*Math.PI, 0, true);
                        ctx.fill();
                        ctx.closePath();
                    }
                }
            };
            request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            request.send('x=' + encodeURIComponent(document.getElementById('__x').value)
                + '&y=' + encodeURIComponent(selectedVal.toString())
                + '&r=' + encodeURIComponent(r));
        }
    });
    var canvas = document.getElementById("canvas");
    canvas.onclick = function (event) {
        var n = document.getElementById("SelR").options.selectedIndex;
        var r = document.getElementById("SelR").options[n].value;
        var x = (event.offsetX-canvas.width/2)/(canvas.width/10);
        var y = (event.offsetY-canvas.height/2)/(-canvas.width/10);
        var request = new XMLHttpRequest();
        request.open('POST', 'controller', true);
        request.onreadystatechange = function () {
            if (request.readyState === 4 && request.status === 200) {
                if (request.responseText === 'error') {
                    alert('Возможно вы тыкнули туда, куда не надо было тыкать!');
                } else {
                    var rows = JSON.parse(request.responseText);
                    var table = document.getElementById("tbody");
                    var tr = document.createElement("tr");
                    var xd = document.createElement("td");
                    xd.innerText = rows.x;
                    var yd = document.createElement("td");
                    yd.innerText = rows.y;
                    var rd = document.createElement("td");
                    rd.innerText = rows.r;
                    var isHit = document.createElement("td");
                    isHit.innerText = rows.isHit;
                    tr.appendChild(xd);
                    tr.appendChild(yd);
                    tr.appendChild(rd);
                    tr.appendChild(isHit);
                    table.appendChild(tr);

                    var example = document.getElementById("canvas"),
                        ctx = example.getContext('2d');
                    ctx.beginPath();

                    if (rows.isHit.toString().charAt(0) === 't') {
                        document.body.setAttribute('style', 'background-image: url(ariel.gif);');
                        ctx.fillStyle = "yellow";
                    } else {
                        document.body.setAttribute('style', 'background-image: url(ariel2.gif);');
                        ctx.fillStyle = "red";
                    }
                    ctx.arc(event.offsetX, event.offsetY, 2, 2*Math.PI, 0, true);
                    ctx.fill();
                    ctx.closePath();
                }
            }
        };
        request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        request.send('x=' + encodeURIComponent(x.toString())
            + '&y=' + encodeURIComponent(y.toString())
            + '&r=' + encodeURIComponent(r.toString()));
    }
</script>
</body>
</html>