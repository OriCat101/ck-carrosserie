component extends='core.mura.cfobject' {
  
  
  public void function onApplicationLoad() {
    //  ==================== START PAGE / default ==================== 
    local.subType = application.configBean.getClassExtensionManager().getSubTypeBean();
    local.subType.setType('Page');
    local.subType.setSubtype('default');
    local.subType.setSiteId('praxisgemeinschaft');
    local.subType.load();

    local.subType.setIconClass('mi-file-o');
    local.subType.setHasAssocFile(1);
    local.subType.setHasSummary(1);
    local.subType.setHasBody(1);
    local.subType.setBaseTable('tcontent');
    local.subType.setBaseKeyField('contentHistId');
    local.subType.save();

    //  EXTENDED ATTRIBUTES SET 1 
    local.extendSet = local.subType.getExtendSetByName('Erweiterungen');
    local.extendSet.setContainer('Basic');
    local.extendSet.setOrderNo(1);
    local.extendSet.save();

      local.orderNo = 1;
      local.attribute = local.extendSet.getAttributeByName('SURTITLE');
      local.attribute.setLabel('Übertittel');
      local.attribute.setType('textbox');
      local.attribute.setRequired(false);
      local.attribute.setMessage("Bitte erfassen Sie einen Übertittel");
      local.attribute.setOrderNo(local.orderNo);
      local.attribute.save();

    //  EXTENDED ATTRIBUTES SET 1 
    local.extendSet = local.subType.getExtendSetByName('Button');
    local.extendSet.setContainer('Basic');
    local.extendSet.setOrderNo(2);
    local.extendSet.save();

      local.orderNo = 1;
      local.attribute = local.extendSet.getAttributeByName('buttonText');
      local.attribute.setLabel('Anzeigetext');
      local.attribute.setType('textbox');
      local.attribute.setRequired(false);
      local.attribute.setMessage("Bitte erfassen Sie einen Anzeigetext");
      local.attribute.setOrderNo(local.orderNo);
      local.attribute.save();

      local.orderNo += 1;
      local.attribute = local.extendSet.getAttributeByName('buttonLink');
      local.attribute.setLabel('URL');
      local.attribute.setType('textbox');
      local.attribute.setRequired(false);
      local.attribute.setMessage("Bitte erfassen Sie eine URL");
      local.attribute.setOrderNo(local.orderNo);
      local.attribute.save();
  }
}