component extends='core.mura.cfobject' {
  
  
  public void function onApplicationLoad() {
    //  ==================== START FOLDER / Slideshow ==================== 
    local.subType = application.configBean.getClassExtensionManager().getSubTypeBean();
    local.subType.setType('Folder');
    local.subType.setSubtype('Slideshow');
    local.subType.setSiteId('praxisgemeinschaft');
    local.subType.load();

    local.subType.setIconClass('mi-folder-open-o');
    local.subType.setHasAssocFile(0);
    local.subType.setHasSummary(0);
    local.subType.setHasBody(0);
    local.subType.setAvailableSubtypes('File/Default');
    local.subType.setBaseTable('tcontent');
    local.subType.setBaseKeyField('contentHistId');
    local.subType.save();
    //  ==================== END FOLDER / Slideshow ==================== 
  }

  // mura event 
  public void function onAfterFolderSlideshowSave() {
    cfparam(name="request.onBeforeFolderSlideshowSave", default=true);
    if (request.onBeforeFolderSlideshowSave) {
      request.onBeforeFolderSlideshowSave = false;
      local.remoteId = "#lCase(m.content().getParent().get('contentid'))#-slideshow";
      local.content = m.getBean('content').loadBy(contentid = form.contentid, siteid  = m.event('siteid'));
  
      local.content.setType('Folder');
      local.content.setSubtype('Slideshow');
      local.content.setParentID(local.content.getParentID());
      local.content.setTitle('Slideshow');
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