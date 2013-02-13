var chainManager={
	setGroupAssignmentSort: function() {
		$("#groupAvailableListSort, #groupAssignmentListSort").sortable({
			connectWith: ".groupDisplayListSortOptions",
			update: function(event,ui) {
				event.stopPropagation();
				if(ui.item.parents("ul:first").attr("id") =='groupAssignmentListSort'){
					ui.item.attr('name','assignmentID');
				} else {
					ui.item.attr('name','availableID');
				}
			}
		}).disableSelection();
	}
};