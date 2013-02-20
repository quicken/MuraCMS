component extends="mura.bean.beanORM"  table="tapprovalchains"{

	property name="chainID" fieldtype="id";
    property name="name" type="string" length="100";
    property name="description" type="text";
    property name="created" type="timestamp";
    property name="lastupdate" type="timestamp";
    property name="lastupdateby" type="string" length=50;
    property name="lastupdatebyid" type="string" dataType="char" length=35;
    property name="assignments" singularname="assignment" fieldtype="one-to-many" cfc="approvalChainAssignmentBean" orderby="orderno asc" cascade="delete";
    property name="requests" singularname="request" fieldtype="one-to-many" cfc="approvalRequestBean" orderby="created asc" cascade="delete";
    property name="site" fieldtype="many-to-one" cfc="site" fkcolumn="siteID";


    function getAvailableGroupsIterator(){
        var site=getBean('settingsManager').getSite(getValue('siteID'));
        var qs = new Query();
        var sql="
            select * from tusers 
            where type=1 and (isPublic=1 and siteid = :publicPoolID or isPublic=0 and siteid = :privatePoolID )
            and inactive=0 
            and userID not in (select groupID from tapprovalassignments where chainid = :chainID)
            and groupname != 'admin'
            order by tusers.groupname
            ";
        qs.addParam(name="publicPoolID", value=site.getPublicUserPoolID(), cfsqltype='cf_sql_varchar');
        qs.addParam(name="privatePoolID", value=site.getPrivateUserPoolID(), cfsqltype='cf_sql_varchar');
        qs.addParam(name="chainID", value=getValue('chainID'), cfsqltype='cf_sql_varchar');
        qs.setSQL(sql);

        var it=getBean('userIterator');
        it.setQuery(qs.execute().getResult());
        return it;

    }


    function save(){

        //writeDump(var=getValue('groupID'),abort=true);
        if(valueExists('groupID')){
            var groupID=getValue('groupID');
            var deleteID='';
            var assignments=getBean('approvalChain')
                .loadBy(chainID=getValue('chainID'))
                .getAssignmentsIterator();
            var assignment='';
            var firstID='';

            while(assignments.hasNext()){
                assignment=assignments.next();

                if(not listFindNoCase(groupID,assignment.getGroupID())){
                    deleteID=listAppend(deleteID,assignment.getAssignmentID());
                }
            }

            //writeDump(var=groupID);
            for(var i=1; i lte listLen(groupID); i=i+1){
                assignment=getBean('approvalChainAssignment')
                    .loadBy(chainID=getValue('chainID'), groupID=listGetAt(groupID,i))
                    .setOrderNo(i)
                    .save();


                //writeDump(var=assignment.getAssignmentID());
  
                if(i eq 1){
                    firstID=assignment.getGroupID();
                }
                
            }
            //abort;
            //writeDump(var=deleteID,abort=true);

            if(len(deleteID)){
                for(i=1; i lte listLen(deleteID); i=i+1){
                    var qs = new Query();
                    var sql="
                        update tapprovalrequests set groupID= :firstID
                        where chainid = :chainID
                        and groupID= :groupID
                        ";
                    qs.addParam(name="groupID", value=listGetAt(deleteID,i), cfsqltype='cf_sql_varchar');
                    qs.addParam(name="firstID", value=firstID, cfsqltype='cf_sql_varchar');
                    qs.addParam(name="chainID", value=getValue('chainID'), cfsqltype='cf_sql_varchar');
                    qs.setSQL(sql).execute();

                    getBean('approvalChainAssignment').loadBy(assignmentID=listGetAt(deleteID,i)).delete();

                }
            }

        }

        return super.save();
    }
    
}