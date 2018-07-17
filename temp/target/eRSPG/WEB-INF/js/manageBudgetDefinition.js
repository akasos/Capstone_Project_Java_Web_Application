var availableArray;
var requestedArray;
var differenceArray;

function numberOfTableRows() {
    var rows = document.getElementById("myTable").getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
     availableArray = new Array(rows);
     requestedArray = new Array(rows);
     differenceArray = new Array(rows);
     for(i = 0; i < availableArray.length; i++)
     {
         availableArray[i] = document.getElementById((i + 10).toString()).value;
         requestedArray[i] = document.getElementById((i + 20).toString()).innerHTML;
         differenceArray[i] = document.getElementById((i + 30).toString()).innerHTML;
     }
}
function resetRowValue(rowId)
{

    var availableNum = parseInt(availableArray[rowId - 10]);
    var availableValue = '$' + availableNum.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");

    document.getElementById((rowId - 10).toString()).value = availableNum;
    document.getElementById(rowId.toString()).value = availableValue;
    calculateUnallocatedFundsOnInputChanges(rowId);

}
function resetAllRowValues()
{
    for(i = 0; i < availableArray.length; i++)
    {
        var availableNum = parseInt(availableArray[i]);
        var availableValue = '$' + availableNum.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");

        var differenceNum = parseInt(differenceArray[i]);
        var differenceValue = '$' + differenceNum.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");

        document.getElementById(i.toString()).value = availableNum;
        document.getElementById((i + 10).toString()).value = availableValue;
        document.getElementById((i + 30).toString()).innerHTML = differenceValue;
    }

    calculateUnallocatedFunds();
    calculateDifference();
}

function calculateUnallocatedFunds()
{
    var totalUnallocatedFunds;
    var totalBudget = document.getElementById("totalBudget").value;
    var totalBudgetNum = Number(totalBudget.replace(/[^0-9\.-]+/g,""));

    var availableFunds = 0;

    for(i = 0; i < availableArray.length; i++)
    {
        availableFunds += parseInt(availableArray[i], 10);

    }
    totalUnallocatedFunds = (totalBudgetNum - availableFunds);
    var totalUnallocatedFundsValue = '$' + totalUnallocatedFunds.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
    document.getElementById("totalUnallocatedFunds").value = totalUnallocatedFundsValue;

}

function calculateUnallocatedFundsOnInputChanges(id)
{
    var totalUnallocatedFunds;
    var totalBudget = document.getElementById("totalBudget").value;
    var totalBudgetNum = Number(totalBudget.replace(/[^0-9\.-]+/g,""));
    var  availableFunds = 0;


    for(i = 0; i < availableArray.length; i++)
    {
      var availableFundValue = document.getElementById((i + 10).toString()).value;
      var availableNum =  Number(availableFundValue.replace(/[^0-9\.-]+/g,""));

      availableFunds += availableNum;

    }

    totalUnallocatedFunds = (totalBudgetNum - availableFunds);
    var totalUnallocatedFundsValue = '$' + totalUnallocatedFunds.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
    document.getElementById("totalUnallocatedFunds").value = totalUnallocatedFundsValue;


    calculateDifferenceOnInputChanges(id)

}

function calculateDifferenceOnInputChanges(id)
{

    var temp = parseInt(id,10) + 30;

    var availableValue = document.getElementById(id.toString()).value;
    var availableNum = Number(availableValue.replace(/[^0-9\.-]+/g,""));
    var requestValue = requestedArray[temp - 40];

    var differenceNum = availableNum - parseInt(requestValue);

    var differenceValue = '$' + differenceNum.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");


    document.getElementById((temp - 10).toString()).innerHTML = differenceValue;

}

function calculateDifference()
{
    for(i = 0; i < availableArray.length; i++)
    {
        var differenceNum = availableArray[i] - requestedArray[i];
        var differenceValue = '$' + differenceNum.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");

        document.getElementById((i + 30).toString()).innerHTML = differenceValue;

    }

}

function formatInputFields()
{
    for(i = 0; i < availableArray.length; i++)
    {
        var availableNum = parseInt(availableArray[i]);
        var availableValue = '$' + availableNum.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");

        var requestedNum = parseInt(requestedArray[i]);
        var requestValue = '$' + requestedNum.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");

        document.getElementById(i.toString()).value = availableNum;
        document.getElementById((i + 10).toString()).value = availableValue;
        document.getElementById((i + 20).toString()).innerHTML = requestValue;

    }
}

function formatNumberAfterFocusLost(id) {
    var availableValue = document.getElementById(id.toString()).value;
    var availableNum = Number(availableValue.replace(/[^0-9\.-]+/g, ""));
    var availableValue1 = '$' + availableNum.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
    document.getElementById((id - 10).toString()).value = availableNum;
    document.getElementById(id).value = availableValue1;
}


$(document).ready(function() {

    var totalBudget = document.getElementById("totalBudget").value;
    var totalBudgetNum = parseInt(totalBudget);
    document.getElementById("totalBudget").value = '$' + totalBudgetNum.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");

    numberOfTableRows();
    calculateUnallocatedFunds();
    calculateDifference();
    formatInputFields();

    $("#submit-form").on("click",function(event) {
        event.preventDefault();
        var budgetItems = jQuery("#budgetForm").serializeArray();
        var json = [];
        var j = 0;
        var k = 6;
        var p = 1;
        for (var i = 0; i < (budgetItems.length / 6); i++)
        {
            for( j; j < p; j++) {
                var object = {

                    fundAmount: budgetItems[j].value,
                    budgetFundID: budgetItems[1 + j].value,
                    budgetYear: budgetItems[2 + j].value,
                    semester: {
                        semesterId: budgetItems[3 + j].value
                    },

                    fundCategory: {
                        fundCategoryId: budgetItems[4 + j].value
                    },
                    budgetID: budgetItems[5 + j].value
                }
            }
            j = k;
            k += 6;
            p = j + 1;
            json.push(object);

        }
        console.log(json);

        var object = {
            budgetItems: json

        }

        $.ajax({
            type: "post",
            url: "/eRSPG/chair/manageBudgetDefinition",
            data: JSON.stringify(object),
            contentType: "application/json",
            /*     dataType: "json",*/
            success: function(data) {
                console.log("SUCCESS: ", data);

            },
            error : function(e) {
                console.log("ERROR: ", e);

            },

            done : function(e) {
                console.log("DONE");
            }

        });
    });

});



/*    var object = {
              budgetItems: [{
                  fundAmount: budgetItems[0].value,
                  budgetFundID: budgetItems[1].value,
                  budgetYear: parseInt(budgetItems[2].value),
                  semester: {
                      semesterId: budgetItems[3].value
                  },

                  fundCategory: {
                      fundCategoryId: budgetItems[4].value
                  },
                  budgetID: budgetItems[5].value
              }]
          }
      console.log(object.budgetYear);*/

/*var json = [];

   $('input:hidden').each(function() {

       var object = {
           fundAmount: $(this).val(),



       }
       var value = $(this).val();
       console.log(value);
   });*/


/*   for(var i = 0; i < 20; i++)
   {
       console.log(budgetItems[i]);
   }*/

/*  console.log(j);
/!*     console.log(k);*!/
   console.log(p);
console.log(object);
/!*console.log(j);*!/*/


/*
$("form").submit(function(event) {
    event.preventDefault();
    var budgetItems = jQuery("#budgetForm").serializeArray();
    var json = [];
    var j = 0;
    var k = 6;
    var p = 1;
    for (var i = 0; i < (budgetItems.length / 6); i++)
    {
        for( j; j < p; j++) {
            var object = {

                fundAmount: budgetItems[j].value,
                budgetFundID: budgetItems[1 + j].value,
                budgetYear: budgetItems[2 + j].value,
                semester: {
                    semesterId: budgetItems[3 + j].value
                },

                fundCategory: {
                    fundCategoryId: budgetItems[4 + j].value
                },
                budgetID: budgetItems[5 + j].value
            }
        }
        j = k;
        k += 6;
        p = j + 1;
        json.push(object);

    }
    console.log(json);

    var object = {
        budgetItems: json

    }

    $.ajax({
        type: "post",
        url: "/eRSPG/chair/manageBudgetDefinition",
        data: JSON.stringify(object),
        contentType: "application/json",
        /!*     dataType: "json",*!/
        success: function(data) {
            console.log("SUCCESS: ", data);

        },
        error : function(e) {
            console.log("ERROR: ", e);

        },

        done : function(e) {
            console.log("DONE");
        }

    });
});*/
