//These two global variables are used in the Jquery functions
//in order to fire the drop down menus correctly.
var year = 1;
var year1 = 2;

function changeYear(year) {
    this.year = year;
    this.year1 = year;
    document.getElementById("year").innerHTML = year;
    document.getElementById("header-year").innerHTML = year;
    document.getElementById("semester").innerHTML = "Semester " + "&nbsp;" + " <span class=\"caret\"></span>";
    document.getElementById("header-semester").innerHTML = '"  "';
    document.getElementById("semester").style.cursor = "pointer";


    $.ajax({

        type: "GET",
        url: "/eRSPG/chair/manageBudgetHistorical/" + year,
        success: function(data) {
            console.log("SUCCESS: ", data.length);
            displaySemesters(data);

        },
        error : function(e) {
            console.log("ERROR: ", e);

        },

        done : function(e) {
          console.log("DONE");
        }
    });


}

function changeSemester(semester, semesterID)
{
    document.getElementById("semester").innerHTML = semester;
    document.getElementById("header-semester").innerHTML = semester;

/*    console.log(semester);
    console.log(semesterID);*/

    $.ajax({

        type: "GET",
        url: "/eRSPG/chair/manageBudgetHistorical/" + year + "/" + semesterID,
        success: function(data) {
            console.log("SUCCESS: ", data.length);
            updateTable(data);

        },
        error : function(e) {
            console.log("ERROR: ", e);

        },
        done : function(e) {
            console.log("DONE");
        }
    });

}

function updateTable(data)
{

    $("#myTable tbody").empty();

    var a = 0;
    var b = 10;
    var c = 20;
    var d = 30;
    for(var i = 0; i < data.length; i++)
    {
        var tr = $('<tr>').append(
            $('<td>').attr('id', (a).toString()).text(data[i].fundCategoryName),
            $('<td>').attr('id', (b).toString()).text(data[i].fundAmount),
            $('<td>').attr('id', (c).toString()).text(data[i].requestedAmount),
            $('<td>').attr('id', (d).toString()).text(data[i].requestedAmount)

        );

          $("#myTable tbody").append(tr);
            a +=1;
            b +=1;
            c +=1;
            d +=1;
    }

    formatTableValues();
}

function formatTableValues()
{
    var rows = document.getElementById("myTable").getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;

    var totalBudget = 0;

    for(i = 0; i < rows; i++)
    {

        var availableNum = parseInt(document.getElementById((i + 10).toString()).innerHTML);
        var avaiableValue = '$' + availableNum.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
        document.getElementById((i + 10).toString()).innerHTML = avaiableValue;

        var requestedNum = parseInt(document.getElementById((i + 20).toString()).innerHTML);
        var requestedValue = '$' + requestedNum.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
        document.getElementById((i + 20).toString()).innerHTML = requestedValue;

        var differenceNum = availableNum - requestedNum;
        var differenceValue = '$' + differenceNum.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
        document.getElementById((i + 30).toString()).innerHTML = differenceValue;

        totalBudget += availableNum;
    }

    var totalBudgetValue = '$' + totalBudget.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
    document.getElementById("totalBudget").innerHTML = totalBudgetValue;
}


$(document).ready(function(){

    $("#year, .semester-year").mouseenter(function(){
        $(".semester-year").css("display", "block");

    });
    $("#year, .semester-year").mouseleave(function(){
        $(".dropdown-menu").css("display", "none");

    });

    $("#semester, .semester-menu").mouseenter(function(){

        if(year == year1)
        {
            $(".semester-menu").css("display", "block");
        }

    });

    $("#semester, .semester-menu").mouseleave(function(){

        if(year == year1)
        {
            $(".dropdown-menu").css("display", "none");
        }
    });


    formatTableValues();


});

function displaySemesters(data)
{
    console.log(data);

    $('#semester-menu').empty();

/*    console.log(data.length);*/

    data.forEach(function (semester) {
        addListItem(semester.semesterName, semester.semesterId)
    })

}

function addListItem(semesterName, semesterID)
{
    var node = document.createElement("LI");
    var textnode = document.createTextNode(semesterName);
    node.appendChild(textnode);
    node.addEventListener("click", function (event) {
        changeSemester(semesterName,semesterID); event.preventDefault();
    })
    document.getElementById("semester-menu").appendChild(node);
}
