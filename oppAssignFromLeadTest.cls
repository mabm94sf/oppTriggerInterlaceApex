@isTest
public class oppAssignFromLeadTest
{
    static TestMethod void testOppAssignFromLead()
    {
        Lead l = new Lead(LastName = 'Lead1', Company = 'Lead1 company', Importe__c = 5200, Tipo_de_proyecto__c = 'Venta');
        insert l;
        Database.LeadConvert lc = new Database.LeadConvert();
		LeadStatus cs = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
		lc.setConvertedStatus(cs.MasterLabel);
        Test.startTest();
        lc.setLeadId(l.id);
        Database.LeadConvertResult lcr = Database.convertLead(lc);
        System.assert(lcr.isSuccess());

        l = new Lead(LastName = 'Lead2', Company = 'Lead2 company', Importe__C = 20001, Tipo_de_proyecto__c = 'Venta');
        insert l;
        lc = new Database.LeadConvert();
        cs = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
		lc.setConvertedStatus(cs.MasterLabel);
        lc.setLeadId(l.id);
        lcr = Database.convertLead(lc);
        System.assert(lcr.isSuccess());

        l = new Lead(LastName = 'Lead3', Company = 'Lead3 company', Importe__C = 100500, Tipo_de_proyecto__c = 'Venta');
        insert l;
        lc = new Database.LeadConvert();
        cs = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
		lc.setConvertedStatus(cs.MasterLabel);
        lc.setLeadId(l.id);
        lcr = Database.convertLead(lc);
        System.assert(lcr.isSuccess());

        l = new Lead(LastName = 'Lead4 renta', Company = 'Lead4 company', Importe__C = 100, Tipo_de_proyecto__c = 'Renta');
        insert l;
        lc = new Database.LeadConvert();
        cs = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
		lc.setConvertedStatus(cs.MasterLabel);
        lc.setLeadId(l.id);
        lcr = Database.convertLead(lc);
        System.assert(lcr.isSuccess());

        l = new Lead(LastName = 'Lead5 renta', Company = 'Lead5 company', Importe__C = 100000.50, Tipo_de_proyecto__c = 'Renta');
        insert l;
        lc = new Database.LeadConvert();
        cs = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
		lc.setConvertedStatus(cs.MasterLabel);
        lc.setLeadId(l.id);
        lcr = Database.convertLead(lc);
        System.assert(lcr.isSuccess());

        l = new Lead(LastName = 'Lead6 renta', Company = 'Lead4 company', Importe__C = 500020, Tipo_de_proyecto__c = 'Renta');
        insert l;
        lc = new Database.LeadConvert();
        cs = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
		lc.setConvertedStatus(cs.MasterLabel);
        lc.setLeadId(l.id);
        lcr = Database.convertLead(lc);
        System.assert(lcr.isSuccess());

        try
        {
        l = new Lead(LastName = 'Lead7', Company = 'Lead7 company', Importe__C = 500020);
        insert l;
        lc = new Database.LeadConvert();
        cs = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
		lc.setConvertedStatus(cs.MasterLabel);
        lc.setLeadId(l.id);
        lcr = Database.convertLead(lc);
        }
        catch(Exception e)
        {
            //checar qué contiene la cadena para hacer assert
            System.assertEquals(e.getMessage(),
            'ConvertLead failed. First exception on row 0; first error: FIELD_CUSTOM_VALIDATION_EXCEPTION, Validation error on Lead: No se ha especificado el tipo de proyecto.: []');
        }

        Test.stopTest();
    }

}
