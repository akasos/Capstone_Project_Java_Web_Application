/**
 * Created by iNaS2 on 12/1/2017.
 */

function updateProposalDetail() {
    $(function () {
            $.ajax({
                type: "POST",
                url: '/eRSPG/proposalDetailData',
                data: {
                    'title': $('#proposalTitle').val(),
                    'director': $('#projectDirector').val(),
                    'email': $('#proposalEmail').val(),
                    'mailCode': $('#proposalMailCode').val(),
                    'extension': $('#proposalExtension').val()
                },
                datatype: 'json',
                cache: false,
                success: (data) => {
                    console.log("Proposal detail updated")
                }
            })
            return false;
    });
}

$(function () {
    $('#proposalTitle').on("blur", updateProposalDetail);
    $('#projectDirector').on("blur", updateProposalDetail);
    $('#proposalEmail').on("blur", updateProposalDetail);
    $('#proposalMailCode').on("blur", updateProposalDetail);
    $('#proposalExtension').on("blur", updateProposalDetail);
});


$(document).ready(function() {





    $("#submit-form").on("click",function(event) {

        event.preventDefault();


        //Retrieving Reviewer Comments
        var jsonComments = [];
        $("td.reviewerComments").each(function() {
            var cellText = $(this).html();
            jsonComments.push(cellText);
        });

        var jsonComments1 = []
        for(var i = 0; i < jsonComments.length; i++)
        {
            var objectComments = {
                firstName: document.getElementById("userFirstName").value,
                lastName: document.getElementById("userLastName").value,
                date: getDate(),
                comment: jsonComments[i]
            }

            jsonComments1.push(objectComments);

        }

          //Retrieving Reviewer Score
          var json1 = [];

          var j = 0;
          var p = 1;
          var k = 4;

          for(var i = 0; i < 5; i++)
          {
              for(j; j < p; j++)
              var objectScores = {

                  scoreValue: parseInt(document.getElementById((1 + j).toString()).value),

                  scoreId: parseInt(document.getElementById((2 + j).toString()).value),

                  reviewerId: parseInt(document.getElementById((3 + j).toString()).value),

                  scoreboxId: parseInt(document.getElementById((4 + j).toString()).value)

              }
              j = k;
              k += 4;
              p = j + 1;
              json1.push(objectScores);
          }


        //Retrieving Reviewer
        var reviewer = {

            userId: document.getElementById("21").value,
            proposalId: document.getElementById("22").value

        }

        //Wrapper Object
        var objectWrapper = {

                     scores: json1,
                   reviewer: reviewer,
            comments: jsonComments1
        }


        console.log(objectWrapper);
        $.ajax({
            type: "post",
            url: "/eRSPG/reviewer/reviewerScores",
            data: JSON.stringify(objectWrapper),
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