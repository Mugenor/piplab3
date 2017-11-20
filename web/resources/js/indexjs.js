    function changeX(x) {
        document.getElementById('form:pseudoX').value = x.toString();
    }

    function changeR() {
        var r = document.getElementById('form:r_hidden').value;
        if(r==0) r=1;
        document.getElementById('form:pseudoR').value = r;
    }

    var selectedButton;
    document.getElementById('buttons').onclick = function () {
        if (!event.target.classList.contains('Xclass')) return;
        if (selectedButton) {
            selectedButton.classList.remove('highlight');
        }
        selectedButton = event.target;
        selectedButton.classList.add('highlight');
    };

    function contains(str, char) {
        for (var i = 0; str.length > i; i++) {
            if (str.charAt(i) == char) return true;
        }
        return false;
    }

    var canvas = document.getElementById("canvas");
    var ctx = canvas.getContext('2d');
    var mult = canvas.width / 11;
    var halfX = canvas.width / 2;
    var halfY = canvas.height / 2;

    function printPoint(x, y, color) {
        x = Number(x);
        y = Number(y);
        ctx.beginPath();
        ctx.moveTo(canvas.width / 2.0 + x * mult, canvas.height / 2.0 - y * mult);
        ctx.fillStyle = color;
        ctx.arc(canvas.width / 2.0 + x * mult, canvas.height / 2.0 - y * mult, 3, 0, 2.0 * Math.PI, true);
        ctx.fill();
        ctx.closePath();
    }

    function axis(x, y) {
        ctx.moveTo(halfX, halfY);
        ctx.lineTo(x, y);
    }

    var printCanvas = function (valueR) {
        var padXS = canvas.width / 15;
        var padYS = canvas.height / 10;
        var padXsmall = canvas.width / 25;
        var padYsmall = canvas.height / 20;
        ctx.beginPath();
        ctx.fillStyle = "white";
        ctx.fillRect(0, 0, canvas.width, canvas.height);
        ctx.closePath();
        ctx.fillStyle = "#22b9ff";
        ctx.strokeStyle = "#22b9ff";
        ctx.beginPath();
        ctx.moveTo(halfX, halfY);
        ctx.lineTo(halfX, halfY - valueR * mult / 2.0);
        ctx.lineTo(halfX - valueR * mult, halfY);
        ctx.lineTo(halfX, halfY);
        ctx.rect(halfX - valueR * mult, halfY, valueR * mult, valueR * mult / 2.0);
        ctx.moveTo(halfX, halfY);
        ctx.arc(halfX, halfY, valueR * mult, 1 / 2 * Math.PI, 0, true);
        ctx.stroke();
        ctx.fill();
        ctx.closePath();
        ctx.beginPath();
        ctx.fillStyle = "black";
        ctx.strokeStyle = "black";
        axis(halfX, padYsmall);
        ctx.lineTo(halfX - 3, padYS);
        ctx.moveTo(halfX, padYsmall);
        ctx.lineTo(halfX + 3, padYS);
        axis(halfX, canvas.height - padYsmall);
        axis(padXS, halfY);
        axis(canvas.width - padXS, halfY);
        ctx.lineTo(canvas.width - padXS - padXsmall, halfY - 3);
        ctx.moveTo(canvas.width - padXS, halfY);
        ctx.lineTo(canvas.width - padXS - padXsmall, halfY + 3);
        ctx.stroke();
        ctx.font = "11pt Arial";
        ctx.fillText("X", canvas.width - padXS - padXsmall + 3, halfY + padYsmall);
        ctx.fillText("Y", halfX - padXsmall + 3, padYS - 3);
        ctx.closePath();
        ctx.fillStyle = "black";
        ctx.strokeStyle = "black";
        ctx.font = (valueR * 5.5 > 11) ? "11pt Arial" : valueR * 5.5 + "pt Arial";
        // ctx.font = (valueR*5.5 ? 7) ? "10pt Arial" : valueR*5.5 + "pt Arial";
        //КАК ИСПОЛЬЗОВАТЬ ЗНАК МЕНЬШЕ В JSF?
        ctx.fillText("0", halfX - valueR * 5, halfY + valueR * 7);
        ctx.fillText(valueR / 2, halfX - valueR * 2 + valueR / 2.0 * mult, halfY + valueR * 7);
        ctx.fillText(valueR, halfX - valueR * 2 + valueR * mult, halfY + valueR * 7);
        ctx.fillText(valueR, halfX + valueR * 2, halfY + valueR * 3 - valueR * mult);
        ctx.fillText(valueR / 2, halfX + valueR * 2, halfY + valueR * 3 - valueR * mult / 2);
        ctx.fillText(-valueR, halfX - valueR * 5 - valueR * mult, halfY + valueR * 7);
        ctx.fillText(-valueR / 2, halfX - valueR * 5 - valueR / 2 * mult, halfY + valueR * 7);
        ctx.fillText(-valueR, halfX + valueR * 2, halfY + valueR * 2 + valueR * mult);
        ctx.fillText(-valueR / 2, halfX + valueR * 2, halfY + valueR * 2 + valueR * mult / 2);
        ctx.moveTo(halfX - valueR * mult, halfY - 3);
        ctx.lineTo(halfX - valueR * mult, halfY + 3);
        ctx.moveTo(halfX - valueR / 2 * mult, halfY - 3);
        ctx.lineTo(halfX - valueR / 2 * mult, halfY + 3);
        ctx.moveTo(halfX + valueR / 2 * mult, halfY - 3);
        ctx.lineTo(halfX + valueR / 2 * mult, halfY + 3);
        ctx.moveTo(halfX + valueR * mult, halfY - 3);
        ctx.lineTo(halfX + valueR * mult, halfY + 3);
        ctx.moveTo(halfX - 3, halfY - valueR * mult);
        ctx.lineTo(halfX + 3, halfY - valueR * mult);
        ctx.moveTo(halfX - 3, halfY - valueR / 2 * mult);
        ctx.lineTo(halfX + 3, halfY - valueR / 2 * mult);
        ctx.moveTo(halfX - 3, halfY + valueR / 2 * mult);
        ctx.lineTo(halfX + 3, halfY + valueR / 2 * mult);
        ctx.moveTo(halfX - 3, halfY + valueR * mult);
        ctx.lineTo(halfX + 3, halfY + valueR * mult);
        ctx.stroke();
    };

    var addPointButton = document.getElementById("form:addButton");
    canvas.onclick = function (event) {
        var x = ((event.offsetX - canvas.width / 2) / (mult)).toFixed(3);
        var y = ((event.offsetY - canvas.height / 2) / (-mult)).toFixed(3);
        var oldX = document.getElementById('form:pseudoX').value;
        var oldY = document.getElementById('form:y').value;
        document.getElementById('form:pseudoX').value = x;
        document.getElementById('form:y').value = y;
        addPointButton.onclick();
        document.getElementById('form:pseudoX').value = oldX;
        document.getElementById('form:y').value = oldY;
    };

    function repaintCanvas() {
        var currentR = Number(document.getElementById('form:pseudoR').value);
        printCanvas(currentR);
        var points = document.getElementById('form:table').lastElementChild.children;
        var r;
        for (var i = 0; points.length > i; i++) {
            r = Number(points[i].children[2].innerHTML);
            if (r == currentR) {
                printPoint(points[i].children[0].innerHTML, points[i].children[1].innerHTML,
                    contains(points[i].children[3].innerHTML, 't') ? '#1e7114' : 'red');
            }
        }
    }

    function addPoint(data) {
        var status = data.status;
        switch (status) {
            case "success":
                var lastLine = document.getElementById('form:table').lastElementChild.lastElementChild;
                var thisX = lastLine.children[0].innerHTML;
                if (thisX != '') {
                    thisX = Number(thisX);
                    var thisY = Number(lastLine.children[1].innerHTML);
                    var thisIsHitted = lastLine.children[3].innerHTML;
                    var thisR = Number(lastLine.children[2].innerHTML);
                    if (thisR === Number(document.getElementById('form:pseudoR').value)) {
                        printPoint(thisX, thisY, thisIsHitted.trim() == 'true' ? '#1e7114' : 'red');
                        document.body.setAttribute('style', thisIsHitted.trim() == 'true' ? 'background-image: url(resources/images/ariel.gif);' :
                            'background-image: url(resources/images/ariel2.gif);');
                    }
                }
                break;
        }
    }
    window.onload = function () {
        document.getElementById('form:pseudoR').value = 1;
        repaintCanvas();
        document.getElementById('buttons').children[4].click();
    };