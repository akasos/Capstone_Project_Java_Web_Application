$(function() {
    fetchSubmittedProposals();
});

const tableBuilder1 = (proposalList) => {
    const tableBodyElm = $("#submitted");
    if (jQuery.isArray(proposalList)) {
        proposalList.map((p) => {
            tableBodyElm.append(`
            <tr>
                <td data-label="Title">${p.name}</td>
                <td data-label="Submitter">${p.user}</td>
                <td data-label="Department">${p.department}</td>
                <td data-label="Proposal Year">${p.year}</td>
                <td data-label="Submission Date">${moment().format("MM/DD/YY hh:mm A",p.submitDate)}</td>
                <td data-label="Status">${p.status}</td>
                <td><button class="btn my-btn" onclick="window.location.href = '/eRSPG/reviewer/reviewProposal?id=' + ${p.id}">Review</button></td>
            </tr>
           `);
    });
    }
};

const fetchSubmittedProposals = () => {
    jQuery.ajax({
        dataType: 'json',
        url: '/eRSPG/committee/reviewAssignedProposal',
        success: (data) => {
        console.log('success!');
    tableBuilder1(data);
},
    error: function() {
        console.error('error!');
    },
});
};
