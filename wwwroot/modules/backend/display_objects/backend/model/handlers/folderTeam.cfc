component extends='core.mura.cfobject' {
  
  
  public void function onApplicationLoad() {
    //  ==================== START FOLDER / TEAM ==================== 
    local.subType = application.configBean.getClassExtensionManager().getSubTypeBean();
    local.subType.setType('Folder');
    local.subType.setSubtype('Team');
    local.subType.setSiteId('praxisgemeinschaft');
    local.subType.load();

    local.subType.setIconClass('mi-folder-open-o');
    local.subType.setHasAssocFile(0);
    local.subType.setHasSummary(0);
    local.subType.setHasBody(0);
    local.subType.setAvailableSubtypes('Page/TeamMember');
    local.subType.setBaseTable('tcontent');
    local.subType.setBaseKeyField('contentHistId');
    local.subType.save();
    //  ==================== END FOLDER / TEAM ==================== 
  }

  // mura event 
  public void function onAfterFolderTeamSave() {
    cfparam(name="request.onBeforeFolderSectionsSave", default=true);
    if (request.onBeforeFolderSectionsSave) {
      request.onBeforeFolderSectionsSave = false;
      local.remoteId = "#lCase(m.content().getParent().get('contentid'))#-teammembers";
      local.content = m.getBean('content').loadBy(contentid = form.contentid, siteid  = m.event('siteid'));
  
      local.content.setType('Folder');
      local.content.setSubtype('Team');
      local.content.setParentID(local.content.getParentID());
      local.content.setTitle('Team');
      local.content.setRemoteId(local.remoteId);
      local.content.setIsNav(0);
      local.content.setDisplay(0);
      local.content.setMenuTitle('');
      local.content.setHTMLTitle('');
      local.content.setURLTitle('');
      local.content.save();	
    }
  }
}