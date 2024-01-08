component extends='core.mura.cfobject' {

  public void function onApplicationLoad() {
    //  ==================== START PAGE / TeamMember ==================== 
    local.subType = application.configBean.getClassExtensionManager().getSubTypeBean();
    local.subType.setType('Page');
    local.subType.setSubtype('TeamMember');
    local.subType.setSiteId('praxisgemeinschaft');
    local.subType.load();

    local.subType.setIconClass('mi-user');
    local.subType.setHasAssocFile(1);
    local.subType.setHasSummary(0);
    local.subType.setHasBody(0);
    local.subType.setBaseTable('tcontent');
    local.subType.setBaseKeyField('contentHistId');
    local.subType.save();

    //  EXTENDED ATTRIBUTES SET 1 
    local.extendSet = local.subType.getExtendSetByName('Über das Teammitglied');
    local.extendSet.setContainer('Basic');
    local.extendSet.setOrderNo(1);
    local.extendSet.save();
    local.orderNo = 1;

      local.orderNo += 1;
      local.attribute = local.extendSet.getAttributeByName('EMAIL');
      local.attribute.setLabel('Kontaktadresse');
      local.attribute.setType('text');
      local.attribute.setValidation('none');
      local.attribute.setRequired(false);
      local.attribute.setMessage("");
      local.attribute.setOrderNo(local.orderNo);
      local.attribute.save();
    
      local.orderNo += 1;
      local.attribute = local.extendSet.getAttributeByName('SPECIALS');
      local.attribute.setLabel('Spezialisierung');
      local.attribute.setType('htmlEditor');
      local.attribute.setRequired(false);
      local.attribute.setMessage("");
      local.attribute.setOrderNo(local.orderNo);
      local.attribute.save();

      local.orderNo += 1;
      local.attribute = local.extendSet.getAttributeByName('HISTORY');
      local.attribute.setLabel('Werdegang');
      local.attribute.setType('htmlEditor');
      local.attribute.setRequired(false);
      local.attribute.setMessage("");
      local.attribute.setOrderNo(local.orderNo);
      local.attribute.save();

      local.orderNo += 1;
      local.attribute = local.extendSet.getAttributeByName('MEMBERIN');
      local.attribute.setLabel('Mitgliedschaften');
      local.attribute.setType('htmlEditor');
      local.attribute.setRequired(false);
      local.attribute.setMessage("");
      local.attribute.setOrderNo(local.orderNo);
      local.attribute.save();

      local.orderNo += 1;
      local.attribute = local.extendSet.getAttributeByName('PAPERS');
      local.attribute.setLabel('Publikation');
      local.attribute.setType('htmlEditor');
      local.attribute.setRequired(false);
      local.attribute.setMessage("");
      local.attribute.setOrderNo(local.orderNo);
      local.attribute.save();
  }
}