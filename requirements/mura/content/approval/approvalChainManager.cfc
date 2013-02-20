component extends="mura.cfobject" {
	
	function getRequestFeed(siteID){
		return getBean('beanFeed').setBeanClass('approvalRequest').setTable('tapprovalrequests').setSiteID(arguments.siteID);
	}

	function getChainFeed(siteID){
		return getBean('beanFeed').setBeanClass('approvalChain').setTable('tapprovalchains').setSiteID(arguments.siteID);
	}

	function getActionFeed(siteID){
		return getBean('beanFeed').setBeanClass('approvalAction').setTable('tapprovalactions').setSiteID(arguments.siteID);
	}

	function getAssignmentFeed(siteID){
		return getBean('beanFeed').setBeanClass('approvalAssignment').setTable('tapprovalassignments').setSiteID(arguments.siteID);
	}
	
}