var chainManager={
	setGroupAssignmentSort: function() {
		$("#groupAvailableListSort, #groupAssignmentListSort").sortable({
			connectWith: ".groupDisplayListSortOptions",
			update: function(event) {
				event.stopPropagation();
				$("#assignedGroups").val("");
				$("#groupAssignmentListSort > li").each(function() {
					var current = $("#groupDisplayList").val();

					if(current != '') {
						$("#assignedGroups").val(current + "," + $.trim($(this).html()));
					} else {
						$("#assignedGroups").val($.trim($(this).html()));
					}

				});
			}
		}).disableSelection();
	}
};