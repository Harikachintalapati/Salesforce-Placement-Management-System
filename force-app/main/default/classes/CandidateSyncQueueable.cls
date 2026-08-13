public class CandidateSyncQueueable implements Queueable, Database.AllowsCallouts {

    private Id recordId;

    public CandidateSyncQueueable(Id recId){
        this.recordId = recId;
    }

    public void execute(QueueableContext context){

        System.debug('Queueable Running');

        Application__c app = [
            SELECT Id, Name
            FROM Application__c
            WHERE Id = :recordId
        ];

        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Recruitment_API/posts');
        req.setMethod('POST');
        req.setHeader('Content-Type','application/json');

        req.setBody('{"name":"' + app.Name + '"}');

        Http http = new Http();
        HttpResponse res = http.send(req);

        app.Last_Attempt__c = System.now();

        if(res.getStatusCode() == 200 || res.getStatusCode() == 201){

            Map<String, Object> responseMap = 
                (Map<String, Object>) JSON.deserializeUntyped(res.getBody());

            if(responseMap.containsKey('id')){
                app.External_Candidate_ID__c = 
                    String.valueOf(responseMap.get('id'));
            }

            app.Integration_Status__c = 'Sent';

        } else {
            app.Integration_Status__c = 'Failed';
            app.Error_Message__c = res.getBody();
        }

        // 🔥 MUST
        update app;
    }
}