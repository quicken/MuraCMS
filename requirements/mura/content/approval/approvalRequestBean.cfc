component extends="mura.bean.beanORM"  table="tapprovalrequests"{

	property name="requestID" fieldtype="id";
    property name="created" type="timestamp";
    property name="status" type="String" default="Pending";
    property name="approvalChain" fieldtype="many-to-one" cfc="approvalChainBean" fkcolumn="chainID";
    property name="content" fieldtype="many-to-one" cfc="approvalChainBean" fkcolumn="contentHistID";
    property name="user" fieldtype="many-to-one" cfc="user" fkcolumn="userID";
    property name="site" fieldtype="many-to-one" cfc="settingBean" fkcolumn="siteID";
    property name="group" fieldtype="many-to-one" cfc="user" fkcolumn="groupID";


    function approve(comments){

    	if(getValue('status') eq 'Pending'){
	    	getBean('approvalAction').loadBy(requestID=getValue('requestID'), groupID=getValue('groupID'))
		    	.setComments(arguments.comments)
		    	.setActionType('Approval')
		    	.save();

	    	var memberships=getBean('approvalChain').loadBy(chainID=getValue('chainID')).getMembershipsIterator();

	    	while(memberships.hasNext()){
	    		if(memberhips.getGroupID() eq getValue('groupID')){
	    			if(memberships.hasNext()){
	    				setValue('groupID',memberships.next().getGroupID());
	    				save();
	    			} else {
	    				setValue('status','Approved');
	    				save();
	    				
	    				var content=getBean('content').loadBy(contentHistID=getValue('contentHistID'));
				      	
	    				if(not len(content.getChangesetID())){
					      	
					      	setValue(
					      		'contentHistID', 
					      		content
						      		.setApproved(1)
						      		.save()
						      		.getContentHistID()
					      	);
					      	save();
					     }
				      	
	    			}

	    			break;
	    		}
	    	}
		}

    	return this;
    }

    function reject(comments){
	    if(getValue('status') eq 'Pending'){
	    	getBean('approvalAction').loadBy(requestID=getValue('requestID'), groupID=getValue('groupID'))
		    	.setComments(arguments.comments)
		    	.setActionType('Rejection')
		    	.save();

			setValue('status','Rejected');
	    	save();
 		}
    	return this;
    }

    function save(){
    	if(not len(getValue('groupID'))){
	    	var memberships=getBean('approvalChain').loadBy(chainID=getValue('chainID')).getMembershipsIterator();

	    	if(memberships.hasNext()){
	    		setValue('groupID',memberships.next().getGroupID());
	    	}
    	}
    	return super.save();
    }

}