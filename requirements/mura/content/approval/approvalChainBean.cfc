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
            ";
        qs.addParam(name="publicPoolID", value=site.getPublicUserPoolID(), cfsqltype='cf_sql_varchar');
        qs.addParam(name="privatePoolID", value=site.getPrivateUserPoolID(), cfsqltype='cf_sql_varchar');
        qs.addParam(name="chainID", value=getValue('chainID'), cfsqltype='cf_sql_varchar');
        qs.setSQL(sql);

        var it=getBean('userIterator');
        it.setQuery(qs.execute().getResult());
        return it;

    }
    
}