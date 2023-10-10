@isTest
public with sharing class TestLanguageCourseTrigger {
    static testMethod void testAfterInsert() {
        // Create test data
        Language_Course_Instructor__c courseInstructor = new Language_Course_Instructor__c(Name = 'Mohammed Uzair');
        insert courseInstructor;
        List<Language_Course__c> languageCourses = new List<Language_Course__c>();
        languageCourses.add(new Language_Course__c(Name = 'English Course', Course_Instructor__c = courseInstructor.Id));
        languageCourses.add(new Language_Course__c(Name = 'Spanish Course', Course_Instructor__c = courseInstructor.Id));

        // Insert the test data
        Test.startTest();
        insert languageCourses;
        Test.stopTest();
    }
}


/*
public class TestLanguageCourseTrigger {
    // Test method for after insert trigger
    static testMethod void testAfterInsert() {
        // Create test data
        List<Language_Course__c> languageCourses = new List<Language_Course__c>();
        languageCourses.add(new Language_Course__c(Name = 'English Course', Language__c = 'English'));
        languageCourses.add(new Language_Course__c(Name = 'Spanish Course', Language__c = 'Spanish'));

        // Insert the test data
        Test.startTest();
        insert languageCourses;
        Test.stopTest();

        // Perform assertions as needed for the expected behavior
        // For example, check debug logs
        List<LogEntry> logs = [SELECT Id, Application, Status, Message FROM ApexLog WHERE Application = 'LanguageCourseTrigger' AND Status = 'FINISHED'];
        System.assertEquals(1, logs.size(), 'Expected one debug log entry');
    }

    // Test method for after update trigger
    static testMethod void testAfterUpdate() {
        // Create test data
        Language_Course__c languageCourse = new Language_Course__c(Name = 'German Course', Language__c = 'German');
        insert languageCourse;

        // Update the test data
        languageCourse.Name = 'Updated German Course';

        Test.startTest();
        update languageCourse;
        Test.stopTest();

        // Perform assertions as needed for the expected behavior
        // For example, check debug logs
        List<LogEntry> logs = [SELECT Id, Application, Status, Message FROM ApexLog WHERE Application = 'LanguageCourseTrigger' AND Status = 'FINISHED'];
        System.assertEquals(1, logs.size(), 'Expected one debug log entry');
    }

    // Test method for after delete trigger
    static testMethod void testAfterDelete() {
        // Create test data
        Language_Course__c languageCourse = new Language_Course__c(Name = 'French Course', Language__c = 'French');
        insert languageCourse;

        Test.startTest();
        delete languageCourse;
        Test.stopTest();

        // Perform assertions as needed for the expected behavior
        // For example, check debug logs
        List<LogEntry> logs = [SELECT Id, Application, Status, Message FROM ApexLog WHERE Application = 'LanguageCourseTrigger' AND Status = 'FINISHED'];
        System.assertEquals(1, logs.size(), 'Expected one debug log entry');
    }
}
*/