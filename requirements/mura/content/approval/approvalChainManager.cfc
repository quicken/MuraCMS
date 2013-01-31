component extends="mura.cfobject" {
	
	function getRequestFeed(siteID){
		return getBean('beanFeed').setBean('approvalRequest').setTable('tapprovalrequests').setSiteID(arguments.siteID);
	}

	function getChainFeed(siteID){
		return getBean('beanFeed').setBean('approvalChain').setTable('tapprovalchains').setSiteID(arguments.siteID);
	}

	function getActionFeed(siteID){
		return getBean('beanFeed').setBean('approvalAction').setTable('tapprovalactions').setSiteID(arguments.siteID);
	}

	function getAssignmentFeed(siteID){
		return getBean('beanFeed').setBean('approvalAssignment').setTable('tapprovalassignments').setSiteID(arguments.siteID);
	}
	
}