# Step Functions

https://aws.amazon.com/step-functions/faqs/

Q: When should I use AWS Step Functions vs. Amazon SQS?

You should consider AWS Step Functions when you need to coordinate service components in the development of highly scalable and auditable applications. You should consider using Amazon Simple Queue Service (Amazon SQS), when you need a reliable, highly scalable, hosted queue for sending, storing, and receiving messages between services. Step Functions keeps track of all tasks and events in an application. Amazon SQS requires you to implement your own application-level tracking, especially if your application uses multiple queues. The Step Functions Console and visibility APIs provide an application-centric view that lets you search for executions, drill down into an execution’s details, and administer executions. Amazon SQS requires implementing such additional functionality. Step Functions offers several features that facilitate application development, such as passing data between tasks and flexibility in distributing tasks. Amazon SQS requires you to implement some application-level functionality. While you can use Amazon SQS to build basic workflows to coordinate your distributed application, you can get this facility out-of-the-box with Step Functions, alongside other application-level capabilities.
