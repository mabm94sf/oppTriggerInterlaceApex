@isTest(SeeAllData=true)
private class oppAsignTest {
    static testMethod void testOppTrigger()
    {
        Opportunity newopp = new Opportunity(Name='TestTrigger 1',Amount=10000,Tipo_de_proyecto__c='Venta',OwnerId=UserInfo.getUserId(),StageName='Prospecting',CloseDate=Date.today().addDays(10));
        Test.startTest();
        insert newopp;
        newopp = new Opportunity(Name='TestTrigger 2',Amount=20000,Tipo_de_proyecto__c='Venta',OwnerId=UserInfo.getUserId(),StageName='Prospecting',CloseDate=Date.today().addDays(10));
        insert newopp;
        newopp = new Opportunity(Name='TestTrigger 3',Amount=200000,Tipo_de_proyecto__c='Venta',OwnerId=UserInfo.getUserId(),StageName='Prospecting',CloseDate=Date.today().addDays(10));
        insert newopp;
        newopp = new Opportunity(Name='TestTrigger 4',Amount=20000,Tipo_de_proyecto__c='Renta',OwnerId=UserInfo.getUserId(),StageName='Prospecting',CloseDate=Date.today().addDays(10));
        insert newopp;
        newopp = new Opportunity(Name='TestTrigger 5',Amount=200000,Tipo_de_proyecto__c='Renta',OwnerId=UserInfo.getUserId(),StageName='Prospecting',CloseDate=Date.today().addDays(10));
        insert newopp;
        newopp = new Opportunity(Name='TestTrigger 6',Amount=2000000,Tipo_de_proyecto__c='Renta',OwnerId=UserInfo.getUserId(),StageName='Prospecting',CloseDate=Date.today().addDays(10));
        insert newopp;
        Opportunity newopp1 = new Opportunity(Name='TestTrigger 6',Amount=2000000,OwnerId=UserInfo.getUserId(),StageName='Prospecting',CloseDate=Date.today().addDays(10));
        insert newopp1;
        Test.stopTest();
    }
}