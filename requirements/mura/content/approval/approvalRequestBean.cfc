component extends="mura.bean.beanORM"  table="tapprovalrequests"{

	property name="requestID" fieldtype="id";
    property name="created" type="timestamp";
    property name="status" type="String" default="Pending";
    property name="approvalChain" fieldtype="many-to-one" cfc="approvalChainBean" fkcolumn="chainID";
    property name="content" fieldtype="many-to-one" cfc="contentBean" fkcolumn="contentHistID";
    property name="user" fieldtype="many-to-one" cfc="user" fkcolumn="userID";
    property name="site" fieldtype="many-to-one" cfc="settingBean" fkcolumn="siteID";
    property name="group" fieldtype="many-to-one" cfc="user" fkcolumn="groupID";
    property name="actions" singularname="action" fieldtype="one-to-many" cfc="approvalActionBean" orderby="created asc" cascade="delete";

    function approve(comments){
    	
    	if(getValue('status') eq 'Pending'){
	    	getBean('approvalAction').loadBy(requestID=getValue('requestID'), groupID=getValue('groupID'))
		    	.setComments(arguments.comments)
		    	.setActionType('Approval')
		    	.setUserID(getCurrentUser().getUserID())
		    	.setChainID(getValue('chainID'))
		    	.save();

	    	var memberships=getBean('approvalChain').loadBy(chainID=getValue('chainID')).getMembershipsIterator();

	    	if(memberships.hasNext()){
	    		
		    	do {
		    		var membership=memberships.next();
		    		
		    		//writeLog(text=membership.getGroupID() & ' ' & getValue('groupID'));	
		    		
		    		if(membership.getGroupID() eq getValue('groupID')){
		    			
		    			if(memberships.hasNext()){
		    				setValue('groupID',memberships.next().getGroupID());
		    				save();
							
		    			} else {
		    				setValue('status','Approved');
		    				save();
		    				
		    				var content=getBean('content').loadBy(contentHistID=getValue('contentHistID'));
					      	var sourceid=getValue('contentHistID');
		    				if(not len(content.getChangesetID())){
						      	
						      	setValue(
						      		'contentHistID', 
						      		content
							      		.setApproved(1)
							      		.save()
							      		.getContentHistID()
						      	);
						      	save();

						      	var source=getBean('content').loadBy(contenthistid=sourceid);
						      	
						      	if(not source.getIsNew()){
						      		source.deleteVersion();
						      	}
						      	
						     }
					      	
		    			}

		    			var content=getBean('content').loadBy(contenthistid=getValue('contenthistid'),siteid=getValue('siteid'));
		    			getBean('contentManager').purgeContentCache(contentBean=content);

		    			break;
		    		}
		    	} while (memberships.hasNext());

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
		}

    	return this;
    }

    function reject(comments){
	    if(getValue('status') eq 'Pending'){
	    	getBean('approvalAction').loadBy(requestID=getValue('requestID'), groupID=getValue('groupID'))
		    	.setComments(arguments.comments)
		    	.setActionType('Rejection')
		    	.setUserID(getCurrentUser().getUserID())
		    	.setChainID(getValue('chainID'))
		    	.save();

			setValue('status','Rejected');
	    	save();
	    	var content=getBean('content').loadBy(contenthistid=getValue('contenthistid'),siteid=getValue('siteid'));
	    	getBean('contentManager').purgeContentCache(contentBean=content);
 		}
    	return this;
    }

    function cancel(comments){
	    if(getValue('status') eq 'Pending'){
	    	getBean('approvalAction').loadBy(requestID=getValue('requestID'), groupID=getValue('groupID'))
		    	.setComments(arguments.comments)
		    	.setActionType('Cancelation')
		    	.setUserID(getCurrentUser().getUserID())
		    	.setChainID(getValue('chainID'))
		    	.save();

			setValue('status','Cancelled');
	    	save();
	    	var content=getBean('content').loadBy(contenthistid=getValue('contenthistid'),siteid=getValue('siteid'));
	    	getBean('contentManager').purgeContentCache(contentBean=content);
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