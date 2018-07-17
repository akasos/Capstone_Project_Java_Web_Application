/**
 * Created by iNaS2 on 12/1/2017.
 */
function updateProposalDepartment() {

    var semesterID;
    console.log("hello");
    console.log($('#departmentID').val());
    console.log($('#semesterID p').text());
    console.log($('#year p').text());

    if($('#semesterID p').text() == "Fall")
        semesterID = 1;
    else if($('#semesterID p').text() == "Spring")
        semesterID = 2;
    else
        semesterID = 3;


    $(function () {
        $.ajax({
            type: "POST",
            url: '/eRSPG/proposalDepartmentData',
            data: {
                department: $('#departmentID').val(),
                semester: semesterID,
                year: $('#year p').text()

            },
            datatype: 'json',
            cache: false,
            success: function (data) {
                console.log("Proposal department updated");
            }
        });
        return false;
    });
}

/*$(function () {
    $('#departmentID').on("blur", updateProposalDepartment);
    $('#semesterID').on("blur", updateProposalDepartment);
    $('#year').on("blur", updateProposalDepartment);

})*/