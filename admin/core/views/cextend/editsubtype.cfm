<!--- This file is part of Mura CMS.

Mura CMS is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, Version 2 of the License.

Mura CMS is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Mura CMS. If not, see <http://www.gnu.org/licenses/>.

Linking Mura CMS statically or dynamically with other modules constitutes the preparation of a derivative work based on 
Mura CMS. Thus, the terms and conditions of the GNU General Public License version 2 ("GPL") cover the entire combined work.

However, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with programs
or libraries that are released under the GNU Lesser General Public License version 2.1.

In addition, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with 
independent software modules (plugins, themes and bundles), and to distribute these plugins, themes and bundles without 
Mura CMS under the license of your choice, provided that you follow these specific guidelines: 

Your custom code 

• Must not alter any default objects in the Mura CMS database and
• May not alter the default display of the Mura CMS logo within Mura CMS and
• Must not alter any files in the following directories.

 /admin/
 /tasks/
 /config/
 /requirements/mura/
 /Application.cfc
 /index.cfm
 /MuraProxy.cfc

You may copy and distribute Mura CMS with a plug-in, theme or bundle that meets the above guidelines as a combined work 
under the terms of GPL for Mura CMS, provided that you include the source code of that other code when and as the GNU GPL 
requires distribution of source code.

For clarity, if you create a modified version of Mura CMS, you are not obligated to grant this special exception for your 
modified version; it is your choice whether to do so, or to make such modified version available under the GNU General Public License 
version 2 without this exception.  You may, if you choose, apply this exception to your own modified versions of Mura CMS.
--->
<cfinclude template="js.cfm">
<cfset typeList="1^tusers^userID^tclassextenddatauseractivity,2^tusers^userID^tclassextenddatauseractivity,Address^tuseraddresses^addressID^tclassextenddatauseractivity,Page^tcontent^contentHistID^tclassextenddata,Folder^tcontent^contentHistID^tclassextenddata,File^tcontent^contentHistID^tclassextenddata,Calendar^tcontent^contentHistID^tclassextenddata,Gallery^tcontent^contentHistID^tclassextenddata,Link^tcontent^contentHistID^tclassextenddata,Component^tcontent^contentHistID^tclassextenddata,Custom^custom^ID^tclassextenddata,Site^tsettings^baseID^tclassextenddata,Base^tcontent^contentHistID^tclassextenddata"/>
<cfset subType=application.classExtensionManager.getSubTypeByID(rc.subTypeID)>
<h1><cfif len(rc.subTypeID)>Edit<cfelse>Add</cfif> Class Extension</h1>

<cfoutput>
<div id="nav-module-specific" class="btn-group">
<a class="btn" href="index.cfm?muraAction=cExtend.listSubTypes&siteid=#URLEncodedFormat(rc.siteid)#"><i class="icon-circle-arrow-left"></i> Back to Class Extensions</a>
</div>

<form class="fieldset-wrap" novalidate="novalidate" name="subTypeFrm" method="post" action="index.cfm" onsubit="return validateForm(this);">

	<div class="fieldset">
		<div class="control-group">
	<div class="span4">
		<label class="control-label">Base Type</label>
		<div class="controls"><select name="typeSelector" id="typeSelector" required="true" message="The BASE CLASS field is required." onchange="extendManager.setBaseInfo(this.value);">
			<option value="">Select</option>
			<cfloop list="#typeList#" index="t"><option value="#t#" <cfif listFirst(t,'^') eq subType.getType()>selected</cfif>>#application.classExtensionManager.getTypeAsString(listFirst(t,'^'))#</option></cfloop>
			</select>
			</div>
		</div>
		<div class="span4 subTypeContainer"<cfif subtype.getType() eq "Site"> style="display:none;"</cfif>>
			<label class="control-label">Sub Type</label>
			<div class="controls">
				<input class="span12" name="subType" id="subType" type="text" value="#HTMLEditFormat(subType.getSubType())#" required="true" maxlength="25"/>
			</div>
		</div>
		
		
	</div>
	
	<div class="control-group"<cfif subtype.getType() eq "Site"> style="display:none;"</cfif>>
		<div class="span4 SubTypeIconSelect">
			<label class="control-label">Icon</label>
              <div class="btn-group">
                <button class="btn"><i class="icon-flag icon-large"></i></button>
                <button class="btn dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button>

				    <ul class="dropdown-menu">
				      <li><i class="icon-adjust"></i></li>
				      <li><i class="icon-asterisk"></i></li>
				      <li><i class="icon-ban-circle"></i></li>
				      <li><i class="icon-bar-chart"></i></li>
				      <li><i class="icon-barcode"></i></li>
				      <li><i class="icon-beaker"></i></li>
				      <li><i class="icon-beer"></i></li>
				      <li><i class="icon-bell"></i></li>
				      <li><i class="icon-bell-alt"></i></li>
				      <li><i class="icon-bolt"></i></li>
				      <li><i class="icon-book"></i></li>
				      <li><i class="icon-bookmark"></i></li>
				      <li><i class="icon-bookmark-empty"></i></li>
				      <li><i class="icon-briefcase"></i></li>
				      <li><i class="icon-bullhorn"></i></li>
				      <li><i class="icon-calendar"></i></li>
				      <li><i class="icon-camera"></i></li>
				      <li><i class="icon-camera-retro"></i></li>
				      <li><i class="icon-certificate"></i></li>
				      <li><i class="icon-check"></i></li>
				      <li><i class="icon-check-empty"></i></li>
				      <li><i class="icon-circle"></i></li>
				      <li><i class="icon-circle-blank"></i></li>
				      <li><i class="icon-cloud"></i></li>
				      <li><i class="icon-cloud-download"></i></li>
				      <li><i class="icon-cloud-upload"></i></li>
				      <li><i class="icon-coffee"></i></li>
				      <li><i class="icon-cog"></i></li>
				      <li><i class="icon-cogs"></i></li>
				      <li><i class="icon-comment"></i></li>
				      <li><i class="icon-comment-alt"></i></li>
				      <li><i class="icon-comments"></i></li>
				      <li><i class="icon-comments-alt"></i></li>
				      <li><i class="icon-credit-card"></i></li>
				      <li><i class="icon-dashboard"></i></li>
				      <li><i class="icon-desktop"></i></li>
				      <li><i class="icon-download"></i></li>
				      <li><i class="icon-download-alt"></i></li>
				      <li><i class="icon-edit"></i></li>
				      <li><i class="icon-envelope"></i></li>
				      <li><i class="icon-envelope-alt"></i></li>
				      <li><i class="icon-exchange"></i></li>
				      <li><i class="icon-exclamation-sign"></i></li>
				      <li><i class="icon-external-link"></i></li>
				      <li><i class="icon-eye-close"></i></li>
				      <li><i class="icon-eye-open"></i></li>
				      <li><i class="icon-facetime-video"></i></li>
				      <li><i class="icon-fighter-jet"></i></li>
				      <li><i class="icon-film"></i></li>
				      <li><i class="icon-filter"></i></li>
				      <li><i class="icon-fire"></i></li>
				      <li><i class="icon-flag"></i></li>
				      <li><i class="icon-folder-close"></i></li>
				      <li><i class="icon-folder-open"></i></li>
				      <li><i class="icon-folder-close-alt"></i></li>
				      <li><i class="icon-folder-open-alt"></i></li>
				      <li><i class="icon-food"></i></li>
				      <li><i class="icon-gift"></i></li>
				      <li><i class="icon-glass"></i></li>
				      <li><i class="icon-globe"></i></li>
				      <li><i class="icon-group"></i></li>
				      <li><i class="icon-hdd"></i></li>
				      <li><i class="icon-headphones"></i></li>
				      <li><i class="icon-heart"></i></li>
				      <li><i class="icon-heart-empty"></i></li>
				      <li><i class="icon-home"></i></li>
				      <li><i class="icon-inbox"></i></li>
				      <li><i class="icon-info-sign"></i></li>
				      <li><i class="icon-key"></i></li>
				      <li><i class="icon-leaf"></i></li>
				      <li><i class="icon-laptop"></i></li>
				      <li><i class="icon-legal"></i></li>
				      <li><i class="icon-lemon"></i></li>
				      <li><i class="icon-lightbulb"></i></li>
				      <li><i class="icon-lock"></i></li>
				      <li><i class="icon-unlock"></i></li>
				      <li><i class="icon-magic"></i></li>
				      <li><i class="icon-magnet"></i></li>
				      <li><i class="icon-map-marker"></i></li>
				      <li><i class="icon-minus"></i></li>
				      <li><i class="icon-minus-sign"></i></li>
				      <li><i class="icon-mobile-phone"></i></li>
				      <li><i class="icon-money"></i></li>
				      <li><i class="icon-move"></i></li>
				      <li><i class="icon-music"></i></li>
				      <li><i class="icon-off"></i></li>
				      <li><i class="icon-ok"></i></li>
				      <li><i class="icon-ok-circle"></i></li>
				      <li><i class="icon-ok-sign"></i></li>
				      <li><i class="icon-pencil"></i></li>
				      <li><i class="icon-picture"></i></li>
				      <li><i class="icon-plane"></i></li>
				      <li><i class="icon-plus"></i></li>
				      <li><i class="icon-plus-sign"></i></li>
				      <li><i class="icon-print"></i></li>
				      <li><i class="icon-pushpin"></i></li>
				      <li><i class="icon-qrcode"></i></li>
				      <li><i class="icon-question-sign"></i></li>
				      <li><i class="icon-quote-left"></i></li>
				      <li><i class="icon-quote-right"></i></li>
				      <li><i class="icon-random"></i></li>
				      <li><i class="icon-refresh"></i></li>
				      <li><i class="icon-remove"></i></li>
				      <li><i class="icon-remove-circle"></i></li>
				      <li><i class="icon-remove-sign"></i></li>
				      <li><i class="icon-reorder"></i></li>
				      <li><i class="icon-reply"></i></li>
				      <li><i class="icon-resize-horizontal"></i></li>
				      <li><i class="icon-resize-vertical"></i></li>
				      <li><i class="icon-retweet"></i></li>
				      <li><i class="icon-road"></i></li>
				      <li><i class="icon-rss"></i></li>
				      <li><i class="icon-screenshot"></i></li>
				      <li><i class="icon-search"></i></li>
				      <li><i class="icon-share"></i></li>
				      <li><i class="icon-share-alt"></i></li>
				      <li><i class="icon-shopping-cart"></i></li>
				      <li><i class="icon-signal"></i></li>
				      <li><i class="icon-signin"></i></li>
				      <li><i class="icon-signout"></i></li>
				      <li><i class="icon-sitemap"></i></li>
				      <li><i class="icon-sort"></i></li>
				      <li><i class="icon-sort-down"></i></li>
				      <li><i class="icon-sort-up"></i></li>
				      <li><i class="icon-spinner"></i></li>
				      <li><i class="icon-star"></i></li>
				      <li><i class="icon-star-empty"></i></li>
				      <li><i class="icon-star-half"></i></li>
				      <li><i class="icon-tablet"></i></li>
				      <li><i class="icon-tag"></i></li>
				      <li><i class="icon-tags"></i></li>
				      <li><i class="icon-tasks"></i></li>
				      <li><i class="icon-thumbs-down"></i></li>
				      <li><i class="icon-thumbs-up"></i></li>
				      <li><i class="icon-time"></i></li>
				      <li><i class="icon-tint"></i></li>
				      <li><i class="icon-trash"></i></li>
				      <li><i class="icon-trophy"></i></li>
				      <li><i class="icon-truck"></i></li>
				      <li><i class="icon-umbrella"></i></li>
				      <li><i class="icon-upload"></i></li>
				      <li><i class="icon-upload-alt"></i></li>
				      <li><i class="icon-user"></i></li>
				      <li><i class="icon-user-md"></i></li>
				      <li><i class="icon-volume-off"></i></li>
				      <li><i class="icon-volume-down"></i></li>
				      <li><i class="icon-volume-up"></i></li>
				      <li><i class="icon-warning-sign"></i></li>
				      <li><i class="icon-wrench"></i></li>
				      <li><i class="icon-zoom-in"></i></li>
				      <li><i class="icon-zoom-out"></i></li>
				      
				      <li><i class="icon-file"></i></li>
				      <li><i class="icon-file-alt"></i></li>
				      <li><i class="icon-cut"></i></li>
				      <li><i class="icon-copy"></i></li>
				      <li><i class="icon-paste"></i></li>
				      <li><i class="icon-save"></i></li>
				      <li><i class="icon-undo"></i></li>
				      <li><i class="icon-repeat"></i></li>
				      <li><i class="icon-text-height"></i></li>
				      <li><i class="icon-text-width"></i></li>
				      <li><i class="icon-align-left"></i></li>
				      <li><i class="icon-align-center"></i></li>
				      <li><i class="icon-align-right"></i></li>
				      <li><i class="icon-align-justify"></i></li>
				      <li><i class="icon-indent-left"></i></li>
				      <li><i class="icon-indent-right"></i></li>
				      <li><i class="icon-font"></i></li>
				      <li><i class="icon-bold"></i></li>
				      <li><i class="icon-italic"></i></li>
				      <li><i class="icon-strikethrough"></i></li>
				      <li><i class="icon-underline"></i></li>
				      <li><i class="icon-link"></i></li>
				      <li><i class="icon-paper-clip"></i></li>
				      <li><i class="icon-columns"></i></li>
				      <li><i class="icon-table"></i></li>
				      <li><i class="icon-th-large"></i></li>
				      <li><i class="icon-th"></i></li>
				      <li><i class="icon-th-list"></i></li>
				      <li><i class="icon-list"></i></li>
				      <li><i class="icon-list-ol"></i></li>
				      <li><i class="icon-list-ul"></i></li>
				      <li><i class="icon-list-alt"></i></li>
      
				      <li><i class="icon-angle-left"></i></li>
				      <li><i class="icon-angle-right"></i></li>
				      <li><i class="icon-angle-up"></i></li>
				      <li><i class="icon-angle-down"></i></li>
				      <li><i class="icon-arrow-down"></i></li>
				      <li><i class="icon-arrow-left"></i></li>
				      <li><i class="icon-arrow-right"></i></li>
				      <li><i class="icon-arrow-up"></i></li>
				      <li><i class="icon-caret-down"></i></li>
				      <li><i class="icon-caret-left"></i></li>
				      <li><i class="icon-caret-right"></i></li>
				      <li><i class="icon-caret-up"></i></li>
				      <li><i class="icon-chevron-down"></i></li>
				      <li><i class="icon-chevron-left"></i></li>
				      <li><i class="icon-chevron-right"></i></li>
				      <li><i class="icon-chevron-up"></i></li>
				      <li><i class="icon-circle-arrow-down"></i></li>
				      <li><i class="icon-circle-arrow-left"></i></li>
				      <li><i class="icon-circle-arrow-right"></i></li>
				      <li><i class="icon-circle-arrow-up"></i></li>
				      <li><i class="icon-double-angle-left"></i></li>
				      <li><i class="icon-double-angle-right"></i></li>
				      <li><i class="icon-double-angle-up"></i></li>
				      <li><i class="icon-double-angle-down"></i></li>
				      <li><i class="icon-hand-down"></i></li>
				      <li><i class="icon-hand-left"></i></li>
				      <li><i class="icon-hand-right"></i></li>
				      <li><i class="icon-hand-up"></i></li>
				      <li><i class="icon-circle"></i></li>
				      <li><i class="icon-circle-blank"></i></li>

				      <li><i class="icon-play-circle"></i></li>
				      <li><i class="icon-play"></i></li>
				      <li><i class="icon-pause"></i></li>
				      <li><i class="icon-stop"></i></li>
				      <li><i class="icon-step-backward"></i></li>
				      <li><i class="icon-fast-backward"></i></li>
				      <li><i class="icon-backward"></i></li>
				      <li><i class="icon-forward"></i></li>
				      <li><i class="icon-fast-forward"></i></li>
				      <li><i class="icon-step-forward"></i></li>
				      <li><i class="icon-eject"></i></li>
				      <li><i class="icon-fullscreen"></i></li>
				      <li><i class="icon-resize-full"></i></li>
				      <li><i class="icon-resize-small"></i></li>
      
				      <li><i class="icon-phone"></i></li>
				      <li><i class="icon-phone-sign"></i></li>
				      <li><i class="icon-facebook"></i></li>
				      <li><i class="icon-facebook-sign"></i></li>
				      <li><i class="icon-twitter"></i></li>
				      <li><i class="icon-twitter-sign"></i></li>
				      <li><i class="icon-github"></i></li>
				      <li><i class="icon-github-alt"></i></li>
				      <li><i class="icon-github-sign"></i></li>
				      <li><i class="icon-linkedin"></i></li>
				      <li><i class="icon-linkedin-sign"></i></li>
				      <li><i class="icon-pinterest"></i></li>
				      <li><i class="icon-pinterest-sign"></i></li>
				      <li><i class="icon-google-plus"></i></li>
				      <li><i class="icon-google-plus-sign"></i></li>
				      <li><i class="icon-sign-blank"></i></li>
				      		      
					  <li><i class="icon-ambulance"></i></li>
					  <li><i class="icon-beaker"></i></li>
					  <li><i class="icon-h-sign"></i></li>
					  <li><i class="icon-hospital"></i></li>
					  <li><i class="icon-medkit"></i></li>
					  <li><i class="icon-plus-sign-alt"></i></li>
					  <li><i class="icon-stethoscope"></i></li>
					  <li><i class="icon-user-md"></i></li>
				      
				    </ul>
              </div><!-- /btn-group -->

	</div>
	</div>
	
		<div class="control-group">
	<label class="control-label">Description</label>
	<div class="controls"><textarea name="description" id="description" rows="6" class="span12">#HTMLEditFormat(subtype.getDescription())#</textarea></div>
	</div>
		
		<div class="control-group hasSummaryContainer">
		<div class="span4">
			<label class="control-label">Show "Summary" field when editing?</label>
			<div class="controls">
			<label class="radio inline"><input name="hasSummary" type="radio" class="radio inline" value="1"<cfif subType.gethasSummary() eq 1 >Checked</cfif>>Yes</label>
			<label class="radio inline"><input name="hasSummary" type="radio" class="radio inline" value="0"<cfif subType.gethasSummary() eq 0 >Checked</cfif>>No</label>
			</div>
		</div>
	
	<div class="span4 hasBodyContainer">
		<label class="control-label">Show "Body" field when editing?</label>
		<div class="controls"> 
			<label class="radio inline"><input name="hasBody" type="radio" class="radio inline" value="1"<cfif subType.gethasBody() eq 1 >Checked</cfif>>Yes</label>
			<label class="radio inline"><input name="hasBody" type="radio" class="radio inline" value="0"<cfif subType.gethasBody() eq 0 >Checked</cfif>>No</label>
		</div>
	</div>
	
	<div class="span4">
			<label class="control-label">Status</label>
			<div class="controls">
					<label class="radio inline"><input name="isActive" type="radio" class="radio inline" value="1"<cfif subType.getIsActive() eq 1 >Checked</cfif>>Active</label>
				<label class="radio inline"><input name="isActive" type="radio" class="radio inline" value="0"<cfif subType.getIsActive() eq 0 >Checked</cfif>>Inactive</label>
			</div>
		</div>
</div>
	
		<cfset rsSubTypes=application.classExtensionManager.getSubTypes(siteID=rc.siteID,activeOnly=true) />
		<div class="control-group">
			<div class="span6 availableSubTypesContainer" >
			<label class="control-label">Allow users to add only specific subtypes?</label>
			<div class="controls"> 
				<label class="radio inline" ><input name="hasAvailableSubTypes" type="radio" class="radio inline" value="1" <cfif len(subType.getAvailableSubTypes())>checked </cfif>
				onclick="javascript:toggleDisplay2('rg',true);">Yes</label>
				<label class="radio inline"><input name="hasAvailableSubTypes" type="radio" class="radio inline" value="0" <cfif not len(subType.getAvailableSubtypes())>checked </cfif>
				onclick="javascript:toggleDisplay2('rg',false);">No</label>
			</div>
			<div class="controls" id="rg"<cfif not len(subType.getAvailableSubTypes())> style="display:none;"</cfif>>
				<select name="availableSubTypes" size="8" multiple="multiple" class="multiSelect" id="availableSubTypes">
				<cfloop list="Page,Folder,Calendar,Gallery,File,Link" index="i">
					<option value="#i#/Default" <cfif listFindNoCase(subType.getAvailableSubTypes(),'#i#/Default')> selected</cfif>>#i#/Default</option>
					<cfquery name="rsItemTypes" dbtype="query">
					select * from rsSubTypes where lower(type)='#lcase(i)#' and lower(subtype) != 'default'
					</cfquery>
					<cfset _AvailableSubTypes=subType.getAvailableSubTypes()>
					<cfloop query="rsItemTypes">
					<option value="#i#/#rsItemTypes.subType#" <cfif listFindNoCase(_AvailableSubTypes,'#i#/#rsItemTypes.subType#')> selected</cfif>>#i#/#rsItemTypes.subType#</option>
					</cfloop>
				</cfloop>
				</select>			
			</div>
		</div>
	
	<div class="form-actions">
	<cfif not len(rc.subTypeID)>
		<input type="button" class="btn" onclick="submitForm(document.forms.subTypeFrm,'add');" value="Add" />
		<input type=hidden name="subTypeID" value="#createuuid()#">
	<cfelse>
		<input type="button" class="btn" onclick="submitForm(document.forms.subTypeFrm,'delete','Delete Class Extension?');" value="Delete" />
		<input type="button" class="btn" onclick="submitForm(document.forms.subTypeFrm,'update');" value="Update" />
		<input type=hidden name="subTypeID" value="#subType.getsubtypeID()#">
	</cfif>
	</div>

<input type="hidden" name="action" value="">
<input name="muraAction" value="cExtend.updateSubType" type="hidden">
<input name="siteID" value="#HTMLEditFormat(rc.siteid)#" type="hidden">
<input type="hidden" name="baseTable" value="#subType.getBaseTable()#"/>
<input type="hidden" name="baseKeyField" value="#subType.getBaseKeyField()#" />
<input type="hidden" name="type" value="#subType.getType()#"/>
<input type="hidden" name="dataTable" value="#subType.getDataTable()#" />

</form>

<script>
extendManager.setBaseInfo(jQuery('##typeSelector').val());
</script>
</cfoutput>
