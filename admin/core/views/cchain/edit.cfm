<cfset rc.chain=$.getBean('approvalChain').loadBy(chainid=rc.chainID)/>
<cfinclude template="js.cfm">
<cfoutput>
<cfif not len(rc.chainid)>
	<h1>#application.rbFactory.getKeyValue(session.rb,"approvalchains.addapprovalchain")#</h1>
<cfelse>
	<h1>#application.rbFactory.getKeyValue(session.rb,"approvalchains.editapprovalchain")#</h1>
</cfif>

<div id="nav-module-specific" class="btn-group">
	<a class="btn" href="index.cfm?muraAction=cchain.list&siteid=#URLEncodedFormat(rc.siteid)#"><i class="icon-circle-arrow-left"></i> #application.rbFactory.getKeyValue(session.rb,'approvalchains.backtoapprovalchains')#</a>
</div>

<cfif not structIsEmpty(rc.chain.getErrors())>
    <div class="alert alert-error">#application.utility.displayErrors(rc.chain.getErrors())#</div>
</cfif>

<form class="fieldset-wrap" novalidate="novalidate" action="index.cfm?muraAction=cchains.save" method="post" name="form1" onsubmit="return validateForm(this);">
<div class="fieldset">
<div class="control-group">
  <label class="control-label">
    #application.rbFactory.getKeyValue(session.rb,'approvalchains.name')#
  </label>
  <div class="controls">
  <input name="name" type="text" class="span12" required="true" message="#application.rbFactory.getKeyValue(session.rb,'approvalchains.namerequired')#" value="#HTMLEditFormat(rc.chain.getName())#" maxlength="50">
   </div>
</div>

<div class="control-group">
  <label class="control-label">
    #application.rbFactory.getKeyValue(session.rb,'approvalchains.description')#
  </label>
  <div class="controls">
  <textarea name="description" class="span12" rows="6">#HTMLEditFormat(rc.chain.getDescription())#</textarea>
  </div>
</div>


</div>
<div class="form-actions">
  <cfif rc.chainID eq ''>
    <input type="button" class="btn" onclick="submitForm(document.forms.form1,'add');" value="#application.rbFactory.getKeyValue(session.rb,'approvalchains.add')#" /><input type=hidden name="chainID" value="">
  <cfelse>
    <input type="button" class="btn" value="#application.rbFactory.getKeyValue(session.rb,'chains.delete')#" onclick="confirmDialog('#jsStringFormat(application.rbFactory.getKeyValue(session.rb,'approvalchains.deleteconfirm'))#','index.cfm?muraAction=cchains.delete&chainID=#rc.chain.getchainID()#&siteid=#URLEncodedFormat(rc.chain.getSiteID())#')" /> 
    <input type="button" class="btn" onclick="submitForm(document.forms.form1,'update');" value="#application.rbFactory.getKeyValue(session.rb,'approvalchains.update')#" />
     <input type=hidden name="chainID" value="#rc.chain.getchainID()#">
  </cfif>
  <input type="hidden" name="action" value="">
  <input type="hidden" name="siteid" value="#rc.chain.getSiteID()#">
</div>
</form>

</cfoutput>
