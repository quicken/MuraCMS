<cfscript>
	getBean('approvalChain').checkSchema();
	getBean('approvalChainAssignment').checkSchema();
	getBean('approvalRequest').checkSchema();
	getBean('approvalAction').checkSchema();
</cfscript>